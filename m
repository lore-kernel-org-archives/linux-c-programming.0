From: "Lars Olesen" <LOL@bang-olufsen.dk>
Subject: How to achieve real time performance
Date: Tue, 2 Jul 2002 11:05:19 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <OFC25FE33E.7D51C692-ONC1256BEA.0030A17D@bang-olufsen.dk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi I'm a fairly new linux programmer

I've made a small program that uses the parallel port device driver demo
from
"linux device drivers 2.nd edition" to measure the interrupt latency
between the
time an interrupt occurred and the time the data is read in my process.

Normally the latency is about 4 to 5 uS which is ok, but using nice = 0,
sometimes
the latency is several milliseconds (32 ms or worse) which is unacceptable
for my  purpose.
(Ultimately I want to write a program that takes audio samples (8 KHz) and
processes
them in real time one sample at a time => 125 uS to receive a sample,
process it and return it.)


So I tried to call :
sched_getparam(0,&current_schedparams);
current_schedparams.priority = 50; (tried 99 too)
sched_setscheduler(0,SCHED_FIFO,&current_schedparams)

But now the latency is consistently worse, (minimum 390 us(seldom), maximum
22.x ms, most of the time ca. 9 ms)

I tried to change the call in short.c setting up the interrupt handler
without the SA_INTERRUPT flag set,
but I'm still getting 8 to 9 ms latencies.

Can someone tell me the best way to tune nice, priority and interrupt
handlers for minimum latency ?

Best regards
Lars Olesen
B,Sc,E,E
DSP SW designer
Bang & Olufsen
Peter Bangs Vej 15
DK-7600 Struer
Denmark

Phone       (+45) 96 84 4446
Fax   (+45) 96 84 44 01
e-mail:     lol@bang-olufsen.dk

-Linux user       _\_v

"I don't think Microsoft is evil in itself; I just think that they
make really crappy operating systems." -- Linus Torvalds


