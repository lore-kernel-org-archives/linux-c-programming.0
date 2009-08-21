From: =?iso-8859-2?B?TWljaGGzIE5hemFyZXdpY3o=?= 
	<m.nazarewicz@samsung.com>
Subject: Re: strange stack limit behavior when allocating more than 2GB mem on
 32bit machine
Date: Fri, 21 Aug 2009 11:38:10 +0200
Message-ID: <op.uy0adwzdlak3lt@amdc030.digital.local>
References: <56b13acf0908202047k2bf536f9vf993394d42059b8e@mail.gmail.com>
 <19086.17786.445616.394966@cerise.gclements.plus.com>
 <56b13acf0908210212t5b6921f5h4c224efa21d2f067@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <56b13acf0908210212t5b6921f5h4c224efa21d2f067@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	delsp=yes"
To: Joe <longapple@gmail.com>, Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

On Fri, 21 Aug 2009 11:12:17 +0200, Joe wrote:
> Thanks for your explanation. However as you can see, I got 2GB mem an=
d
> ~10GB swap, totally 12GB.
>
> With ulimit -s 10240(KB), I can allocate 2.5GB, I guess these are in
> swap, right?
> With ulimit -s unlimited, as you said, kernel reserved 1GB, stack
> reserved 2GB, there are still 12-3=3D9GB left??

Physical memory and swap are not the only limitations -- the other is
address space.  On 32-bit x86 systems CPU can address at most 4 GiB
of RAM[1].  Furthermore, in default configuration of Linux top 1 GiB
is reserved for kernel.  This means user space application can
address up to 3GiB of memory.

Now, as Glynn explained:

> On Thu, Aug 20, 2009 at 10:58 PM, Glynn Clements wrote:
>> If you set a stack size of unlimited, 2 GiB are reserved
>> for the stack and shared libraries, causing shared libraries to be
>> mapped at 1GiB and up. This leaves around 860 MiB for the heap.
>>
>> The result is that there isn't any area of the address space which i=
s
>> large enough for a single 2500 MiB allocation:

> Why did malloc failed, instead of allocating this abundant swap space=
?

malloc(3) failed because it failed to allocate *address space* not memo=
ry.
In default configuration malloc(3) won't fail if there is not enough
memory anyways (try it yourself -- disable swap and try allocating
1.5 GiB).

As you can see on the memory map's Glenn provided:

>> glynn@cerise:~ $ cat /proc/self/maps
>> 08048000-08053000 r-xp 00000000 08:01 3966484    /bin/cat
>> 08053000-08054000 r--p 0000a000 08:01 3966484    /bin/cat
>> 08054000-08055000 rw-p 0000b000 08:01 3966484    /bin/cat
>> 0a016000-0a038000 rw-p 0a016000 00:00 0          [heap]
>> 40000000-4001c000 r-xp 00000000 08:01 9785919    /lib/ld-2.9.so
>> 4001c000-4001d000 r--p 0001b000 08:01 9785919    /lib/ld-2.9.so
>> 4001d000-4001e000 rw-p 0001c000 08:01 9785919    /lib/ld-2.9.so
>> 4001e000-4001f000 r-xp 4001e000 00:00 0          [vdso]
>> 4001f000-40020000 rw-p 4001f000 00:00 0
>> 40037000-4016f000 r-xp 00000000 08:01 9784624    /lib/libc-2.9.so
>> 4016f000-40171000 r--p 00138000 08:01 9784624    /lib/libc-2.9.so
>> 40171000-40172000 rw-p 0013a000 08:01 9784624    /lib/libc-2.9.so
>> 40172000-40176000 rw-p 40172000 00:00 0
>> bfb35000-bfb4a000 rw-p bffeb000 00:00 0          [stack]

there is no continuous block of 2 GiB virtual address space (this is
because Linux changes the location where libraries are mapped).  When
you request allocation of 2.5 GiB system has to find a large enough
hole between allocated regions and there isn't any.  See for
yourself and analyze the hexadecimal numbers on the left column

On 64-bit systems the problem does not occur because applications
use larger virtual address (48-bit if I'm not mistaken which is
256 TiB)


PS. Do not top-post.


[1] With Physical Address Extension[2] CPU can address more memory (64 =
GiB) but
     each application can address up to 4GiB anyways so lets ignore it =
for now.
[2] http://en.wikipedia.org/wiki/Physical_Address_Extension

--=20
Best regards,                                            _     _
  .o. | Liege of Serenly Enlightened Majesty of         o' \,=3D./ `o
  ..o | Computer Science,  Micha=B3 "mina86" Nazarewicz      (o o)
  ooo +----<mina86@mina86.com>---<mina86@jabber.org>-ooO----(_)--Ooo--

--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
