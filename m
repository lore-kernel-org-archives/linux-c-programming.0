From: "Steven Smith" <sos22@cam.ac.uk>
Subject: Re: Linux source code: malloc.c
Date: Thu, 6 Jan 2005 09:11:04 +0000
Message-ID: <20050106091104.GA3805@archibold>
References: <20041230130432.4f93abe2@tethys.montpellier.4js.com> <000b01c4eff2$623ff7e0$8a7e4ed5@j0s6l8> <013701c4f3be$6b230710$dc846840@apac.cisco.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <013701c4f3be$6b230710$dc846840@apac.cisco.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Venkatesh Joshi <joshiv@cisco.com>
Cc: linux-c-programming@vger.kernel.org, sos22@srcf.ucam.org


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Where can I see the implementation of free() and malloc() in Linux
> source code? I am not able to locate the file malloc.c.
That's because malloc() isn't in Linux-the-kernel: it's in glibc.
The file you're looking for is malloc/malloc.c in the glibc tarball.

Steven Smith.
--=20
One day, I'm going to get an Alice-bot to answer all my email for me,
and see how long it takes people to notice.

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (FreeBSD)

iD8DBQFB3QCoO4S8/gLNrjcRAorGAKCROZKAUO336PZu0dwz5s8rOlJpRACg2bD0
Bd4sm7b+TyNYxWRzlXVd45g=
=f1bS
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
