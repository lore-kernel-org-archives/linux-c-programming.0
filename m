From: "Steven Smith" <sos22@cam.ac.uk>
Subject: Re: Calculating 64-Bit Values
Date: Thu, 13 May 2004 15:30:47 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040513143047.GA5370@archibold.chu.cam.ac.uk>
References: <1084456108.802075@slbhw0>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1084456108.802075@slbhw0>
List-Id: <linux-c-programming.vger.kernel.org>
To: Jonas Appel <jonas.appel@jonas-appel.de>
Cc: linux-c-programming@vger.kernel.org, sos22@srcf.ucam.org


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> typedef unsigned long long int64;
>=20
> int64 val =3D 0x7c95674beb4000;
Try:

int64 val =3D 0x7c95674beb4000ll;

gcc won't generate a long long constant unless you explictly tell it
to; it tries to stuff the whole thing into 32 bits, which doesn't
really work.

Incidentally, you might want to pick a different name for your typedef
-- int64 is usually signed.

> And printing the value works like this:
>=20
> printf("Value: %8lx%8lx\n", timestamp[0], timestamp[1]);
printf("Value: %llx", timestamp);

should work.  You may need %qx instead of %llx on some really old
systems, or conceivably %Lx.

Steven Smith.

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (FreeBSD)

iD8DBQFAo4aXO4S8/gLNrjcRAisAAJ9JBrgdJMpXq5pfNwh8vJ2Si5lv5ACgofp8
UbXD7v/bPhF8Ia0Q59h18hY=
=/clK
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
