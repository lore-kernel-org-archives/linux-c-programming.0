From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Viability of a New Allocator
Date: Thu, 24 Jun 2004 15:10:27 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16602.57555.663049.440769@cerise.nosuchdomain.co.uk>
References: <40DA75DE.4020106@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <40DA75DE.4020106@comcast.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Richard Moser <nigelenki@comcast.net>
Cc: linux-c-programming@vger.kernel.org


John Richard Moser wrote:

> I have no idea how to implement this, although from what I gather it is
> feasible.  I believe but can not guarantee that it will give the returns
> I expect.  Is anyone interested in this at all?  I don't have the skill
> to code it, but if someone could find someone to code it or at least
> confirm that it should behave as expected, I'd be grateful.

glibc's malloc() already uses anonymous mmap() for blocks above a
certain threshold (default is 128Kb, configurable via environment
variables and mallopt()).

However, there is a (kernel-imposed) limit on the number of such
blocks, so you can't just mmap() a separate region for each block.

The last time I checked, glibc won't attempt to map a large region
then allocate multiple smaller blocks from it. In typical usage, there
probably wouldn't be much point. It can't unmap the region so long as
any portion of it is in use.

It could resize the region, moving the top downwards. OTOH, moving the
bottom upwards would require moving the base of region and copying all
used blocks, and that would be problematic in a multi-threaded
process. The same issue applies to splitting a block which is used at
both ends but empty in the middle.

The main thing in your proposal which doesn't make sense is:

> Any unused, allocated area of memory that touches or crosses a page
> boundary is infinite in size under this scheme, and so can be expanded
> and utilized, reducing the impact of heap fragmentation.

While you could extend such regions using mremap(), they certainly
aren't "infinite size". They can't be extended any further than the
next memory location which is currently in use.

Ultimately, on a 32-bit system, the problem tends to degenerate into
one of allocating address space rather than memory. And that limits
how much you can do with a malloc()-style interface, i.e. where the
block has to remain at a fixed address throughout its lifespan.

You would have a lot more flexibility using either x86 segmentation
(which is x86-specific, and would require 48-bit pointers), or a
mechansism similar to the Win16 API (LocalAlloc, LocalLock,
LocalUnlock) where blocks can be moved around.

-- 
Glynn Clements <glynn.clements@virgin.net>
