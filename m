From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: mmap() to a specific address
Date: Mon, 1 Jul 2002 20:22:47 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15648.44039.491676.479663@cerise.nosuchdomain.co.uk>
References: <20020701220351.A2129@neutrino.particles.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020701220351.A2129@neutrino.particles.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Elias Athanasopoulos <eathan@otenet.gr>
Cc: linux-c-programming@vger.kernel.org


Elias Athanasopoulos wrote:

> Can I force a mmap() to a specific address? As I read in the man page the
> address which is passed in mmap() is only a hint; the kernel will eventual-
> ly decide in which page the object will be mapped. But, is there any ugly
> hack to accomplish a very specific mmap()?

If you specify MAP_FIXED, either the segment will be mapped at the
specified address, or mmap() will fail.

AFAICT, the kernel will use the specified address whenever possible. 
If it isn't possible (i.e. because something else is already mapped
there), then, well, it just isn't possible; the kernel can't
unilaterally deallocate an existing mapping.

Also, even if mmap(MAP_FIXED) succeeds, it may result in subsequent
operations failing; e.g. brk() will fail if it would result in the
heap being extended into the mapped region, pthread_create() will fail
if the thread's stack would overlap the mapped region, etc.

-- 
Glynn Clements <glynn.clements@virgin.net>
