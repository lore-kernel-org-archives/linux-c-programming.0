From: Patrick Percot <ppercot@free.fr>
Subject: Re: Static memory allocation
Date: Fri, 24 Sep 2004 14:51:13 +0200 (CEST)
Sender: gcc-help-owner@gcc.gnu.org
Message-ID: <20040924.145113.74752222.ppercot@free.fr>
References: <20040924105708.5067.qmail@web52904.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <gcc-help-return-18021-gcc-help=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-help-unsubscribe-gcc-help=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc-help/>
List-Post: <mailto:gcc-help@gcc.gnu.org>
List-Help: <mailto:gcc-help-help@gcc.gnu.org>
In-Reply-To: <20040924105708.5067.qmail@web52904.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: ankitjain1580@yahoo.com
Cc: gcc-help@gcc.gnu.org, linux-c-programming@vger.kernel.org

On Fri, 24 Sep 2004 11:57:08 +0100 (BST), Ankit Jain <ankitjain1580@yah=
oo.com> wrote

> hi

Hi,

> =

> well i had tried to enquire about this problem
> =

> i was not able to find the solution. i know it workds
> when i declare the array globally. i know if i use
> malloc it will work and i am using the same in my
> program
> =

> but this question is again in my mind that what could
> be the reason that it dosent work here on my system
> because last time when i asked this question on some
> sytem it was able to run which they said that they
> have less emory then that of my system
> =

> my system config.: redhat linux 9.0 +512 RAM
> this is what my terminal displays
> =

> [ankit@Ankit fft]$ cat try2.c
> #include <stdio.h>
> int main()
> {
> double a[1450][1450];
>  a[1450][0]=3D999.999;

You do not just have a stack  problem : The upper bound is not 1450, bu=
t
1449, because the first index is 0. =


So  a[1449][0] has  more chances  to  work correctly,  but the  problem=
s
generated  by  such a  fault  can be  insidious  and  very difficult  t=
o
discover, because the error can appear later in your program.

>  printf("%lf\n",a[1450][0]);
>  return 0;
> }
> [ankit@Ankit fft]$ gcc try2.c
> [ankit@Ankit fft]$ ./a.out
> Segmentation fault
> [ankit@Ankit fft]$
> =

> i just want to know that if there is some problem
> related to stack how t oget rid of it
> =

> thanks
> =

> ANkit
> =

> =

> =

> =

> _____________________________________________________________________=
___
> Yahoo! Messenger - Communicate instantly..."Ping" =

> your friends today! Download Messenger Now =

> http://uk.messenger.yahoo.com/download/index.html
> =


=C0+
PP
-- =

Groupe Morbihannais d'Utilisateurs de Logiciels Libres http://www.tuxbi=
han.org
GPG fingerprint =3D 1A4F E154 3D2C A20E E4CA  A543 7951 C5C2 E44A A0B5

Patrick Percot.
