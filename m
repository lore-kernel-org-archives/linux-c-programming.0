From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: can't initialize a constant using another constant?
Date: Thu, 28 Feb 2008 09:52:02 +0000
Message-ID: <18374.33858.873906.968995@cerise.gclements.plus.com>
References: <47C422E6.8050702@gmail.com>
	<18373.19696.942794.821373@cerise.gclements.plus.com>
	<47C5F3D7.7020002@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <47C5F3D7.7020002@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> Thanks to all those who replied. I am very sorry I did not specify th=
e=20
> compiler version etc. I should have. It's gcc version 4.1.3 20070929=20
> (prerelease) (Ubuntu 4.1.2-16ubuntu2).
>=20
> Glynn Clements wrote:
> > In C, "const" is only relevant to pointer targets. Adding the "cons=
t"
> > modifier to a variable has no effect.
>=20
> I don't understand what you mean. I just tried gcc -o foo foo.c on:
>=20
> # include <stdio.h>
> main () {
>          const int i =3D 1 ;
>          i =3D 2 ;
>          printf ( "%d\n", i ) ;
> }
>=20
> and I got:
>=20
> foo.c: In function =EF=BF=BDmain=EF=BF=BD:
> foo.c:6: error: assignment of read-only variable =EF=BF=BDi=EF=BF=BD
>=20
> So in what sense are you saying adding const to a variable has no eff=
ect?

Sorry; my mistake.

However, although the compiler will prevent modification to const
objects (and if the compiler didn't, the CPU will, as they are stored
in the .rodata section, which is mapped read-only), they are still
considered variables rather than (compile-time) constants, and can't
be used in initialisers or in array dimensions.

In C++, const-qualified objects are treated as compile-time constants.

--=20
Glynn Clements <glynn@gclements.plus.com>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
