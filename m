From: Joe <longapple@gmail.com>
Subject: Re: strange stack limit behavior when allocating more than 2GB mem on 
	32bit machine
Date: Fri, 21 Aug 2009 03:04:11 -0800
Message-ID: <56b13acf0908210404m4c235834qb874873403bfb689@mail.gmail.com>
References: <56b13acf0908202047k2bf536f9vf993394d42059b8e@mail.gmail.com>
	 <19086.17786.445616.394966@cerise.gclements.plus.com>
	 <56b13acf0908210212t5b6921f5h4c224efa21d2f067@mail.gmail.com>
	 <op.uy0adwzdlak3lt@amdc030.digital.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=jWh9aE7O0+KwzBkUYdLGTQg+5LRJX1tXqBCAca/5N1k=;
        b=wDdcW7afor0bfini8bP55qa439+wPszr6K96jUc1ciyYb4beMMW7edH5WY5eooi6Qq
         OieCvel2kXU+9peGeXqHtEFBAqbqYxqF5nYmlmPCakVSeHYuF4k7F0iDNqt2Uo4lwKHT
         xZsxPTZNd9282RFFq0+6rjGmHNeiGHATvgO0E=
In-Reply-To: <op.uy0adwzdlak3lt@amdc030.digital.local>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-2?Q?Micha=B3_Nazarewicz?= <m.nazarewicz@samsung.com>
Cc: Glynn Clements <glynn@gclements.plus.com>, linux-c-programming@vger.kernel.org

Clear. But how comes 2000MB can be allocated when stack limit is unlimi=
ted?

$ ulimit -s
unlimited
$ ./malloc 2046
Malloc succeeded
$ ./malloc 2047
malloc failed: Cannot allocate memory           <=3D=3D=3D=3D the criti=
cal
point for my case is 2046MB

Thanks,
Joe



2009/8/21 Micha=B3 Nazarewicz <m.nazarewicz@samsung.com>:
> On Fri, 21 Aug 2009 11:12:17 +0200, Joe wrote:
>>
>> Thanks for your explanation. However as you can see, I got 2GB mem a=
nd
>> ~10GB swap, totally 12GB.
>>
>> With ulimit -s 10240(KB), I can allocate 2.5GB, I guess these are in
>> swap, right?
>> With ulimit -s unlimited, as you said, kernel reserved 1GB, stack
>> reserved 2GB, there are still 12-3=3D9GB left??
>
> Physical memory and swap are not the only limitations -- the other is
> address space. =A0On 32-bit x86 systems CPU can address at most 4 GiB
> of RAM[1]. =A0Furthermore, in default configuration of Linux top 1 Gi=
B
> is reserved for kernel. =A0This means user space application can
> address up to 3GiB of memory.
>
> Now, as Glynn explained:
>
>> On Thu, Aug 20, 2009 at 10:58 PM, Glynn Clements wrote:
>>>
>>> If you set a stack size of unlimited, 2 GiB are reserved
>>> for the stack and shared libraries, causing shared libraries to be
>>> mapped at 1GiB and up. This leaves around 860 MiB for the heap.
>>>
>>> The result is that there isn't any area of the address space which =
is
>>> large enough for a single 2500 MiB allocation:
>
>> Why did malloc failed, instead of allocating this abundant swap spac=
e?
>
> malloc(3) failed because it failed to allocate *address space* not me=
mory.
> In default configuration malloc(3) won't fail if there is not enough
> memory anyways (try it yourself -- disable swap and try allocating
> 1.5 GiB).
>
> As you can see on the memory map's Glenn provided:
>
>>> glynn@cerise:~ $ cat /proc/self/maps
>>> 08048000-08053000 r-xp 00000000 08:01 3966484 =A0 =A0/bin/cat
>>> 08053000-08054000 r--p 0000a000 08:01 3966484 =A0 =A0/bin/cat
>>> 08054000-08055000 rw-p 0000b000 08:01 3966484 =A0 =A0/bin/cat
>>> 0a016000-0a038000 rw-p 0a016000 00:00 0 =A0 =A0 =A0 =A0 =A0[heap]
>>> 40000000-4001c000 r-xp 00000000 08:01 9785919 =A0 =A0/lib/ld-2.9.so
>>> 4001c000-4001d000 r--p 0001b000 08:01 9785919 =A0 =A0/lib/ld-2.9.so
>>> 4001d000-4001e000 rw-p 0001c000 08:01 9785919 =A0 =A0/lib/ld-2.9.so
>>> 4001e000-4001f000 r-xp 4001e000 00:00 0 =A0 =A0 =A0 =A0 =A0[vdso]
>>> 4001f000-40020000 rw-p 4001f000 00:00 0
>>> 40037000-4016f000 r-xp 00000000 08:01 9784624 =A0 =A0/lib/libc-2.9.=
so
>>> 4016f000-40171000 r--p 00138000 08:01 9784624 =A0 =A0/lib/libc-2.9.=
so
>>> 40171000-40172000 rw-p 0013a000 08:01 9784624 =A0 =A0/lib/libc-2.9.=
so
>>> 40172000-40176000 rw-p 40172000 00:00 0
>>> bfb35000-bfb4a000 rw-p bffeb000 00:00 0 =A0 =A0 =A0 =A0 =A0[stack]
>
> there is no continuous block of 2 GiB virtual address space (this is
> because Linux changes the location where libraries are mapped). =A0Wh=
en
> you request allocation of 2.5 GiB system has to find a large enough
> hole between allocated regions and there isn't any. =A0See for
> yourself and analyze the hexadecimal numbers on the left column
>
> On 64-bit systems the problem does not occur because applications
> use larger virtual address (48-bit if I'm not mistaken which is
> 256 TiB)
>
>
> PS. Do not top-post.
>
>
> [1] With Physical Address Extension[2] CPU can address more memory (6=
4 GiB)
> but
> =A0 =A0each application can address up to 4GiB anyways so lets ignore=
 it for
> now.
> [2] http://en.wikipedia.org/wiki/Physical_Address_Extension
>
> --
> Best regards, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0_ =A0 =A0 _
> =A0.o. | Liege of Serenly Enlightened Majesty of =A0 =A0 =A0 =A0 o' \=
,=3D./ `o
> =A0..o | Computer Science, =A0Micha=B3 "mina86" Nazarewicz =A0 =A0 =A0=
(o o)
> =A0ooo +----<mina86@mina86.com>---<mina86@jabber.org>-ooO----(_)--Ooo=
--
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
