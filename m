From: Steven Smith <sos22@cam.ac.uk>
Subject: Re: (F)structure size
Date: Wed, 5 Mar 2003 09:06:56 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030305090656.GA375@cam.ac.uk>
References: <Pine.LNX.4.33.0303051227480.30291-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0303051227480.30291-100000@soochak.ncst.ernet.in>
List-Id: <linux-c-programming.vger.kernel.org>
To: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Cc: linux c programming mailing list <linux-c-programming@vger.kernel.org>


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> why the sizeof sturcture is alway greater than the collective sizes of al=
l=20
> the elements in it.
>=20
> eg
> struct node {
> 	int	a;
> 	char	c;
> 	int	b;
> };
It is not, in general, possible to (portably) estimate the size of a
structure just by looking at its fields, as the compiler is free to add
padding if that allows better code.

In particular, most systems can only efficiently access memory
locations if the address of the location is a multiple of its size
(i.e. if its naturally aligned).  This means that if the structure is
to be stored in an array, its size must be a multiple of the size of
the largest single member, so that every element has proper alignment.
In this case, the largest member is an int, and so the whole
structure's size must be a multiple of four.

Steven Smith,
sos22@cam.ac.uk.

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)

iD8DBQE+Zb4vO4S8/gLNrjcRAvAGAJ93OsFBHUZOniehhcFpLNP+72nj0ACgikiB
pQ3tnoBRxaGFJj5gicz8jXI=
=Hf+e
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
