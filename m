From: Jonathan Walsh <jwalsh@atl.lmco.com>
Subject: Question about pthreads on Linux
Date: Tue, 25 Sep 2007 09:07:56 -0400
Message-ID: <46F9082C.1060804@atl.lmco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

I am attempting to set up a program that has 3 threads.  The first
thread is a receiver process that listens on a UDP port and puts a
struct on a one of two queues depending on a flag in the packet.  The
other two threads block on a pthread_cond_t (that is signaled when a
message is added to their queue), then take messages off their
corresponding queues and perform a fixed amount of computation.  I am
setting thread priorities as follows:

  pthread_t tid_processor;
  struct sched_param sparam;
  pthread_attr_t tattr;
  pthread_attr_init(&tattr);
  pthread_attr_getschedparam(&tattr, &sparam);
  sparam.sched_priority = SOME_THREAD_PRIORITY;
  pthread_attr_setschedpolicy(&tattr, SCHED_FIFO);
  pthread_attr_setschedparam(&tattr, &sparam));
  pthread_create(&tid, &tattr, &thread_function, NULL );

I set the receiver thread to the highest priority, then one of the
processor threads is higher than the other.

I have two questions about this situation:

1) Are pthread priorities reversed from Linux priorities.  In other
words, does a lower number mean a higher priority?
2) Will a higher priority thread preempt the execution of a lower
priority thread?  With the behavior I am seeing now, this seems to not
be the case.  If the lower priority processing thread begins execution
first the higher priority processing thread will not begin until it has
finished.  Though I correctly receive messages and put them into the
queue making this all the more puzzling.

Thank you for any help with my problem!  Let me know if you need more
information or detail in my questions.


Jonathan Walsh
Member Engineering Staff
Lockheed Martin Advanced Technology Laboratories
