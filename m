From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Slow signal delivery to server process with heavy I/O
Date: Mon, 12 Jul 2010 03:48:06 +0100
Message-ID: <19514.33382.135366.743597@cerise.gclements.plus.com>
References: <AANLkTimehfszGlcsKm4wt2byyNTb8cGD7DQSBK_W2Ome@mail.gmail.com>
	<19513.50328.712544.577528@cerise.gclements.plus.com>
	<AANLkTikkVpOnl5DQ8wPm9OIDR70YcTI-LVf9KACK39In@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <AANLkTikkVpOnl5DQ8wPm9OIDR70YcTI-LVf9KACK39In@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dallas Clement <dallas.a.clement@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Dallas Clement wrote:

> It's the delivery that's slow.

Out of interest, how did you manage to distinguish between delivery
and handling?

> If other threads are busy making other
> I/O system calls such as 'send', 'recv', 'select' etc, the kernel
> seems loathe to interrupt them for the sake of delivering a signal.
> Eventually, the signal handling thread gets a turn, but I guess I was
> under the false impression that a signal would be like a true
> interrupt and preempt any executing user code.

The kernel selects one thread which hasn't blocked the signal. If the
thread is performing a blocking system call (interruptable sleep), it
will be interrupted (changed to runnable, allowing it to receive a
time slice). The next time that the thread is scheduled, the signal
handler will be invoked.

The kernel won't necessarily deliver the signal to the next thread to
be scheduled, and won't necessarily schedule the thread prematurely. 
However, this shouldn't cause a noticeable delay unless the system has
a vast number of runnable threads/processes and a low HZ value (i.e. 
if the time taken to schedule every runnable thread once is long).

If you require urgent delivery of a signal, you need to select
real-time scheduling (sched_setscheduler() with SCHED_FIFO or
SCHED_RR). This allows the thread to "jump the queue", pre-empting
lower-priority threads. In practice, you also need to mlock() any
memory required by the handler, to prevent delays caused by paging.

-- 
Glynn Clements <glynn@gclements.plus.com>
