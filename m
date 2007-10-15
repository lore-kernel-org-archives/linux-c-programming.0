From: Dennis Heuer <dh@triple-media.com>
Subject: Re: how to best map/buffer a file to memory by being able to lock
 sequences thread-safe
Date: Mon, 15 Oct 2007 17:46:35 +0200
Message-ID: <20071015174635.4cae245c.dh@triple-media.com>
References: <20071013000158.d011bc82.dh@triple-media.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20071013000158.d011bc82.dh@triple-media.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

i did not try obstacks yet, will have a look at them. what bothers me
at the moment is that mremap() is not a standard and that it operates
strangely to me:

ENOMEM
    The region is private writable, and insufficient virtual memory is
available to extend it. Also, this error will occur if MREMAP_MAYMOVE
is not given and the extension would collide with another mapped region.

i thought that mmap'ed space is only virtually aligned. possibly it's
better to write buffers oneself? the posix interfaces look strange to
me. they seem halfhearted and weirdly incompatible. consider a file
that is growing. how to best remap it?

regards,
dennis heuer
