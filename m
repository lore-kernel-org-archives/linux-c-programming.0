From: george anzinger <george@mvista.com>
Subject: Re: Race: SignalHandler() & sleep()
Date: Tue, 04 Jun 2002 15:24:57 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3CFD3E39.6FB262A2@mvista.com>
References: <20020604144804.33629.qmail@web12706.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hossein Mobahi <hmobahi@yahoo.com>
Cc: linux-c-programming@vger.kernel.org, linux-kernel@vger.kernel.org

Hossein Mobahi wrote:
> 
> Hello
> 
> main()
> {
>     ....
>     signal (SIGIO, signalhandler() ) ;
>     ....
>     sleep (65535) ;
>     ....
> }
> 
> signalhandler() { ... }
> 
> Assume the frequency of IO events is faster than one
> event per 65535 seconds. Therefore, let's consider
> 65535 as infinity (sleeping foreveR).
> If a SIGIO arrives, main will get out of sleep and
> continue running, but signalhandler will be invoked
> too. I wanted to know if there is any order/priority
> for sleep() in main, and signalhandler() to be called
> first, or one of them is invoked first randomly (race
> condition) ?
> 
> I myself ran the program many times and everytime
> observed signalhandler responding first. But maybe it
> is not a rule, and it was just my chance ?
> 
In linux (and most (all) unices) pending signals are checked
for on exit from the kernel so the order of operation is:

wake up (end of sleep) still in kernel
on exit from kernel, find signal, and deliver it, i.e. call
handler if there is one
on return from the handler, continue with the exit from the
system.

-- 
George Anzinger   george@mvista.com
High-res-timers: 
http://sourceforge.net/projects/high-res-timers/
Real time sched:  http://sourceforge.net/projects/rtsched/
Preemption patch:
http://www.kernel.org/pub/linux/kernel/people/rml
