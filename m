From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Slow signal delivery to server process with heavy I/O
Date: Mon, 12 Jul 2010 17:14:54 +0100
Message-ID: <19515.16254.883236.904506@cerise.gclements.plus.com>
References: <AANLkTimehfszGlcsKm4wt2byyNTb8cGD7DQSBK_W2Ome@mail.gmail.com>
	<19513.50328.712544.577528@cerise.gclements.plus.com>
	<AANLkTikkVpOnl5DQ8wPm9OIDR70YcTI-LVf9KACK39In@mail.gmail.com>
	<19514.33382.135366.743597@cerise.gclements.plus.com>
	<4C3ABF09.3090808@linkbroker.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4C3ABF09.3090808@linkbroker.hu>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ern0 <ern0@linkbroker.hu>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>


ern0 wrote:

> > The kernel selects one thread which hasn't blocked the signal.
> 
> So if you want to catch signals ASAP, is it a good strategy to
> - leave one thread for signal catching, it may perform sleeps;
> - other threads should block all signals?

You should also set that thread to use real-time scheduling, and
mlock() any memory it requires.

The former ensures that, once the thread becomes runnable, it takes
precedence over other (non-real-time) threads. The latter ensures that
it can actually execute the signal-handling code in a reasonable time
(a thread which is normally idle is prone to having its memory paged
out).

Both of these are subject to resource limits. In particular, the
default for RLIMIT_RTPRIO is usually zero, which prevents selecting
real-time scheduling. The reason is that a real-time process takes
precedence over all non-real-time processes; if a real-time process
gets stuck in a loop, it will prevent non-real-time processes from
getting any CPU. RLIMIT_RTTIME can be used to mitigate this issue.

-- 
Glynn Clements <glynn@gclements.plus.com>
