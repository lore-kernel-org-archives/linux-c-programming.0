From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Way to leave-out unused functions while linking to a library
Date: Tue, 23 May 2006 14:43:32 +0530
Message-ID: <200605231443.35393.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1608415.IK7bNpSxlY";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

--nextPart1608415.IK7bNpSxlY
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I asked this question on this list some time back, IIRC -- how to leave-out=
=20
unused functions while linking to a library?

The normal behaviour is that if a library.c contains two functions fna() an=
d=20
fnb() and main.c calls only fna(), compiling library.c and main.c and linki=
ng=20
to form an executable will result in the fnb() function getting included in=
=20
the final executable, though it is never used in the entire course of the=20
program.

So how to stop fnb() from getting linked in?

Over at the GNU GCC list, a good soul gave us the solution. Use -

=2Dffunction-sections -fdata-sections=20

as compiler options and=20

=2D-gc-sections=20

as a linker option. If you are calling the linker indirectly via the compil=
er=20
gcc (i.e. if you are directly creating executables using gcc without a=20
separate call to ld) then give it the options:=20

=2Dffunction-sections -fdata-sections -Wl,--gc-sections=20

[exactly as it is, with the comma] so that the compiler passes the appropri=
ate=20
option on to the linker. This method worked for me!

=2D-=20

Tux #395953 resides at http://samvit.org
playing with KDE 3.51 on SUSE Linux 10.1
$ date [] CCE +2006-05-23 W21-2 UTC+0530

--nextPart1608415.IK7bNpSxlY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBEctI/LOFFQi4zqy0RAq9VAJ9dxYNw4UZnyRaZqTPWwnQqWtdBqwCeKWVE
I+jCLvvEO00R5rhbpK8Lxp4=
=1peC
-----END PGP SIGNATURE-----

--nextPart1608415.IK7bNpSxlY--
