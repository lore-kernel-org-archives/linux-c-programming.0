From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Newbie question on malloc()
Date: Thu, 3 Jun 2004 08:41:33 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16574.54829.111750.764395@cerise.nosuchdomain.co.uk>
References: <002d01c44897$78ae58d0$de01a8c0@qnessmphibiki>
	<1086196092.29970.2.camel@localhost>
	<16574.4399.288522.256729@cerise.nosuchdomain.co.uk>
	<1086198752.29988.21.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1086198752.29988.21.camel@localhost>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jtwilliams@vt.edu
Cc: Wen Guangcheng <wen.guangcheng@cnt.sp.qnes.nec.co.jp>, linux-c-programming <linux-c-programming@vger.kernel.org>


John T. Williams wrote:

> > > As I understand it, that is entirely up to the operation system.  Linux
> > > and NT Kernel systems do reclaim unfreed memory, however I believe one
> > > the major problems with Win98 was that it did not.
> > > 
> > > Anyone with more information feel free to correct me
> > 
> > I very much doubt that the above is accurate.
> > 
> > It may be that Win98 had some specific memory leaks, but any OS which,
> > in the general case, failed to recover a process' memory upon
> > termination would run out of memory very quickly.
> 
> What you never had win98 crash on you after running for an hour? ;) 

Sure. I've also had it crash after running for less than a minute. And
I've also had it run for hours without crashing.

However, if it didn't reclaim a process' memory upon termination, the
scenario where you run a short-lived but memory-hungry program many
times simply wouldn't be possible.

Bear in mind that many (possibly most) programs don't explicitly free
dynamically-allocated memory blocks upon termination; they just
terminate.

This is recommended practice. Explicitly freeing memory blocks is a
waste of time: you're basically just modifying regions of the process'
memory, which is about to be returned to the OS, whereupon its
contents become irrelevant.

[It may also make the program substantially more complex, as you would
need to keep track of such blocks.]

Note that free() doesn't generally return memory to the OS; it usually
just records the fact that the specified region of memory is available
for re-use by subsequent calls to malloc() etc.

Similarly, malloc() doesn't necessary result in any additional memory
being obtained from the OS; frequently it will just return a region of
memory which has already been allocated to the process but isn't being
used.

> May statement is based on something I remember vaguely from my OS class
> 2 years ago, so I'm quite happy to believe I'm wrong.  I remember there
> was some major issue with how win98 handled dynamic allocated memory,
> but I can't exactly remember what.  

The main reason for the unreliability of Win95/98/ME is that, for
compatibility with earlier versions, certain regions of memory are
unprotected. So, if an application crashes, it can corrupt data
belonging to other applications or the OS.

[The details relate to the fact that the 8086 doesn't have an MMU, so
there is a single, global address space shared by all processes (and
the OS). Originally, interprocess communication made extensive use of
passing around handles to memory blocks, relying upon the fact that
any process could read (and write) any part of memory. While Windows
3.1 and later require at least a 286, the behaviour was retained for
compatibility.]

> After googling a little I seems that win95 had some problems with
> Garbage Collection not win98.

The differences between 95 and 98 are essentially superficial. Win98
includes IE, and probably a significant number of bug fixes, which may
include bugs in memory allocation. However, the underlying
architecture is unchanged, and that includes the way in which memory
management works (other than any outright bugs which may have been
fixed).

-- 
Glynn Clements <glynn.clements@virgin.net>
