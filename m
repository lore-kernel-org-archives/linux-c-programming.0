From: Steven Smith <sos22@cam.ac.uk>
Subject: Re: NIPQUAD function?
Date: Mon, 20 May 2002 18:43:15 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020520174315.GA320@cam.ac.uk>
References: <5DC68F406DB77B443BE9AB7119D304EF@william.fitzgerald3.beer.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5DC68F406DB77B443BE9AB7119D304EF@william.fitzgerald3.beer.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: william fitzgerald <william.fitzgerald3@beer.com>
Cc: linux-c-programming@vger.kernel.org


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> does anyone know what exactly does the NIPQUAD() function do. i seen=20
> it in a patch to get source and destination addresses of an ip packet.
>=20
> where is it defined in the linux source?
There's a NIPQUAD in /usr/include/linux/kernel.h, or
/usr/src/linux/include/linux/kernel.h.

You might also want to look at man grep.

Steven Smith,
sos22@cam.ac.uk.

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE86TWzO4S8/gLNrjcRAop0AKDCh8qMpJEeFBoC1jJDf7helBCWOwCfVO6O
hDe/xyjEFHGufb6qw++lqh4=
=DaXY
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--
