From: =?ISO-8859-1?Q?Ga=EBl_Deest?= <GUtopiste@free.fr>
Subject: Re: Strange segmentation fault with xlib / threads
Date: Sun, 30 Nov 2003 23:52:11 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3FCA749B.9000206@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

> Can you shared with us what was the problem.

> Thanks,


I declared, at the beginning of the main :

int main(int argc, char *argv[]) {

pthread_t EventThread;
pthread_attr_t *EventThreadAttr;

with pthread_attr_t as a pointer to a a pthread_attr_t, which kind of
argument I had to pass later to the pthread_attr_init() function and
then to pthread_create(). Here are there prototypes :

int pthread_attr_init(pthread_attr_t *attr);
int pthread_create(pthread_t * thread, pthread_attr_t * attr, void *
(*start_routine)(void *), void * arg);

It was pretty useless to use the first one, I could have passed NULL as
argument in pthread_create, which would have created a concurrent
thread with the default parameters, what was the case because I didn't
modify my EventThreadAttr later.
Anyway, I simply forgot to initialize some memory for my
*EventThreadAttr, which of course caused a segmentation fault. One can
simply correct this with :

EventThreadAttr=(pthread_attr_t*)malloc(sizeof(pthread_attr_t));

I was not very logic with myself, because I used a pointer for an
argument (EventThreadAttr) and a solid variable for another one
(EventThread).

I think my program worked with an additional variable because by
enlarging its memory environment, it got access to the memory
pthread_attr_init() and pthread_create() tried to access. Which hid the
problem... It may also be interesting to know that using gcc
optimization simply deleted the problem, until the user closed the
window, when I got another strange message (don't remember what.)


