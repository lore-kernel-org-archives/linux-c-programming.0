From: Dennis Heuer <dh@triple-media.com>
Subject: Re: how to best map/buffer a file to memory by being able to lock
 sequences thread-safe
Date: Tue, 16 Oct 2007 19:28:44 +0200
Message-ID: <20071016192844.6305908c.dh@triple-media.com>
References: <20071013000158.d011bc82.dh@triple-media.com>
	<20071015174635.4cae245c.dh@triple-media.com>
	<18196.38985.711509.375651@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <18196.38985.711509.375651@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On Tue, 16 Oct 2007 11:54:01 +0100
Glynn Clements <glynn@gclements.plus.com> wrote:

> 
> Dennis Heuer wrote:
> 
> > i did not try obstacks yet, will have a look at them. what bothers me
> > at the moment is that mremap() is not a standard and that it operates
> > strangely to me:
> > 
> > ENOMEM
> >     The region is private writable, and insufficient virtual memory is
> > available to extend it. Also, this error will occur if MREMAP_MAYMOVE
> > is not given and the extension would collide with another mapped region.
> > 
> > i thought that mmap'ed space is only virtually aligned. possibly it's
> > better to write buffers oneself? the posix interfaces look strange to
> > me. they seem halfhearted and weirdly incompatible.
> 
> I don't understand what you're saying in any of the preceding
> paragraph.

i actually don't understand why you don't understand :( possibly i
should've written 'caches' instead of 'buffers'. however, what shall i
use a posix interface for if it only works in this but not in that case
and then only inefficient, as you yourself mentioned. efficiency is
quite important. portability too. the documentation is also bad. one
never knows what's meant with 'process', if things are thread-safe
or how they behave in combination (if that's not strictly forbidden.)
posix is an assortment but not a structure or even a base. however, i
found out that some interfaces aren't supported by cygwin and will
write the file cache and my memory buffers myself based on malloc, even
if that means that i now have to implement an efficient tree. it also
means that one always again invents the wheel though the system already
has it implemented but doesn't like to offer it a sane way. sorry but
i'm quite pissed about posix at the moment.

regards,
dennis heuer
