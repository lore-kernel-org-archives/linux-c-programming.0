From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: what causes SIGTERMs?
Date: Tue, 22 Jul 2003 21:47:55 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16157.41723.810976.389982@cerise.nosuchdomain.co.uk>
References: <00be01c34553$57ea97a0$caba0ba4@uwe.ac.uk>
	<16138.54505.701672.164306@cerise.nosuchdomain.co.uk>
	<012101c3462f$ec43a810$caba0ba4@uwe.ac.uk>
	<008101c35061$18aebb20$caba0ba4@uwe.ac.uk>
	<20030722151118.GT7452@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030722151118.GT7452@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Jan-Benedict Glaw wrote:

> > > > > * Am I correct that this is unlikely to be issued in response to a bug
> > > in my
> > > > > code?
> > 
> > As it turns out, this was issued in response to a runaway memory leak in my
> > code.  Still not sure where the signal came from.
> 
> So, most probably you got SIGTERMinated by the kernel at some
> out-of-memory situation after you grew too large...

If the kernel kills a process for exhausting system memory, it
normally does so using SIGKILL. However, it will use SIGTERM if the
process has the CAP_SYS_RAW_IO capability.

If a process attempts to exceed its data segment allocation
(RLIMIT_DATA), brk() (and thus malloc() etc) will simply fail. If the
process doesn't check the return value from e.g. malloc(), it will
typically receive SIGSEGV from dereferencing NULL.

If a process attempts to exceed its data stack segment allocation
(RLIMIT_STACK), the stack won't be extended, so the process will
receive SIGSEGV from writing below the end of the stack.

If a process exceeds its CPU allocation (RLIMIT_CPU), SIGKILL is used.

So, the most likely reason is that the kernel's OOM-killer decided to
terminate your process to obtain some more memory. This isn't strictly
a synchronous signal, in that it isn't necessarily sent to the process
which is causing the problem.

If the kernel is having difficulty obtaining memory, it will start
killing off processes according to various criteria. One of these is
the amount of memory which the process uses, so in the case of a
single runaway process causing the shortage, the same process is
likely to be killed.

However, if you had caught the SIGTERM, and didn't terminate quickly
enough, the kernel may have started killing other processes in order
to satisfy its memory requirements.

-- 
Glynn Clements <glynn.clements@virgin.net>
