From: Justinas <jugu3479@uosis.mif.vu.lt>
Subject: Re: x86 and linux stack layout
Date: Sun, 21 Nov 2004 17:13:10 +0200
Message-ID: <20041121171310.1253a383@localhost.localdomain>
References: <e1e1d5f40411210533b3d5ae4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <e1e1d5f40411210533b3d5ae4@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Souza <thehazard@gmail.com>, linux-c-programming@vger.kernel.org

On Sun, 21 Nov 2004 10:33:53 -0300
Daniel Souza <thehazard@gmail.com> wrote:

> Hi everybody
Hello
I'll try to explain some detais, as far as i remember.
> 
> can anyone explain me how the x86 stack works ? like...
i think You know the principles how does the stack work;] First In Last Out. The are two main commands to work with it(in assembly langiuage) push and pop.
lets say we have a esp=0x0000100. When we do such instruction
	push eax
the processor actualy does two main steps:
	sub esp,4	;decreases s stack pointer by two
	mov [esp], eax	;moves to memory location where points esp a 			;values stored in eax, now esp=0x000000fe

by popping a value from a stack(pop eax) we have this situation:
	mov eax,[esp]	;moves value from top of stack
	add esp,4	;increases esp by 4(size of eax register)
			;now esp=0x00000100

> the stack starts at 0xbfffe000, growing forward, at the start of
> the main() call (or another elf session that starts after main()
> and initializes the argc, argv and envp args), and after
> every CALL if modifies the EBP and ESP doing :
lets say we have a c function(systems word = 4bytes):
void do_smth(int a, char b);
when calling this function caling processor does two pushes:
	push b;
	push a;
consider stack before push, esp=0x00000100(for simplicity 0100)
	0000|		|
	0001|		|
	0002|		|
	....|		|
	....|		|
	00FD|		|
	00FE|		|
	00FF|___________|
esp->	0100

after pushes esp=0x00F8
	0000|		|
	0001|		|
	0002|		|
	....|		|
	....|		|
	00FD|		|
esp->	00F8|     a	|
	00FC|_____b_____|
	0100

and after that call function. Witch knows, that on top of the stack there is needed parameters.

> 
> and after a RET call, it does:
> 
> and differences between JMP, LONGJMP and CALL,  
> what registers they change, etc.
> 
> And so, how function arguments looks like in the stack, for 
> example, when a function like
> int foo (u_long boo, char *moo, char loo) {}
> is caught, how they arguments looks like in the stack ?
> 
> i know that will be a 4 bytes long integer, another 4bytes
> pointer (32b) and a 1byte char, in a reverse order. Will the
> stack pointer be added (or subtracted) by 9 bytes, that
> mean, the sum of all argument type lengths ? 
> 
> When a function returns, where its result is stored on ? 
usualy in eax, eax:edx. But it depends 
http://weblogs.asp.net/oldnewthing/archive/2004/01/02/47184.aspx
http://weblogs.asp.net/oldnewthing/archive/2004/01/07/48303.aspx
and old good google, keyword: calling convention :)
> 
> If I make a lot of function calls, in anywhere the position of stack
> of each call needs to be stored (like a backtrace)... where
> is it stored on ? 

> 
> what are stack frames ? whats the relation between ESP and EBP ?
with ebp You can create a base pointer, in stack section, from witch you evaluate absolute address. ss+ebp+esp = absolute address of top stack value. And could anybody else explain in details what is stack frame is. I cant remember:/ But it is relates with this. As i remember(maybe wrong!), local function variables are created in stack frames, based on ebp.
> 
> What those ELF sessions that are caught before main() do ? what
> happens internally
> when main() returns ? like, execute another elf session like .dtors
> and try to return the return code to OS, as return of a execve() for
> example. Is it right ?
some kind off.
> 
> 
> Thanks a lot =)
> Daniel
> 
> 
> -- 
> # (perl -e 'while (1) { print "\x90"; }') | dd of=/dev/war
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
