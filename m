From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: Curious segmentation fault - please help
Date: Sat, 13 May 2006 21:57:19 +0530
Message-ID: <200605132157.24997.samjnaa@gmail.com>
References: <200605131958.39156.samjnaa@gmail.com> <6a00c8d50605130809pba67862gd981f8bf0fa6927f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart5454444.UgY3Gd9it9";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50605130809pba67862gd981f8bf0fa6927f@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

--nextPart5454444.UgY3Gd9it9
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Saturday 13 May 2006 20:39 samaye, Steve Graegert alekhiit:

> Looks like the function 'listsplpanchaanga' tries to access the
> 'grahanaama' array's nth element with only n - 1 being present
> ('vaasara =3D 6' accesses the last, 7th, element),=20

Yep. But the array does contain 7 elements. Vide line 64 of monthpan.c:

char *grahanaama[] =3D {"Bhaanu", "Soma", "Mangala", "Budha", "Guru", "Shuk=
ra",=20
"Shani"};

[celestialbodyname[] =3D "Sun", "Moon", "Mars", "Mercury", "Jupiter", "Venu=
s",=20
"Saturn" -- for weekday]

> thus causing a=20
> segfault. =20

=2E.. so how can a segfault be caused? As you see the valgrind-output,=20

debug: vaasara =3D 1, graha =3D    Soma
debug: vaasara =3D 2, graha =3D Mangala
debug: vaasara =3D 3, graha =3D   Budha
debug: vaasara =3D 4, graha =3D    Guru
debug: vaasara =3D 5, graha =3D  Shukra
debug: vaasara =3D 6, graha =3D   Shani

vaasara[6] does give the correct output. The fault is seen *after* vaasara[=
6]=20
is read and written to stdout:

=3D=3D9675=3D=3D Invalid read of size 1
=3D=3D9675=3D=3D  Address 0x726956 is not stack'd, malloc'd or (recently) f=
ree'd
=3D=3D9675=3D=3D
=3D=3D9675=3D=3D Process terminating with default action of signal 11 (SIGS=
EGV)
=3D=3D9675=3D=3D  Access not within mapped region at address 0x726956
=3D=3D9675=3D=3D    by 0x40A5C92: printf (in /lib/libc-2.4.so)
=3D=3D9675=3D=3D    by 0x8049B7D: listsplpanchaanga (monthpan.c:593)
debug: vaasara =3D 0, graha =3D =3D=3D9675=3D=3D

(Trimmed)

> step in the loop.  Maybe you can simply correct the error by accessing
> 'grahanaama' using 'vaasara - 1': grahanaama[vaasara - 1] if this is
> what you wanted to achieve.

But then I would not get grahanaama[0] =3D "Surya" which is what I want to =
get.=20
Actually this program compiled and worked perfectly on GCC 4.02 with SUSE=20
10.0. (And also GCC 4.1 with SUSE 10.0 I think.) But since I upgraded to SU=
SE=20
10.1, I get this error. SUSE 10.1 has gcc 4.1 and glibc 2.4, [as I am sure=
=20
you as a fellow suser know] if that means anything...

> At least, this is my first guess.  I have not yet fully grasped the
> meaning of the code, due to difficulties in understanding the variable
> and function names :-)

Sanskrit. It's an ancient-Indian-astronomy application.

=2D-=20

Tux #395953 resides at http://samvit.org
playing with KDE 3.51 on SUSE Linux 10.1
$ date [] CCE +2006-05-13 W19-6 UTC+0530

--nextPart5454444.UgY3Gd9it9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBEZgjsLOFFQi4zqy0RAtHfAKCZul+TQCICkStBfifFEPE4zIRL6ACgk5uE
cMWTjL9IWxjKm+GV9En1HwE=
=AFQy
-----END PGP SIGNATURE-----

--nextPart5454444.UgY3Gd9it9--
