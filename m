From: Nico Schottelius <nico-linux-c-programming@schottelius.org>
Subject: Re: getline()
Date: Sun, 24 Aug 2003 23:59:56 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030824215956.GF25257@schottelius.org>
References: <20030824203653.A574@Imrashi.net.bd> <16201.12026.604756.905114@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l+goss899txtYvYf"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16201.12026.604756.905114@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
To: Glynn Clements <glynn.clements@virgin.net>
Cc: Progga <abulfazl@juniv.edu>, linux-c-programming@vger.kernel.org


--l+goss899txtYvYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> getline() is in libc. The prototype is in stdio.h, but you may need to
> use -D_GNU_SOURCE to enable it.

...and then you won't be able to use it with the dietlibc anymore...

no good idea ihmo.

Nico

--l+goss899txtYvYf
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE/STVczGnTqo0OJ6QRAvZNAKC/GTeOgObh/TT6OP0b6+S6zPNgTQCgg1r2
oXRjyZyDSp69iuvrSQuK+ig=
=Colm
-----END PGP SIGNATURE-----

--l+goss899txtYvYf--
