From: Steven Smith <sos22@cam.ac.uk>
Subject: Re: strange gcc warning
Date: Mon, 13 Jan 2003 18:26:13 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030113182613.GA11191@cam.ac.uk>
References: <20030113175755.71066.qmail@web8001.mail.in.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20030113175755.71066.qmail@web8001.mail.in.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: Shanks <mshanks79@yahoo.co.in>
Cc: linux-c-programming@vger.kernel.org


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> void
> my_print(int errno)
Defining a parameter to shadow a global variable is always a bad idea,
but it's an especially bad idea for errno. In multi-threaded programs,
and programs compiled with a certain set of flags, errno is actually a
preprocessor macro.  Usually, when using glibc, errno expands to
(*__errno_location()), and so your prototype expands to void
my_print(int (*__errno_location())).  gcc interprets this as a pointer
to a function returning an int pointer, which was probably not what
you expected.

> {
>     printf("ERRNO: %d\n", errno);
Now, this expands to ``printf("ERRNO: %d\n", (*__errno_location()));".
__errno_location is a function pointer returning an int *, and so
this calls the first argument, and then dereferences the returned
value.

> }
>=20
> int
> main()
> {
>     int a =3D 10;
>     errno =3D 0;
>     my_print(a);
a is now implicitly converted to a pointer to function returning int
*.  When the code is run, my_print tries to call a function at address
10 in memory, and crashes.

> }

Steven Smith,
sos22@cam.ac.uk.

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)

iD8DBQE+IwTFO4S8/gLNrjcRAsbCAKCqKgEAPJv9EMjbORlIBxvmcDaDfQCdHdKt
H3uoBu5DK1V1PmI27UCR978=
=ctVR
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
