From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: extern storage class & multiple declaration
Date: Thu, 22 Aug 2002 10:02:53 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020822080253.GR10730@lug-owl.de>
References: <20020822075234.20104.qmail@relay1.home.ro>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xt4oM5y0t/70YhQj"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020822075234.20104.qmail@relay1.home.ro>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--xt4oM5y0t/70YhQj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2002-08-22 07:52:34 -0000, Alina Valea <avalea@home.ro>
wrote in message <20020822075234.20104.qmail@relay1.home.ro>:
> Hello everybody,
>=20
> Suppose we have:

[
	file.h declares a variable,
	file.c defines it, but doesn't use it and
	some_file.c includes file.h and uses mentioned variable
]

> I know this is entirely correct, but is it an acceptable
> programming habit?

This is not only correct but also done very often. Sometimes, you can't
go around global variables. In such a case, it's better to have a
"globals.h" (declaring *all* global variables) and a matchins globals.c
file (defining them all, possibly initializing them to useful default
values).

This is a _lot_ better than spreading all those global variables over a
zillion .c files, and locally declaring them in any .c file which uses
(but doesn't define) it. That's quite error-prone (eg. small things like
signed <-> unsigned conflicts *will* come up at some time, and you'll
spend a day or two for searching the difference).

Having all global variables (if any exist) iat one place (in conjunction
with a matching header file) is a good thing helping to not do stupid
mistakes...

MfG, JBG

--=20
Jan-Benedict Glaw   .   jbglaw@lug-owl.de   .   +49-172-7608481
	 -- New APT-Proxy written in shell script --
	   http://lug-owl.de/~jbglaw/software/ap2/

--xt4oM5y0t/70YhQj
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9ZJqtHb1edYOZ4bsRAu3cAJ0QXXI3/6AEtLmcO1lZxoX5ULr3NACgicLG
/0G5DBopo0DgQHWCin4ix8c=
=I3NE
-----END PGP SIGNATURE-----

--xt4oM5y0t/70YhQj--
