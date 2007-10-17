From: Bryan Christ <bryan.christ@hp.com>
Subject: Re: how to best map/buffer a file to memory by being able to lock
 sequences thread-safe
Date: Wed, 17 Oct 2007 09:42:16 -0500
Message-ID: <47161F48.7000304@hp.com>
References: <20071013000158.d011bc82.dh@triple-media.com>	<20071015174635.4cae245c.dh@triple-media.com>	<18196.38985.711509.375651@cerise.gclements.plus.com>	<20071016192844.6305908c.dh@triple-media.com> <18197.1675.573920.177874@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <18197.1675.573920.177874@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: Dennis Heuer <dh@triple-media.com>, linux-c-programming@vger.kernel.org

I haven't tried it yet, but glib has a facility called GMappedFile which 
may suit your need.  That should be portable.

Glynn Clements wrote:
> Dennis Heuer wrote:
> 
>>>> i did not try obstacks yet, will have a look at them. what bothers me
>>>> at the moment is that mremap() is not a standard and that it operates
>>>> strangely to me:
>>>>
>>>> ENOMEM
>>>>     The region is private writable, and insufficient virtual memory is
>>>> available to extend it. Also, this error will occur if MREMAP_MAYMOVE
>>>> is not given and the extension would collide with another mapped region.
>>>>
>>>> i thought that mmap'ed space is only virtually aligned. possibly it's
>>>> better to write buffers oneself? the posix interfaces look strange to
>>>> me. they seem halfhearted and weirdly incompatible.
>>> I don't understand what you're saying in any of the preceding
>>> paragraph.
>> i actually don't understand why you don't understand :(
> 
> Well, let's go over it a sentence at a time.
> 
>> i thought that mmap'ed space is only virtually aligned
> 
> What does "virtually aligned" mean? I've never heard the term before.
> 
>> possibly it's better to write buffers oneself?
> 
> Why? I mean, there are all sorts of reasons why you might want to use
> user-space buffers, but it's not possible to comment on why they may
> or may not be better without understanding which problem(s) you are
> facing with mmap.
> 
>> the posix interfaces look strange to me. they seem halfhearted and
>> weirdly incompatible.
> 
> They (mmap and munmap) seem fairly rational to me. What do you find
> odd about them?
> 
>> possibly i should've written 'caches' instead of 'buffers'.
> 
> That wouldn't make it any more clear.
> 
>> however, what shall i
>> use a posix interface for if it only works in this but not in that case
> 
> It works for what it's supposed to work for: mapping a portion of a
> file to the process' address space, as if it were memory.
> 
> What case doesn't it work for?
> 
>> and then only inefficient, as you yourself mentioned. efficiency is
>> quite important.
> 
> The potential inefficiency of munmap/mmap (vs mremap) is trivial
> compared to the inefficiency of explicit read/write calls.
> 
>> portability too.
> 
> mmap/mmunmap are available on all POSIX systems.
> 
>> the documentation is also bad.
> 
> What is wrong with it?
> 
>> one
>> never knows what's meant with 'process', if things are thread-safe
>> or how they behave in combination (if that's not strictly forbidden.)
> 
> By "process", it means "process". All threads within a process share
> the same address space. mmap maps a file into the process' address
> space.
> 
>> posix is an assortment but not a structure or even a base. however, i
>> found out that some interfaces aren't supported by cygwin
> 
> Cygwin supports mmap() in terms of the functionality specified by
> POSIX, and provides some extensions (but not all of the ones which
> Linux provides).
> 
>> and will
>> write the file cache and my memory buffers myself based on malloc, even
>> if that means that i now have to implement an efficient tree. it also
>> means that one always again invents the wheel though the system already
>> has it implemented but doesn't like to offer it a sane way.
> 
> What do you think that read/write will offer that mmap() doesn't?
> 
>> sorry but i'm quite pissed about posix at the moment.
> 
> From what you've written, I suspect that the problem has more to do
> with you not understanding the interface or not knowing how to use it
> than with what is being provided.
> 
