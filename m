From: "Steven Smith" <sos22@cam.ac.uk>
Subject: Re: problem in open sys call
Date: Tue, 20 Apr 2004 22:35:11 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040420213511.GA75589@archibold.chu.cam.ac.uk>
References: <40856C8C.9090003@sancharnet.in>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <40856C8C.9090003@sancharnet.in>
List-Id: <linux-c-programming.vger.kernel.org>
To: joy <gracecott@sancharnet.in>
Cc: linux-c-programming@vger.kernel.org


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> I have a small prblem i the open call. it fails every time and I dont=20
> know why.

> const char opcode[]=3D"opcode.sheet";
>=20
> main()
> {
> 	char buff[8192],temp[10],bin=3D0,opcode[3];
Umm... did you mean to hide the global opcode behind a local which
never gets initialised?

Also, you may want to look at the man pages for:

errno(3)
err(3)
strerror(3)
gdb(1)
strace(1)

Steven Smith.

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (FreeBSD)

iD8DBQFAhZePO4S8/gLNrjcRAsAjAJ46GNXvhcstrxXICju2hE2Alfyc3ACfRKAF
z3+l3YMxnNDRQYi5J7ioSyc=
=5UJj
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
