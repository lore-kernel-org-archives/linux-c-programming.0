From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Memory bug somewhere
Date: Sun, 25 May 2003 00:52:13 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16080.1453.501442.292043@cerise.nosuchdomain.co.uk>
References: <1053798538.1248.24.camel@localhost.localdomain>
	<16079.46351.86604.713178@cerise.nosuchdomain.co.uk>
	<1053805624.1248.35.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1053805624.1248.35.camel@localhost.localdomain>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: davidgn@servidor.unam.mx
Cc: linux-c-programming@vger.kernel.org


David Eduardo Gomez Noguera wrote:

> have read a bit, but I think its not related to my problem.
> With the printf statemens, I found the segfault was in the malloc call,
> gdb's backtrace says that too:
> 
> Program received signal SIGSEGV, Segmentation fault.
> 0x400b682e in _int_malloc () from /lib/libc.so.6
> (gdb) backtrace
> #0  0x400b682e in _int_malloc () from /lib/libc.so.6
> #1  0x400b5830 in malloc () from /lib/libc.so.6
> #2  0x400b9aac in mallochook () from /lib/libc.so.6
> #3  0x400b57cc in malloc () from /lib/libc.so.6
> #4  0x08049c36 in ins_code (tree=0x804c3d0, code=78, size=7 '\a',
> dato=161 '?')
>     at sagem.c:532
> #5  0x08049ae1 in hs (hf=0xbfffdca0) at sagem.c:469
> #6  0x08049618 in main (argc=2, argv=0xbfffde74) at sagem.c:258
> #7  0x4005e5cd in __libc_start_main () from /lib/libc.so.6

This backtrace (segfault inside malloc) is typical for heap
corruption.

> Why I think it might be a problem with glibc is because it doesnt
> segfaults on a mandrake 9.1, but it does crash on rh 8 and 9.

Corrupting the heap isn't guaranteed to cause a segfault, it just
makes it likely. This is what the term "undefined behaviour" means;
maybe your program will crash, maybe it will just behave incorrectly,
maybe it will actually work.

> how could I be corrupting the heap if that is the problem?

You can't tell you how you're corrupting the heap by looking at a
backtrace. If a segfault occurs, it will occur within a subsequent
call to malloc/free, not at the point in your program where the bug
is.

To locate the bug, you can either manually inspect your code, or use
dedicated memory debugging tools such as Bounds Checker or Electric
Fence.

-- 
Glynn Clements <glynn.clements@virgin.net>
