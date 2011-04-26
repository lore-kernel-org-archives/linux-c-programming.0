From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: malloc question
Date: Tue, 26 Apr 2011 16:05:46 +0100
Message-ID: <19894.57162.66302.812149@cerise.gclements.plus.com>
References: <BANLkTik1ZqN2cOqu65f380wfgOHQpwX7gg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <BANLkTik1ZqN2cOqu65f380wfgOHQpwX7gg@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Randi Botse wrote:

> I want to ask malloc() behaviour, consider these codes;
> 
> ...
> char *ptr = malloc(1);
> strcpy(ptr, "what");
> puts(ptr);
> ....
> 
> Confusingly, the strcpy() copied all bytes to ptr, but I just manage
> to allocate ptr only for 1 byte, I guess I will have segfault here,
> why this happen? why the string successfully copied into ptr? ,

libc typically requests memory from the kernel in large chunks, then
uses portions of this memory to satisfy malloc() requests. The memory
following the allocated block is likely to be valid (i.e. accessing it
won't cause a segfault), but it may have been allocated to something
else, or it may be allocated to something else in the future.

> is those code legal?

No. Any memory following the one byte block which you requested will
be deemed available for use by other parts of the code.

If you modify memory immediately beyond the end of a malloc()d block,
the most common result is corruption of the heap's internal data,
resulting in a subsequent malloc(), realloc(), free() etc call
crashing.

For such a small string, you'll typically get away with it, as any
practical malloc() implementation will align blocks to at least a word
boundary and probably more (e.g. GNU libc uses 16-byte boundaries to
ensure that a "long double" won't straddle a page boundary), so there
will be some padding between the end of the allocated block and any
following block.

-- 
Glynn Clements <glynn@gclements.plus.com>
