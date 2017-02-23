From: Steven Stewart-Gallus <sstewartgallus@sstewartgallus.com>
Subject: Why are kernel futexes faster than userspace wait-queues?
Date: Thu, 23 Feb 2017 13:52:44 -0800
Message-ID: <87a89ck21f.fsf@gvenglish.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

--=-=-=
Content-Type: text/plain

Hello,

I have come to this list with an interesting question.  I made a
waitqueue in userspace for experimentation purposes.  Apparently, using
raw kernel futexes seems to be faster than using a userspace wait-queue.
As well, the code displays some other odd performance characteristics.
For a start, the option using eventfds seems to be slower than pipes.

Attached is the code

--=-=-=
Content-Type: text/x-csrc
Content-Disposition: inline; filename=event_objects.c
Content-Description: Eventobjects

#define _GNU_SOURCE 1

#include <errno.h>
#include <fcntl.h>
#include <pthread.h>
#include <stdatomic.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <sys/poll.h>
#include <sys/eventfd.h>
#include <xmmintrin.h>
#include <unistd.h>

#if defined DO_FUTEX || defined PARTIAL_FUTEX
#include <linux/futex.h>
#include <sys/syscall.h>
#endif

struct node;

#define ALIGN_TO_CACHE _Alignas (64)

#if defined DO_FUTEX
struct event {
	ALIGN_TO_CACHE _Atomic(int) triggered;
};
#else
struct event {
	ALIGN_TO_CACHE _Atomic(bool) triggered;
	ALIGN_TO_CACHE _Atomic(struct node *) head;
	ALIGN_TO_CACHE _Atomic(struct node *) tail;
	ALIGN_TO_CACHE _Atomic(uint64_t) head_contention;
	ALIGN_TO_CACHE _Atomic(uint64_t) tail_contention;
};
void event_broadcast (struct event *event);
#endif
void event_initialize(struct event *event);
void event_wait (struct event *event);
void event_signal (struct event *event);

static void *producer(void * arg);
static void *consumer(void * arg);

int main()
{
	static struct event the_event;

	event_initialize(&the_event);

	pthread_t producers[20U];
	pthread_t consumers[20U];
	for (size_t ii = 0U; ii < 20U; ++ii) {
		pthread_create(&producers[ii], NULL, producer, &the_event);
		pthread_create(&consumers[ii], NULL, consumer, &the_event);
	}
	pthread_exit(NULL);
}

static void *producer(void * arg)
{
	struct event *event = arg;
	for (size_t ii = 0U; ii < 1000000U; ++ii)
		event_signal(event);
	exit(0);
}

static void *consumer(void * arg)
{
	struct event *event = arg;
	for (;;) {
		event_wait(event);
	}
}

#if defined DO_FUTEX
void event_initialize (struct event *event) {
	event->triggered = false;
}

void event_wait (struct event *event) {
	for (;;) {
		for (size_t ii = 0U; ii < 20U; ++ii) {
			bool is_triggered = atomic_exchange (&event->triggered, 0);
			if (is_triggered) {
				return;
			}
		}

		syscall(__NR_futex, &event->triggered,
		       FUTEX_WAIT_PRIVATE, 0, NULL, NULL, 0);
	}
}

void event_signal (struct event *event) {
	/* Already signaled */
	if (atomic_exchange (&event->triggered, 1))
		return;

	syscall(__NR_futex, &event->triggered, FUTEX_WAKE_PRIVATE, 1, NULL, NULL, 0);
}

#else
struct notifier;

struct node {
	ALIGN_TO_CACHE struct notifier * trigger;
	ALIGN_TO_CACHE _Atomic(struct node *) next;
};

static ALIGN_TO_CACHE _Atomic(uint64_t) free_list_contention = 0U;
static ALIGN_TO_CACHE _Atomic(struct node *) free_list = NULL;
static ALIGN_TO_CACHE _Atomic(uint64_t) notifier_free_list_contention = 0U;
static ALIGN_TO_CACHE _Atomic(struct notifier *) notifier_free_list = NULL;

/* All used once so inline */
static inline void enqueue (struct event *event, struct notifier *notifier);
static inline struct notifier * dequeue (struct event *event);

static inline struct node * allocate (void);
static inline void deallocate (struct node *node);

static inline struct notifier * allocate_notifier (void);
static inline void deallocate_notifier (struct notifier *node);

static inline void notifier_signal(struct notifier *notifier);
static inline void notifier_wait(struct notifier *notifier);

/* Very small so inline */
static inline void on_failure(_Atomic(uint64_t) *contention);
static inline void on_success(_Atomic(uint64_t) *contention);

void event_initialize (struct event *event) {
	struct node *n = aligned_alloc(_Alignof (struct node), sizeof *n);
	if (!n)
		abort();
	n->next = NULL;
	event->head = n;
	event->tail = n;
	event->head_contention = 0U;
	event->tail_contention = 0U;
}

void event_wait (struct event *event) {
	bool is_triggered;

	is_triggered = atomic_exchange (&event->triggered, false);
	if (is_triggered) {
		return;
	}

	struct notifier *notifier = allocate_notifier();

	enqueue (event, notifier);

	notifier_wait(notifier);

	deallocate_notifier (notifier);
}

void event_broadcast (struct event *event) {
	atomic_store (&event->triggered, true);

	for (;;) {
		struct notifier *notifier = dequeue (event);
		if (0 == notifier)
			break;

		notifier_signal(notifier);
	}
}

void event_signal (struct event *event) {
	atomic_store (&event->triggered, true);

	struct notifier *notifier = dequeue (event);
	if (!notifier)
		return;

	notifier_signal(notifier);
}

static void *from(void *node)
{
	return (void *)((uintptr_t)node & 0xFFFFFFFFFFFFU);
}

static uint32_t tag(void *node)
{
	return (uintptr_t)node >> 48U;
}

static void *to(void *node, uint32_t tag)
{
	return (void *)((uintptr_t)node | (uint64_t)tag << 48U);
}

void enqueue (struct event *event, struct notifier *trigger)
{
	struct node *tail;
	struct node *tail_again;
	struct node *next;

	struct node *node = allocate ();
	node->trigger = trigger;
	node->next = NULL;

	for (;;) {
		for (;;) {
			tail = atomic_load (&event->tail);
			next = atomic_load (&((struct node*)from (tail))->next);
			tail_again = atomic_load (&event->tail);
			if (tail == tail_again)
				break;
			on_failure(&event->tail_contention);
		}
		on_success(&event->tail_contention);

		if (!from (next)) {
			if (atomic_compare_exchange_strong
			    (&((struct node*)from (tail))->next,
			     &next,
			     to (node, tag (next) + 1U)))
				break;
		} else {
			atomic_compare_exchange_strong (&event->tail,
						 &tail,
						 to (from (next), tag (tail) + 1U));
		}
		on_failure(&event->tail_contention);
	}
	on_success(&event->tail_contention);
	atomic_compare_exchange_strong (&event->tail,
				 &tail,
				 to (node, tag (tail) + 1U));
}

static struct notifier * dequeue (struct event *event)
{
	struct node *head;
	struct node *head_again;
	struct node *tail;
	struct node *next;
	struct node *dequeued;
	struct notifier *trigger;

	for (;;) {
		for (;;) {
			head = atomic_load (&event->head);
			tail = atomic_load (&event->tail);
			next = atomic_load (&((struct node *)from (head))->next);
			head_again = atomic_load (&event->head);
			if (head == head_again)
				break;
			on_failure(&event->head_contention);
		}
		on_success(&event->head_contention);

		if (from (head) == from (tail)) {
			if (!from (next)) {
				dequeued = NULL;
				trigger = NULL;
				break;
			}
			atomic_compare_exchange_strong
				(&event->tail,
				 &tail,
				 to (from (next), tag (tail) + 1U));
		} else {
			trigger = ((struct node *)from (next))->trigger;
			if (atomic_compare_exchange_strong (&event->head,
							 &head,
							 to (from (next), tag (head) + 1U))) {
				dequeued = from (head);
				break;
			}
		}
		on_failure(&event->head_contention);
	}
	on_success(&event->head_contention);

	if (dequeued) {
		deallocate (dequeued);
	}
	return trigger;
}

struct node * allocate (void)
{
	struct node *head;
	struct node *next;
	struct node *n;

	for (;;) {
		head = atomic_load (&free_list);
		if (!from (head)) {
			on_success(&free_list_contention);
			n = aligned_alloc(_Alignof (struct node), sizeof *n);
			if (!n)
				abort();
			n->next = NULL;
			n->trigger = NULL;
			return n;
		}
		n = from (head);
		next = atomic_load (&n->next);
		if (atomic_compare_exchange_strong(&free_list,
					    &head,
					    to (from (next), tag (head) + 1U)))
			break;
		on_failure(&free_list_contention);
	}
	on_success(&free_list_contention);
	n->next = NULL;
	return n;
}

void deallocate (struct node *node)
{
	struct node *head;

	atomic_store (&node->next, to (NULL, 0));
	for (;;) {
		head = atomic_load (&free_list);
		atomic_store (&node->next, to (from (head), 0));
		if (atomic_compare_exchange_strong (&free_list,
					     &head,
					     to (node, tag (head) + 1U)))
			break;
		on_failure(&free_list_contention);
	}
	on_success(&free_list_contention);
}

#if defined PARTIAL_FUTEX
struct notifier {
	ALIGN_TO_CACHE _Atomic(int) triggered;
	ALIGN_TO_CACHE _Atomic(struct notifier *) next;
};
#else
struct notifier {
	int fds[2U];
	ALIGN_TO_CACHE _Atomic(bool) spinning;
	ALIGN_TO_CACHE _Atomic(bool) triggered;
	ALIGN_TO_CACHE _Atomic(struct notifier *) next;
};
#endif

struct notifier * allocate_notifier (void)
{
	struct notifier *head;
	struct notifier *next;
	struct notifier *n;

	for (;;) {
		head = atomic_load (&notifier_free_list);
		if (!from (head)) {
			n = aligned_alloc(_Alignof (struct notifier), sizeof *n);
			if (!n)
				abort();

#if !defined PARTIAL_FUTEX
#if defined DO_EVENTFD
			int fd = eventfd(0, EFD_CLOEXEC | EFD_NONBLOCK);
			if (-1 == fd)
				abort();
			n->fds[0U] = fd;
			n->fds[1U] = fd;
#else
			if (-1 == pipe2(n->fds, O_CLOEXEC | O_NONBLOCK))
				abort();
#endif

			n->spinning = false;
#endif
			n->triggered = false;
			n->next = NULL;
			return n;
		}
		n = from (head);
		next = atomic_load (&n->next);
		if (atomic_compare_exchange_strong(&notifier_free_list,
					    &head,
					    to (from (next), tag (head) + 1U)))
			break;
		on_failure(&notifier_free_list_contention);
	}
	on_success(&notifier_free_list_contention);
	atomic_store (&n->next, NULL);
	atomic_store (&n->triggered, false);
	return n;
}

void deallocate_notifier (struct notifier *node)
{
	struct notifier *head;

	atomic_store (&node->triggered, false);
	atomic_store (&node->next, to (NULL, 0));
	for (;;) {
		head = atomic_load (&notifier_free_list);
		atomic_store (&node->next, to (from (head), 0));
		if (atomic_compare_exchange_strong (&notifier_free_list,
					     &head,
					     to (node, tag (head) + 1U)))
			break;
		on_failure(&notifier_free_list_contention);
	}
	on_success(&notifier_free_list_contention);
}

#if defined PARTIAL_FUTEX
static inline void notifier_signal(struct notifier *notifier)
{
	/* already signaled */
	if (atomic_exchange(&notifier->triggered, 1))
		return;

	syscall(__NR_futex, &notifier->triggered, FUTEX_WAKE_PRIVATE, 1, NULL, NULL, 0);
}

static inline void notifier_wait(struct notifier *notifier)
{
	for (;;) {
		for (size_t ii = 0U; ii < 20U; ++ii) {
			bool is_triggered = atomic_exchange (&notifier->triggered, 0);
			if (is_triggered) {
				return;
			}
		}

		syscall(__NR_futex, &notifier->triggered,
		       FUTEX_WAIT_PRIVATE, 0, NULL, NULL, 0);
	}
}
#else
static inline void notifier_signal(struct notifier *notifier)
{
	/* already signaled */
	if (atomic_exchange(&notifier->triggered, true))
		return;

	bool still_spinning = atomic_load(&notifier->spinning);

	if (still_spinning)
		return;

	{
		static uint64_t const one = 1U;
		if (-1 == write(notifier->fds[1U], &one, sizeof one)) {
			if (errno != EAGAIN)
				abort();
		}
	}
}

static inline void notifier_wait(struct notifier *notifier)
{
	for (;;) {
		bool got_triggered = false;
		atomic_store(&notifier->spinning, true);
		for (size_t ii = 0U; ii < 20U; ++ii) {
			if (atomic_exchange(&notifier->triggered, false)) {
				got_triggered = true;
				break;
			}
			_mm_pause();
		}
		atomic_store(&notifier->spinning, false);
		if (got_triggered)
			break;
		if (atomic_exchange(&notifier->triggered, false))
			break;

		{
			struct pollfd fds[1U] = {{ .fd = notifier->fds[0U],
						   .events = POLLIN}};
			if (-1 == poll(fds, 1U, -1)) {
				abort();
			}
		}

		for (;;) {
			uint64_t xx;
			if (-1 == read(notifier->fds[0U], &xx, sizeof xx)) {
				if (EAGAIN == errno)
					break;
				abort();
			}
		}
	}
}
#endif

static void on_failure(_Atomic(uint64_t) *contention)
{
	uint64_t contention_count = atomic_load(contention);
	atomic_fetch_add(contention, 1U);

	if (contention_count < 2U) {
		/* do nothing */
	} else if (contention_count < 5U) {
		_mm_pause();
	} else {
		sched_yield();
	}
}

static void on_success(_Atomic(uint64_t) *contention)
{
	atomic_fetch_sub(contention, 1U);
}
#endif

--=-=-=--

