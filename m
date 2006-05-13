From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: Curious segmentation fault - please help
Date: Sun, 14 May 2006 00:28:13 +0530
Message-ID: <200605140028.17718.samjnaa@gmail.com>
References: <200605131958.39156.samjnaa@gmail.com> <200605132157.24997.samjnaa@gmail.com> <6a00c8d50605131020o6665b157u18b72e93cc04411b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1155657.UjRGbsKR3r";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50605131020o6665b157u18b72e93cc04411b@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

--nextPart1155657.UjRGbsKR3r
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Saturday 13 May 2006 22:50 samaye, Steve Graegert alekhiit:

> > vaasara[6] does give the correct output. The fault is seen *after*
> > vaasara[6] is read and written to stdout:
>
> which accesses the last element correctly.  Nevertheless, the function
> tries to read one more character causing a segfault.  Please don't
> misinterpret valgind's output: we are still in listsplpanchaanga().

Of course. But all I am doing is using the standard fprintf function. Is it=
=20
possible that the behaviour of this function would have changed from glibc=
=20
2.36 to glibc 2.4?

> Hm, don't know what could have changed.  I am not a SuSEr anymore;
> returned to Debian and NetBSD.

So can't see you anymore on SLE?

=2D-=20

Tux #395953 resides at http://samvit.org
playing with KDE 3.51 on SUSE Linux 10.1
$ date [] CCE +2006-05-14 W19-7 UTC+0530

--nextPart1155657.UjRGbsKR3r
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBEZixJLOFFQi4zqy0RAsv7AKCSQ73Jd1rH4ZgHnR65iSB8Q8VxnwCeO1ly
yOvtKmkPv+DxAilTtkjBODk=
=DexG
-----END PGP SIGNATURE-----

--nextPart1155657.UjRGbsKR3r--
