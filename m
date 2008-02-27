From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: can't initialize a constant using another constant?
Date: Thu, 28 Feb 2008 05:05:51 +0530
Message-ID: <47C5F3D7.7020002@gmail.com>
References: <47C422E6.8050702@gmail.com> <18373.19696.942794.821373@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <18373.19696.942794.821373@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Thanks to all those who replied. I am very sorry I did not specify the=20
compiler version etc. I should have. It's gcc version 4.1.3 20070929=20
(prerelease) (Ubuntu 4.1.2-16ubuntu2).

Glynn Clements wrote:
> In C, "const" is only relevant to pointer targets. Adding the "const"
> modifier to a variable has no effect.

I don't understand what you mean. I just tried gcc -o foo foo.c on:

# include <stdio.h>
main () {
         const int i =3D 1 ;
         i =3D 2 ;
         printf ( "%d\n", i ) ;
}

and I got:

foo.c: In function =91main=92:
foo.c:6: error: assignment of read-only variable =91i=92

So in what sense are you saying adding const to a variable has no effec=
t?

Shriramana Sharma.
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
