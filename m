From: Marius Nita <marius@cs.pdx.edu>
Subject: gc
Date: Fri, 22 Nov 2002 13:54:32 -0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20021122215432.GA13869@cs.pdx.edu>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

hi,

i was wondering if anyone here has had any experience with the Boehm garbage
collector (libgc).

i noticed that while it does seem to collect memory correctly, the
reclaimed space is not shown by tools like ps and top. in a program, when you
call free(), system memory is automatically adjusted. (as shown by these
tools.) but when using the gc, say you allocate 10 megs, invalidate the
pointer to this memory and invoke the collector explicitly, these 10 megs are
reclaimed, but your process still shows up as using 10 megs... i don't know
how ps and top work, but if they rely on calls to free() to shrink usage
accordingly, that might explain it; since libgc implements its own allocators
on top of sbrk.

i don't think this is a huge issue, just wondering if anyone knows of a way
around it.

thanks
marius

