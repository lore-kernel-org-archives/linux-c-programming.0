From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Newbie question on malloc()
Date: Fri, 4 Jun 2004 03:35:02 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16575.57302.614704.450323@cerise.nosuchdomain.co.uk>
References: <002d01c44897$78ae58d0$de01a8c0@qnessmphibiki>
	<20040603012832.GC2562@luna.mooo.com>
	<16574.55886.797709.765778@cerise.nosuchdomain.co.uk>
	<1086301555.22497.0.camel@localhost>
	<001501c449c1$efc075e0$3410fea9@zoom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <001501c449c1$efc075e0$3410fea9@zoom>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Gimpelj <pgimpelj@sympatico.ca>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>


Paul Gimpelj wrote:

> pardon me for patching to this thread,
> 
> but, following this conversation,
> if files are left open at exit, does the operating system (linux) flush the
> i/o buffers to disk before closing files?

It depends upon what you mean by "buffers" and "disk".

The OS (kernel) doesn't know anything about user-space buffers (as
used by the ANSI stdio functions), so it won't flush those.

However, the exit() function will flush any user-space buffers (to the
kernel's buffer cache). Also, returning from main() performs an
implicit call to exit(), so the same applies there. To exit without
flushing any buffers, you need to call _exit() instead.

Needless to say, if a program terminates abnormally (due to a fatal
signal), buffers aren't flushed.

OTOH, the kernel does know about the kernel buffer cache, which is
where write() etc store their data. This is often inadvertently
referred to as "disk", on the assumption that write() etc actually
write directly to disk (which was true for e.g. MS-DOS).

The buffer cache is shared between processes, and is flushed to disk
as and when the kernel deems it appropriate, or if a process uses
sync/fsync.

However, once a process has sent the data to the kernel (i.e. the
buffer cache), it doesn't make any difference what the process does
(call exit(), call _exit(), crash, or whatever). The kernel ensures
that the buffer cache will eventually be flushed to disk
(notwithstanding exceptional circumstances, e.g. hardware or power
failure).

> This is not the case with windows 95/98  and dos.

ANSI C dictates that both exit() and returning from main() will flush
any buffers. Ultimately, it's up to the C library which you use to
implement this correctly, but I don't recall any problems with either
Borland or Watcom under DOS, or either Watcom or MSVC under Windows.

Terminating by other means (e.g. TerminateProcess()) may or may not
flush buffers.

Sometimes, it's necessary to terminate a process immediately, without
any unwanted side-effects. E.g. if you catch SIGSEGV or SIGBUS,
there's a good chance that user-space memory has become corrupted. Any
attempt to call functions which access that memory (e.g. fflush()) may
result in further exceptions.

> OR, does the _exit() function in the c runtime do it.

_exit() specifically does not flush the stdio buffers.

-- 
Glynn Clements <glynn.clements@virgin.net>
