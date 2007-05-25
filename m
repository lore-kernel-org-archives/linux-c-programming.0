From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: operator != not automatically defined when operator == is defined
Date: Fri, 25 May 2007 23:32:43 +0100
Message-ID: <18007.25611.966535.940360@cerise.gclements.plus.com>
References: <46558CFF.1010606@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <46558CFF.1010606@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> operator-notequal.cpp:14: error: no match for =91operator!=3D=92 in =91=
a !=3D b=92
>=20
> Now there need conceivably be no definition for operator !=3D other t=
han=20
> the not-ted value of what operator =3D=3D gives, so why does gcc want=
 me to=20
> define operator !=3D separately?
>=20
> Similarly even if I define only operator !=3D, gcc will tell me to=20
> separately define operator =3D=3D if I want to use that.
>=20
> For the pairs:
>=20
> =3D=3D and !=3D
>  > and <=3D
> < and >=3D
>=20
> it is mathematically illogical to have any definition for each operat=
or=20
> in the pair which does not output same as the not-ted output of the=20
> other operator in the pair,

In terms of mathematics, that's not even remotely true, particularly
for the inequalities (totally-ordered vs partially-ordered).

In C/C++ terms, it isn't necessarily true for the standard types; e.g.=20
if floating-point values x and y are both NaN, then both x=3D=3Dy and x=
!=3Dy
are false.

--=20
Glynn Clements <glynn@gclements.plus.com>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
