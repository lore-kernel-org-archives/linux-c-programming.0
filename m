From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Question about pthreads on Linux
Date: Tue, 25 Sep 2007 16:12:25 +0200
Message-ID: <6a00c8d50709250712l676cf64ev94230be4b541a5d1@mail.gmail.com>
References: <46F9082C.1060804@atl.lmco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=4XN11zNm8synA04eTkKSgX3SjNhnCy0HyItNfYaeUL8=;
        b=Oe1AES63oweDpn+4kbmrYIrANf8AFwy0ayMllKHnlQMQFNC2h/wGV56htKjQnBJ28hTK3yWfrykvQdwqCiqWVCaeZthzf6Pr3j3tA5UL0cx07OfPbAtNUc4yHlm95OF4odTlfpCmIFhlT9lkc7Vfu1wa/YOB1TgCkvM1S4qmF/4=
In-Reply-To: <46F9082C.1060804@atl.lmco.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Walsh <jwalsh@atl.lmco.com>
Cc: linux-c-programming@vger.kernel.org

Jonathan,

On 9/25/07, Jonathan Walsh <jwalsh@atl.lmco.com> wrote:
> I am attempting to set up a program that has 3 threads.  The first
> thread is a receiver process that listens on a UDP port and puts a
> struct on a one of two queues depending on a flag in the packet.  The
> other two threads block on a pthread_cond_t (that is signaled when a
> message is added to their queue), then take messages off their
> corresponding queues and perform a fixed amount of computation.  I am
> setting thread priorities as follows:
>
>   pthread_t tid_processor;
>   struct sched_param sparam;
>   pthread_attr_t tattr;
>   pthread_attr_init(&tattr);
>   pthread_attr_getschedparam(&tattr, &sparam);
>   sparam.sched_priority = SOME_THREAD_PRIORITY;
>   pthread_attr_setschedpolicy(&tattr, SCHED_FIFO);
>   pthread_attr_setschedparam(&tattr, &sparam));
>   pthread_create(&tid, &tattr, &thread_function, NULL );
>
> I set the receiver thread to the highest priority, then one of the
> processor threads is higher than the other.
>
> I have two questions about this situation:
>
> 1) Are pthread priorities reversed from Linux priorities.  In other
> words, does a lower number mean a higher priority?

No. SCHED_FIFO or SCHED_RR have an allowed range of 1 to 99 with lower
numbers representing lower thread priorities.

> 2) Will a higher priority thread preempt the execution of a lower
> priority thread?

Normally, this is the true for SCHED_FIFO, where threads run until
preempted by a thread of higher priority, or until blocked.

However, Linux limits the scheduling policies SCHED_RR and SCHED_FIFO
to processes with superuser privileges.  So, unless your program runs
with elevated privileges SCHED_OTHER will be selected by default which
is "based on the nice level ... and increased for each time quantum
the process [i.e. thread] is unable to run." according to
sched_setscheduler(2).

(Note, the pthread_set_schedparam() call maps to the
sched_setscheduler() call. An operation that requires root
privileges.)

For SCHED_OTHER the allowed mininmum and maximum priorities are 0.
Therefore it is not possible to change the priority.

Hope that sheds some light on your questions

	\Steve
