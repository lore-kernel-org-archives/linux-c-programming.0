From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: x86 and linux stack layout
Date: Sun, 21 Nov 2004 19:08:40 +0000
Message-ID: <16800.59320.31823.656094@cerise.gclements.plus.com>
References: <e1e1d5f40411210533b3d5ae4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <e1e1d5f40411210533b3d5ae4@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Souza <thehazard@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Daniel Souza wrote:

> can anyone explain me how the x86 stack works ? like...
> the stack starts at 0xbfffe000, growing forward, at the start of
> the main() call (or another elf session that starts after main()
> and initializes the argc, argv and envp args), and after
> every CALL if modifies the EBP and ESP doing :
> 
> and after a RET call, it does:
> 
> and differences between JMP, LONGJMP and CALL,  
> what registers they change, etc.

A near JMP instruction sets EIP to the specified address (either an
offset relative to the current EIP, the contents of a register, or the
contents of a memory location). A far JMP instruction sets both CS and
EIP.

A CALL instruction is similar to a near JMP, but it pushes EIP onto
the stack first, so that RET works.

> And so, how function arguments looks like in the stack, for 
> example, when a function like
> int foo (u_long boo, char *moo, char loo) {}
> is caught, how they arguments looks like in the stack ?
> 
> i know that will be a 4 bytes long integer, another 4bytes
> pointer (32b) and a 1byte char, in a reverse order. Will the
> stack pointer be added (or subtracted) by 9 bytes, that
> mean, the sum of all argument type lengths ? 

First, the compiler will typically pad individual arguments to the
machine's word size (e.g. 32 bits on x86). Also, it may pad the stack
frame further.

The layout of the arguments is as if the compiler pushed each argument
(padded to a multiple of the word size) onto the stack (with a PUSH
instruction) in right-to-left order.

> When a function returns, where its result is stored on ? 

For integer/pointer values, the result is in EAX.

> If I make a lot of function calls, in anywhere the position of stack
> of each call needs to be stored (like a backtrace)... where
> is it stored on ? 

CALL saves the current EIP on the stack.

> what are stack frames ? whats the relation between ESP and EBP ?

The first few instructions of each function typically look like:

	pushl	%ebp
	movl	%esp, %ebp
	subl	<offset>, %esp

where <offset> is the number of bytes which the function uses for
local variables. The same effect can be achieved by the ENTER
instruction, but on recent x86 chips the ENTER instruction is slower,
so it isn't used.

In calling the function, the caller pushed the arguments onto the
stack, then the CALL instruction pushed EIP onto the stack. Coupled
with the above code, the stack will look like:

	char loo
	char* moo
	u_long boo
	old EIP
EBP ->	old EBP
	<local var>
	<local var>
	...
ESP ->	<local var>

The function's arguments can be referenced as positive offsets from
EBP, while its local variables can be referenced as negative offsets
from EBP. The collection of arguments, local variables and saved
EIP/EBP is referred to as a stack frame, and EBP is referred to as a
frame pointer.

Note that EBP itself points to the previous EBP, which will point to
the EBP before that, and so on. So EBP effectively points to a linked
list of stack frames; gdb's where/bt commands simply display this
list.

Before returning from the function, the EBP and ESP must be restored
with:

	movl	%ebp, %esp
	popl	%ebp

(or the LEAVE instruction, which is equivalent). That leaves the saved
EIP on top of the stack for the RET instruction.

The -fomit-frame-pointer switch disables the use of EBP. Arguments and
local variables are referenced as positive offsets from ESP. The
compiler has to track changes to ESP so that offsets are computed
correctly. This leaves EBP available for other purposes, but inhibits
debugging (without EBP, a debugger can't figure out what is stored
where).

-- 
Glynn Clements <glynn@gclements.plus.com>
