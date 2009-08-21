From: =?iso-8859-2?B?TWljaGGzIE5hemFyZXdpY3o=?= 
	<m.nazarewicz@samsung.com>
Subject: Re: strange stack limit behavior when allocating more than 2GB mem on
 32bit machine
Date: Fri, 21 Aug 2009 09:09:24 +0200
Message-ID: <op.uyz3hymilak3lt@amdc030.digital.local>
References: <56b13acf0908202047k2bf536f9vf993394d42059b8e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <56b13acf0908202047k2bf536f9vf993394d42059b8e@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	delsp=yes"
To: Joe <longapple@gmail.com>, linux-c-programming@vger.kernel.org

On Fri, 21 Aug 2009 05:47:28 +0200, Joe <longapple@gmail.com> wrote:

> Here I encounter something which I can't understand.
> What I want to do is to allocate ~2.5GB mem, it fails when stack limi=
t
> is unlimited, but succeeded when stack limit is 10240.

I cannot really answer your question but maybe this will give
you some more insight:

> $ free -m
>              total       used       free     shared    buffers     ca=
ched
> Mem:          2024       1996         28          0         30       =
1401
> -/+ buffers/cache:        563       1461
> Swap:        10236          0      10236
> $ ulimit -s
> 10240
> $ ./malloc 2500
> Malloc succeeded               <=3D=3D=3D=3D=3D=3D=3D succeeds when s=
tack limit is 10240
> $ ulimit -s unlimited
> $ ./malloc 2500
> malloc failed: Cannot allocate memory   <=3D=3D=3D=3D=3D=3D=3D=3D fai=
ls when stack
> limit is unlimited???

On 32-bit system, in standard configuration, user space programs can ad=
dress
up to 3GiB of RAM (the other 1GiB is reserved for kernel).  It's possib=
le
that with unlimited stack Linux reserves more address space for stack l=
eaving
less for heap -- this may cause malloc(3) to fail.

> BTW, there is no such problem on 64bit machine

On 64-bit system, the 3GiB address space limit described above does not=
 exist
and thus, if I'm correct, the program will succeed.

BTW. By default Linux does not allocate memory when calling malloc(3)
(sbrk(2) in fact). The pages are allocated when they are first
referenced.  This means, that even though malloc(3) returns non-NULL yo=
u
may have no access to the allocated area -- ie. program will segfault
trying to access it.  Yes, this is in violation of the C standard.

--=20
Best regards,                                            _     _
  .o. | Liege of Serenly Enlightened Majesty of         o' \,=3D./ `o
  ..o | Computer Science,  Micha=B3 "mina86" Nazarewicz      (o o)
  ooo +-----<mina86@tlen.pl>----<mina86@jabber.org>----ooO--(_)--Ooo--

--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
