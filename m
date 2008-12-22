From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Problem with ucontext_t struct in signal handler
Date: Mon, 22 Dec 2008 23:01:32 +0000
Message-ID: <18768.7244.234006.444700@cerise.gclements.plus.com>
References: <40DE47A0-6538-4713-A44E-02984FAF5DC0@arcor.de>
	<18763.37381.997899.934804@cerise.gclements.plus.com>
	<E490BF2D-4E27-4E5B-90F8-79D0D7819A14@arcor.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <E490BF2D-4E27-4E5B-90F8-79D0D7819A14@arcor.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: XComp <xcomp@arcor.de>
Cc: linux-c-programming@vger.kernel.org


XComp wrote:

> > In any case, I don't think that you can rely upon the old_context
> > being usable once you leave the signal handler. Even if you copy the
> > contents, the uc_mcontext field may not be meaningful outside of the
> > handler.
> 
> So you think that solving the problem in this way will lead me in a  
> dead end?
> But I am confused because of the fact that it works sometimes.  
> Shouldn't it work the whole time or at no time only?

Intermittent faults are common with multi-threaded programming.

If a register is getting trashed, that will matter if you actually
need the register's value, but not if you're about to store a new
value there.

Looking at the disassembly:

	movl	$0, i
.L2:
	cmpl	$99999999, i
	jg	.L3
	incl	i
	jmp	.L2
.L3:

with absolute addresses:

 8048606:	movl   $0, i
 804860d:	
 8048610:	cmpl   $99999999, i
 8048617:	
 804861a:	jg     0x8048624
 804861c:	incl   i
 8048622:	jmp    0x8048610
 8048624:	...

my guess is that the flags aren't being saved, so when the signal
occurs between the "cmpl" and "jg" instructions, the sign flag is
being cleared, triggering the jump prematurely.

Adding the following:

	printf("\nold_context.uc_mcontext.gregs[REG_EFL] = %08x\n",
		 ((ucontext_t*) old_context)->uc_mcontext.gregs[REG_EFL]);
	printf("\nold_context.uc_mcontext.gregs[REG_IPL] = %08x\n",
		 ((ucontext_t*) old_context)->uc_mcontext.gregs[REG_EIP]);
shows the following:

	[Signal Handler]	SIGPROF was raised at  21883912...
	old_context.uc_mcontext.gregs[REG_EFL] = 00000203
	old_context.uc_mcontext.gregs[REG_IPL] = 08048622
	[Signal Handler]	SIGPROF was raised at  43508833...
	old_context.uc_mcontext.gregs[REG_EFL] = 00000203
	old_context.uc_mcontext.gregs[REG_IPL] = 08048610
	[Signal Handler]	SIGPROF was raised at  65140032...
	old_context.uc_mcontext.gregs[REG_EFL] = 00000297
	old_context.uc_mcontext.gregs[REG_IPL] = 0804861a
	[Thread Function]	Error: 1st counting  didn't finished (65140032)...

More precisely, in the cases where it fails, EIP is always 0x0804861a
(the "jg" instruction), and EFL always has the sign flag (0x80) set.
In the cases where it succeeds:

	[Signal Handler]	SIGPROF was raised at  22107659...
	old_context.uc_mcontext.gregs[REG_EFL] = 00000297
	old_context.uc_mcontext.gregs[REG_IPL] = 0804861c
	[Signal Handler]	SIGPROF was raised at  43727791...
	old_context.uc_mcontext.gregs[REG_EFL] = 00000207
	old_context.uc_mcontext.gregs[REG_IPL] = 08048610
	[Signal Handler]	SIGPROF was raised at  65357434...
	old_context.uc_mcontext.gregs[REG_EFL] = 00000203
	old_context.uc_mcontext.gregs[REG_IPL] = 08048610
	[Signal Handler]	SIGPROF was raised at  86987791...
	old_context.uc_mcontext.gregs[REG_EFL] = 00000283
	old_context.uc_mcontext.gregs[REG_IPL] = 0804861c
	[Thread Function]	1st counting worked  fine...

the above scenario never occurs.

It appears that you can't even use old_context to jump out of the
handler. In fact, the setcontext(2) manual page says:

       If  the	context	 was  obtained by a call to a signal handler, then old
       standard text says that "program execution continues with  the  program
       instruction following the instruction interrupted by the signal".  How-
       ever, this sentence was removed in SUSv2, and the  present  verdict  is
       "the result is unspecified".

I suspect that by the time that the kernel passes control to
user-space, the flags which libc saves are no longer correct. If
that's the case, the only solution is to return from the signal
handler back into the kernel, and allow the kernel to restore the
registers.

Note that the original code doesn't have this problem. The
swapcontext() which jumps out of the signal handler into user-space
jumps to a context which has just been created by makecontext() to
invoke scheduler().

And scheduler() never resumes a saved user-space context. The context
which it passes to setcontext() is either the original context created
by makecontext(), or it is the signal-space context which was saved
from within the signal handler by the swapcontext(). In the latter
case, the task resumes within the signal handler, from which it
returns normally.

So the code never attempts to resume a saved user-space context from
within the signal handler. From the perspective of the thread1() or
thread2() function, it gets a signal, enters the signal handler, then
(after all of the other tasks have had a turn) leaves the signal
handler.

-- 
Glynn Clements <glynn@gclements.plus.com>
