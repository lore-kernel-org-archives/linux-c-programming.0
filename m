From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: dynamic linking
Date: Wed, 11 Sep 2002 17:43:53 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020911154353.GN1386@lug-owl.de>
References: <200209082200.26275.wrazlov@gmx.net> <200209082203.49132.wrazlov@gmx.net> <200209082306.27699.freyther@gmx.net> <200209091306.17099.wrazlov@gmx.net> <15740.44857.172146.892963@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="e+JRL32uBeeWnrD4"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <15740.44857.172146.892963@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--e+JRL32uBeeWnrD4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2002-09-09 15:24:57 +0100, Glynn Clements <glynn.clements@virgin.ne=
t>
wrote in message <15740.44857.172146.892963@cerise.nosuchdomain.co.uk>:

> > Is it possible to import let's say a class using dlopen?
>=20
> No; classes don't exist. At least, they don't exist as data within a
> binary (object file, library, executable). Classes only exist within
> the C++ compiler. The object files only contain individual functions
> and (global) variables.
>=20
> While it is possible to dynamically load libraries which are written
> in C++, it's a lot easier if you write C wrappers for the entry
> points.

For each classes constructor, also create a C'ish function exporting a
instantiated class as a void pointer. Then, you'll get access to classes
within the object file (*).

MfG, JBG
(*) It's more or less the only way, but personally I don't like OO
programming, so I don't use it, but co-workers of me do.

--=20
Jan-Benedict Glaw   .   jbglaw@lug-owl.de   .   +49-172-7608481
	 -- New APT-Proxy written in shell script --
	   http://lug-owl.de/~jbglaw/software/ap2/

--e+JRL32uBeeWnrD4
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9f2S5Hb1edYOZ4bsRAkQoAJoDrhtbGV3JS+Plb6lsljv7g8HHCACfWrQv
h0pQR5Laoxi6xocoQejfi0A=
=1Biy
-----END PGP SIGNATURE-----

--e+JRL32uBeeWnrD4--
