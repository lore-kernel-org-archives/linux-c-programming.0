From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: gc
Date: Sat, 23 Nov 2002 05:32:13 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15839.4829.914097.752437@cerise.nosuchdomain.co.uk>
References: <20021122215432.GA13869@cs.pdx.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20021122215432.GA13869@cs.pdx.edu>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marius Nita <marius@cs.pdx.edu>
Cc: linux-c-programming@vger.kernel.org


Marius Nita wrote:

> i was wondering if anyone here has had any experience with the Boehm garbage
> collector (libgc).
> 
> i noticed that while it does seem to collect memory correctly, the
> reclaimed space is not shown by tools like ps and top. in a program, when you
> call free(), system memory is automatically adjusted. (as shown by these
> tools.)

Calling free() won't normally reduce the process' memory usage, which
is what ps/top/etc report.

The only situation where free() will actually return memory to the
system is if malloc() allocated a block of memory using anonymous
mmap() (rather than sbrk()), and the entire block is now unused. 
However, this situation seldom happens in real programs.

If you disable the use of anonymous mmap with mallopt(M_MMAP_MAX, 0),
malloc() will always use sbrk(), so free() would never reduce the
process size.

Aside: one consequence of using anonymous mmap() is that malloc() can
allocate memory which isn't included in the data segment resource
limit (setrlimit(RLIMIT_DATA, ...)).

-- 
Glynn Clements <glynn.clements@virgin.net>
