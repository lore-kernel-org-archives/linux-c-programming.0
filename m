From: =?iso-8859-2?B?TWljaGGzIE5hemFyZXdpY3o=?= 
	<m.nazarewicz@samsung.com>
Subject: Re: strange stack limit behavior when allocating more than 2GB mem	on
 32bit machine
Date: Fri, 21 Aug 2009 12:33:15 +0200
Message-ID: <op.uy0cxpd9lak3lt@amdc030.digital.local>
References: <56b13acf0908202047k2bf536f9vf993394d42059b8e@mail.gmail.com>
 <19086.17786.445616.394966@cerise.gclements.plus.com>
 <56b13acf0908210212t5b6921f5h4c224efa21d2f067@mail.gmail.com>
 <20090821093750.GA16299@opentech.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <20090821093750.GA16299@opentech.at>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	delsp=yes"
To: Nicholas Mc Guire <mcguire@lzu.edu.cn>, Joe <longapple@gmail.com>
Cc: Glynn Clements <glynn@gclements.plus.com>, linux-c-programming@vger.kernel.org

> On Fri, 21 Aug 2009, Joe wrote:
>> Thanks for your explanation. However as you can see, I got 2GB mem a=
nd
>> ~10GB swap, totally 12GB.
>>
>> With ulimit -s 10240(KB), I can allocate 2.5GB, I guess these are in
>> swap, right?
>> With ulimit -s unlimited, as you said, kernel reserved 1GB, stack
>> reserved 2GB, there are still 12-3=3D9GB left??
>>
>> Why did malloc failed, instead of allocating this abundant swap spac=
e?

On Fri, 21 Aug 2009 11:37:50 +0200, Nicholas Mc Guire <mcguire@lzu.edu.=
cn> wrote:
> Initializing 12GB swap will not change the address space limit unless=
 you
> enabled high-memory support in the kernel (CONFIG_HIGHMEM64G=3Dy in y=
our .config)
> the limit is not the physical memory (RAM+swap) but the 32bit address=
 space.

This won't help either since CONFIG_HIGHMEM64G (ie. Physical Address Ex=
tension)
affects only physical (not virtual) address space.  Because Joe has 1 G=
iB
HIGHMEM64G it will only slow his computer down (virtual->physical addre=
ss
translation requires one more read when HIGHMEM64G is enabled).  Even w=
ith
gazillion GiBs of RAM CONFIG_HIGHMEM64G won't help here because the pro=
blem
is *virtual* address space limits which is 32-bit on 32-bit x86 systems
(regardless high memory (be it 4G or 64G) being enabled).

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
