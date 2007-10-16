From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: how to best map/buffer a file to memory by being able to lock
 sequences thread-safe
Date: Tue, 16 Oct 2007 11:54:01 +0100
Message-ID: <18196.38985.711509.375651@cerise.gclements.plus.com>
References: <20071013000158.d011bc82.dh@triple-media.com>
	<20071015174635.4cae245c.dh@triple-media.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20071015174635.4cae245c.dh@triple-media.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dennis Heuer <dh@triple-media.com>
Cc: linux-c-programming@vger.kernel.org


Dennis Heuer wrote:

> i did not try obstacks yet, will have a look at them. what bothers me
> at the moment is that mremap() is not a standard and that it operates
> strangely to me:
> 
> ENOMEM
>     The region is private writable, and insufficient virtual memory is
> available to extend it. Also, this error will occur if MREMAP_MAYMOVE
> is not given and the extension would collide with another mapped region.
> 
> i thought that mmap'ed space is only virtually aligned. possibly it's
> better to write buffers oneself? the posix interfaces look strange to
> me. they seem halfhearted and weirdly incompatible.

I don't understand what you're saying in any of the preceding
paragraph.

> consider a file that is growing. how to best remap it?

If you don't need portability, use mremap() with MREMAP_MAYMOVE. If
you need portability, use munmap() and mmap().

The only advantage of mremap() (other than efficiency) is that it can
be used to remap private or anonymous mappings, while mmap/munmap will
only work if changes are written back to the file.

-- 
Glynn Clements <glynn@gclements.plus.com>
