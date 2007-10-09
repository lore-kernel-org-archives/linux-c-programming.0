From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: how to stay acid-compliant when using mmap'ed files
Date: Tue, 9 Oct 2007 23:50:41 +0100
Message-ID: <18188.1473.602065.734337@cerise.gclements.plus.com>
References: <20071009175440.ac8f8efe.dh@triple-media.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20071009175440.ac8f8efe.dh@triple-media.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dennis Heuer <dh@triple-media.com>
Cc: linux-c-programming@vger.kernel.org


Dennis Heuer wrote:

> i don't really understand the implications of using mmap. for example,
> will linux write out changes to an mmap'ed file as is or as part of a
> full page-write? if the latter is true, what happens if the program
> reads from mmap'ed pages but writes directly to the file? as far as i
> see it, linux will catch the writing and divert it to the mmap'ed page.
> this implies that only full page-writes will reach the file.

You seem to misunderstand how files and mmap() work on Unix.

All file I/O (actually, all block-device I/O) goes through the buffer
cache. The kernel only ever transfers whole blocks between memory and
disk.

If you open() a file then read() e.g. 237 bytes from the file, the
kernel reads a (typically) 4K block into the buffer cache, then copies
237 bytes from the buffer cache into the process address space.

If you write() data to a file, the kernel ensures that the affected
blocks are in the buffer cache, then overwrites the specified portions
with the data supplied by the process.

If multiple processes have the same file open simultaneously, all
processes share the same cache; IOW, the in-memory copy is
"definitive".

When a process mmap()s a file, any memory pages which cache blocks of
that file are mapped directly into the process' address space using
the CPU's MMU. The kernel doesn't need to "catch" write operations;
the data is written directly to the corresponding pages in the buffer
cache.

-- 
Glynn Clements <glynn@gclements.plus.com>
