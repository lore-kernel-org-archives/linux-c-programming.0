From: Patrick Percot <ppercot@free.fr>
Subject: Re: Static memory allocation
Date: Sat, 25 Sep 2004 23:51:08 +0200 (CEST)
Sender: gcc-help-owner@gcc.gnu.org
Message-ID: <20040925.235108.67854428.ppercot@free.fr>
References: <20040924.145113.74752222.ppercot@free.fr>
	<20040925091401.39110.qmail@web52907.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <gcc-help-return-18037-gcc-help=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-help-unsubscribe-gcc-help=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc-help/>
List-Post: <mailto:gcc-help@gcc.gnu.org>
List-Help: <mailto:gcc-help-help@gcc.gnu.org>
In-Reply-To: <20040925091401.39110.qmail@web52907.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org, gcc-help@gcc.gnu.org

On Sat, 25 Sep 2004 10:14:01 +0100 (BST), Ankit Jain <ankitjain1580@yah=
oo.com> wrote

Hello Ankit,

> sorry boss but this also gives problem
> =

> [ankit@Ankit fft]$ cat try2.c
> #include <stdio.h>
> int main()
> {
> double a[1450][1450];
>  a[149][0]=3D999.999;
>  printf("%lf\n",a[149][0]);
>  return 0;
> }
> [ankit@Ankit fft]$ gcc try2.c
> [ankit@Ankit fft]$ ./a.out
> Segmentation fault
> =


Sure,  Claudio Bley  gave  you the  solution  (look at  ulimit). I  jus=
t
pointed you on another potential problem in your code.

[..Zapp=E9 94 lignes et 2428 caract=E8res..]

=C0+
PP
-- =

Groupe Morbihannais d'Utilisateurs de Logiciels Libres http://www.tuxbi=
han.org
GPG fingerprint =3D 1A4F E154 3D2C A20E E4CA  A543 7951 C5C2 E44A A0B5

Patrick Percot.
