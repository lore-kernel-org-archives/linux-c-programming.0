From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Beginning programmer + simple program
Date: Mon, 19 Jan 2004 06:02:45 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16395.29445.788882.274151@cerise.nosuchdomain.co.uk>
References: <200401171852.03121.eric@cisu.net>
	<16393.61626.659377.266758@cerise.nosuchdomain.co.uk>
	<200401180000.26606.eric@cisu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200401180000.26606.eric@cisu.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric <eric@cisu.net>
Cc: linux-c-programming@vger.kernel.org


Eric wrote:

> > Reading individual bytes with read() will seriously reduce
> > performance. Better to use getc() or, better still, getc_unlocked()
> > (which is a macro).
> 
> I did wonder that. By chance what does getc_unlocked do? What are the benifits 
> over getc? What's its prototype? I wasnt too concerned over speed, it 
> provided enough performance for my tastes.

getc_unlocked() is essentially the original libc-5 version of getc(). 
This is a macro which reads a byte directly from the FILE's buffers:

#define _IO_getc_unlocked(_fp) \
       ((_fp)->_IO_read_ptr >= (_fp)->_IO_read_end ? __uflow (_fp) \
	: *(unsigned char *) (_fp)->_IO_read_ptr++)

So long as the read buffer isn't empty, it doesn't involve a function
call. As it is a macro, its usage can be optimised, which may make a
significant difference in a tight loop.

Actually, in glibc 2.0.x, getc_unlocked was just a macro which
expanded to _IO_getc_unlocked, in 2.1.x it's an inline function:

	/* This is defined in POSIX.1:1996.  */
	__STDIO_INLINE int
	getc_unlocked (FILE *__fp) __THROW
	{
	  return _IO_getc_unlocked (__fp);
	}

This shouldn't make any difference; the essential point is that the
code gets inlined rather than called as a function, which allows for
more optimisations.

getc() itself was changed to a function in libc-6 (glibc 2.x) to
handle threading, as the FILE structure has to be locked against
concurrent access. So long as you aren't using multiple threads (or,
at least, aren't accessing any given FILE structure from more than one
thread), getc_unlocked() is safe, and will be faster than getc().

-- 
Glynn Clements <glynn.clements@virgin.net>
