From: Micha Feigin <michf@post.tau.ac.il>
Subject: Re: Newbie question on malloc()
Date: Fri, 4 Jun 2004 15:31:46 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040604123146.GL2562@luna.mooo.com>
References: <002d01c44897$78ae58d0$de01a8c0@qnessmphibiki> <1086196092.29970.2.camel@localhost> <16574.4399.288522.256729@cerise.nosuchdomain.co.uk> <1086198752.29988.21.camel@localhost> <16574.54829.111750.764395@cerise.nosuchdomain.co.uk> <20040603113241.GH2562@luna.mooo.com> <16575.55910.854396.740084@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16575.55910.854396.740084@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming <linux-c-programming@vger.kernel.org>

On Fri, Jun 04, 2004 at 03:11:50AM +0100, Glynn Clements wrote:
> 
> Micha Feigin wrote:
> 
> > > Note that free() doesn't generally return memory to the OS; it usually
> > > just records the fact that the specified region of memory is available
> > > for re-use by subsequent calls to malloc() etc.
> > 
> > That would depend on the memory block size. Small memory blocks are
> > held as malloc allocates whole pages at a time, large memory blocks are
> > returned. Depending on size the OS may then also store them on caches
> > in case a memory block of the same size is requested again.
> 
> That's what I meant by "generally".
> 
> Some implementations *may* return freed memory to the OS. GNU libc 2.x
> does so for blocks above a certain size (the default is 128kb,
> configurable via environment variables and mallopt()).
> 
> However, there may also be a limit on the number of such blocks (due
> to kernel limits on the number of memory mappings), so you can't
> drastically reduce the threshold.
> 
> Other implementations may or may not provide such a feature.
> 
> Also, kernel patches are available which disable this feature. Memory
> which is obtained from anonymous mmap() (rather than brk()) isn't
> restricted by setrlimit(RLIMIT_DATA), which makes it difficult to
> enforce resource limits.
> 
> > Otherwise in a long running program that allocates a lot of memory on
> > the start and then frees most of it would still be hogging all that
> > memory.
> 
> That may still happen if the memory is allocated in many small chunks
> rather than one large chunk.
> 

It may be close to the truth if the program allocates a lot of small
chunks of variable sizes. IIRC with malloc (on glibc) for each chunk
size for small sizes malloc will allocate a page (or group of pages)
and split them up to equal sized chunks.

Different sized chunks sit on different such chains.

This can take more memory but saves on fragmentation and easier
maintenance. For efficiency it may store the last free chunk or so
(don't remember) as cache, but it should store all freed memory (the
doubling technique for dynamic buffers). You add more memory if you
need more then you have, and free some up if you drop bellow a
threshold.

It would be grossly inefficient on system resources otherwise on not
much more efficient in time. Programs that need a memory cache should
handle it themselves.

> -- 
> Glynn Clements <glynn.clements@virgin.net>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  
>  +++++++++++++++++++++++++++++++++++++++++++
>  This Mail Was Scanned By Mail-seCure System
>  at the Tel-Aviv University CC.
> 
