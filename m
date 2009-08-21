From: =?iso-8859-2?B?TWljaGGzIE5hemFyZXdpY3o=?= 
	<m.nazarewicz@samsung.com>
Subject: Re: strange stack limit behavior when allocating more than 2GB mem on
 32bit machine
Date: Fri, 21 Aug 2009 14:21:25 +0200
Message-ID: <op.uy0hxziblak3lt@amdc030.digital.local>
References: <56b13acf0908202047k2bf536f9vf993394d42059b8e@mail.gmail.com>
 <19086.17786.445616.394966@cerise.gclements.plus.com>
 <56b13acf0908210212t5b6921f5h4c224efa21d2f067@mail.gmail.com>
 <op.uy0adwzdlak3lt@amdc030.digital.local>
 <56b13acf0908210404m4c235834qb874873403bfb689@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <56b13acf0908210404m4c235834qb874873403bfb689@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	delsp=yes"
To: Joe <longapple@gmail.com>
Cc: Glynn Clements <glynn@gclements.plus.com>, linux-c-programming@vger.kernel.org

On Fri, 21 Aug 2009 13:04:11 +0200, Joe <longapple@gmail.com> wrote:

> Clear. But how comes 2000MB can be allocated when stack limit is unli=
mited?
>
> $ ulimit -s
> unlimited
> $ ./malloc 2046
> Malloc succeeded
> $ ./malloc 2047
> malloc failed: Cannot allocate memory           <=3D=3D=3D=3D the cri=
tical
> point for my case is 2046MB

Because, there is a large enough continuous area in address space.
I'm not sure how to answer that differently.

PS. Again, do not top post and remove unnecessary comments and signatur=
es.

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
