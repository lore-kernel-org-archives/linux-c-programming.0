From: Ankit Jain <ankitjain1580@yahoo.com>
Subject: Re: Static memory allocation
Date: Sat, 25 Sep 2004 10:14:01 +0100 (BST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040925091401.39110.qmail@web52907.mail.yahoo.com>
References: <20040924.145113.74752222.ppercot@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040924.145113.74752222.ppercot@free.fr>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Patrick Percot <ppercot@free.fr>
Cc: linux prg <linux-c-programming@vger.kernel.org>

sorry boss but this also gives problem

[ankit@Ankit fft]$ cat try2.c
#include <stdio.h>
int main()
{
double a[1450][1450];
 a[149][0]=3D999.999;
 printf("%lf\n",a[149][0]);
 return 0;
}
[ankit@Ankit fft]$ gcc try2.c
[ankit@Ankit fft]$ ./a.out
Segmentation fault

thanks

ankit
 --- Patrick Percot <ppercot@free.fr> wrote:=20
> On Fri, 24 Sep 2004 11:57:08 +0100 (BST), Ankit Jain
> <ankitjain1580@yahoo.com> wrote
>=20
> > hi
>=20
> Hi,
>=20
> >=20
> > well i had tried to enquire about this problem
> >=20
> > i was not able to find the solution. i know it
> workds
> > when i declare the array globally. i know if i use
> > malloc it will work and i am using the same in my
> > program
> >=20
> > but this question is again in my mind that what
> could
> > be the reason that it dosent work here on my
> system
> > because last time when i asked this question on
> some
> > sytem it was able to run which they said that they
> > have less emory then that of my system
> >=20
> > my system config.: redhat linux 9.0 +512 RAM
> > this is what my terminal displays
> >=20
> > [ankit@Ankit fft]$ cat try2.c
> > #include <stdio.h>
> > int main()
> > {
> > double a[1450][1450];
> >  a[1450][0]=3D999.999;
>=20
> You do not just have a stack  problem : The upper
> bound is not 1450, but
> 1449, because the first index is 0.=20
>=20
> So  a[1449][0] has  more chances  to  work
> correctly,  but the  problems
> generated  by  such a  fault  can be  insidious  and
>  very difficult  to
> discover, because the error can appear later in your
> program.
>=20
> >  printf("%lf\n",a[1450][0]);
> >  return 0;
> > }
> > [ankit@Ankit fft]$ gcc try2.c
> > [ankit@Ankit fft]$ ./a.out
> > Segmentation fault
> > [ankit@Ankit fft]$
> >=20
> > i just want to know that if there is some problem
> > related to stack how t oget rid of it
> >=20
> > thanks
> >=20
> > ANkit
> >=20
> >=20
> >=20
> >=20
> >
>
_______________________________________________________________________=
_
> > Yahoo! Messenger - Communicate instantly..."Ping"=20
> > your friends today! Download Messenger Now=20
> > http://uk.messenger.yahoo.com/download/index.html
> >=20
>=20
> =C0+
> PP
> --=20
> Groupe Morbihannais d'Utilisateurs de Logiciels
> Libres http://www.tuxbihan.org
> GPG fingerprint =3D 1A4F E154 3D2C A20E E4CA  A543
> 7951 C5C2 E44A A0B5
>=20
> Patrick Percot.
> =20

_______________________________________________________________________=
_
Yahoo! Messenger - Communicate instantly..."Ping"=20
your friends today! Download Messenger Now=20
http://uk.messenger.yahoo.com/download/index.html
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
