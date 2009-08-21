From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: strange stack limit behavior when allocating more than 2GB mem on 
	32bit machine
Date: Fri, 21 Aug 2009 07:58:02 +0100
Message-ID: <19086.17786.445616.394966@cerise.gclements.plus.com>
References: <56b13acf0908202047k2bf536f9vf993394d42059b8e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <56b13acf0908202047k2bf536f9vf993394d42059b8e@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joe <longapple@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Joe wrote:

> Here I encounter something which I can't understand.
> What I want to do is to allocate ~2.5GB mem, it fails when stack limit
> is unlimited, but succeeded when stack limit is 10240.

> $ ulimit -s
> 10240
> $ ./malloc 2500
> Malloc succeeded               <======= succeeds when stack limit is 10240
> $ ulimit -s unlimited
> $ ./malloc 2500
> malloc failed: Cannot allocate memory   <======== fails when stack
> limit is unlimited???
> 
> 
> BTW, there is no such problem on 64bit machine
> 
> 
> Could you please give some insight on this?

A 32-bit system has a 4 GiB address space. The top GiB is reserved for
the kernel. If you set a stack size of unlimited, 2 GiB are reserved
for the stack and shared libraries, causing shared libraries to be
mapped at 1GiB and up. This leaves around 860 MiB for the heap.

The result is that there isn't any areay of the address space which is
large enough for a single 2500 MiB allocation:

glynn@cerise:~ $ ulimit -s 8192
glynn@cerise:~ $ cat /proc/self/maps
08048000-08053000 r-xp 00000000 08:01 3966484    /bin/cat
08053000-08054000 r--p 0000a000 08:01 3966484    /bin/cat
08054000-08055000 rw-p 0000b000 08:01 3966484    /bin/cat
080a4000-080c6000 rw-p 080a4000 00:00 0          [heap]
b7f67000-b7f68000 rw-p b7f67000 00:00 0 
b7f68000-b80a0000 r-xp 00000000 08:01 9784624    /lib/libc-2.9.so
b80a0000-b80a2000 r--p 00138000 08:01 9784624    /lib/libc-2.9.so
b80a2000-b80a3000 rw-p 0013a000 08:01 9784624    /lib/libc-2.9.so
b80a3000-b80a6000 rw-p b80a3000 00:00 0 
b80bd000-b80be000 rw-p b80bd000 00:00 0 
b80be000-b80bf000 r-xp b80be000 00:00 0          [vdso]
b80bf000-b80db000 r-xp 00000000 08:01 9785919    /lib/ld-2.9.so
b80db000-b80dc000 r--p 0001b000 08:01 9785919    /lib/ld-2.9.so
b80dc000-b80dd000 rw-p 0001c000 08:01 9785919    /lib/ld-2.9.so
bf81e000-bf833000 rw-p bffeb000 00:00 0          [stack]

glynn@cerise:~ $ ulimit -s unlimited
glynn@cerise:~ $ cat /proc/self/maps 
08048000-08053000 r-xp 00000000 08:01 3966484    /bin/cat
08053000-08054000 r--p 0000a000 08:01 3966484    /bin/cat
08054000-08055000 rw-p 0000b000 08:01 3966484    /bin/cat
0a016000-0a038000 rw-p 0a016000 00:00 0          [heap]
40000000-4001c000 r-xp 00000000 08:01 9785919    /lib/ld-2.9.so
4001c000-4001d000 r--p 0001b000 08:01 9785919    /lib/ld-2.9.so
4001d000-4001e000 rw-p 0001c000 08:01 9785919    /lib/ld-2.9.so
4001e000-4001f000 r-xp 4001e000 00:00 0          [vdso]
4001f000-40020000 rw-p 4001f000 00:00 0 
40037000-4016f000 r-xp 00000000 08:01 9784624    /lib/libc-2.9.so
4016f000-40171000 r--p 00138000 08:01 9784624    /lib/libc-2.9.so
40171000-40172000 rw-p 0013a000 08:01 9784624    /lib/libc-2.9.so
40172000-40176000 rw-p 40172000 00:00 0 
bfb35000-bfb4a000 rw-p bffeb000 00:00 0          [stack]

If you were to allocate 1900 MiB, the allocation would succeed with
e.g. "ulimit -s 8192" (the allocation coming from the heap) or with
"ulimit -s unlimited" (the allocation coming from the stack), but
would fail with intermediate values, as neither region is large
enough.

-- 
Glynn Clements <glynn@gclements.plus.com>
