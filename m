From: Daniel Souza <thehazard@gmail.com>
Subject: x86 and linux stack layout
Date: Sun, 21 Nov 2004 10:33:53 -0300
Message-ID: <e1e1d5f40411210533b3d5ae4@mail.gmail.com>
Reply-To: Daniel Souza <thehazard@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi everybody

can anyone explain me how the x86 stack works ? like...
the stack starts at 0xbfffe000, growing forward, at the start of
the main() call (or another elf session that starts after main()
and initializes the argc, argv and envp args), and after
every CALL if modifies the EBP and ESP doing :

and after a RET call, it does:

and differences between JMP, LONGJMP and CALL,  
what registers they change, etc.

And so, how function arguments looks like in the stack, for 
example, when a function like
int foo (u_long boo, char *moo, char loo) {}
is caught, how they arguments looks like in the stack ?

i know that will be a 4 bytes long integer, another 4bytes
pointer (32b) and a 1byte char, in a reverse order. Will the
stack pointer be added (or subtracted) by 9 bytes, that
mean, the sum of all argument type lengths ? 

When a function returns, where its result is stored on ? 

If I make a lot of function calls, in anywhere the position of stack
of each call needs to be stored (like a backtrace)... where
is it stored on ? 

what are stack frames ? whats the relation between ESP and EBP ?

What those ELF sessions that are caught before main() do ? what
happens internally
when main() returns ? like, execute another elf session like .dtors
and try to return the return code to OS, as return of a execve() for
example. Is it right ?


Thanks a lot =)
Daniel


-- 
# (perl -e 'while (1) { print "\x90"; }') | dd of=/dev/war
