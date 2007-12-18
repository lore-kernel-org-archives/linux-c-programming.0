From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: mmap questions
Date: Tue, 18 Dec 2007 17:17:31 +0000
Message-ID: <18280.171.81499.42153@cerise.gclements.plus.com>
References: <47675FEF.2010903@cs.byu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <47675FEF.2010903@cs.byu.edu>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Topher <javert42@cs.byu.edu>
Cc: linux-c-programming@vger.kernel.org


Topher wrote:

> I've read through the man pages on mmap, munmap, and msync, and I still
> am not sure that I'm using the correct flags.  Actually, I'm not even
> completely sure that mmap is the way to go.
> 
> I'm creating a queue-like data structure that uses a fixed amount of
> heap space.  When it fills up, it must dump itself to a file, and then
> it can consider itself "cleared", and continue adding elements.  If a
> remove() call is made on the structure, and it's currently empty but has
> previously dumped to disk, it loads the data from disk, and then
> continues.  Also, this is only a single-threaded application.
> 
> I thought that I should use the MAP_PRIVATE flag when I map the file,
> then just munmap() then call close(fd) when I dump it, but that's not
> working.  I'm just getting empty files.

Yup. MMAP_PRIVATE means that any modifications to the mapped region
aren't written out to the underlying file. IOW, it creates a
copy-on-write mapping of the buffer blocks rather than a writable
mapping.

You need to use MAP_SHARED if you want the changes to be written back
to the file.

> Is mmap even the way to go, or should I just be using write() and read()?

It depends. For read-only access, mmap() is usually more efficient, as
you don't have a context switch for each read() operation, and you
avoid unnecessary memory-to-memory copies.

For write access, the situation is less clear. If you are modifying
portions of the file in an arbitrary manner, mmap() avoids the system
call overhead and memory copies, but may result in increased disk I/O
as modified blocks are flushed back to disk periodically (OTOH, if
memory is tight, storing the data in process memory will still result
in some disk I/O due to swapping).

If you are writing the file sequentially, mmap() is likely to be
faster, as you won't typically get a block written out more than once
(unless you're writing quite slowly, in which case disk I/O won't be
a significant factor).

-- 
Glynn Clements <glynn@gclements.plus.com>
