From: Steven Smith <sos22@cam.ac.uk>
Subject: Re: undefined sqrt()
Date: Thu, 24 Oct 2002 21:28:47 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20021024202847.GA11866@cam.ac.uk>
References: <20021024200624.GA1057@teamfinders.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20021024200624.GA1057@teamfinders.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> When I try to compile it, I get these messages:
>=20
> dragoon:/home/tschulze/bin # gcc -Wall -o glide glide.c
> /tmp/ccXahjXY.o: In function `main':
> /tmp/ccXahjXY.o(.text+0x98): undefined reference to `sqrt'
> collect2: ld returned 1 exit status
>=20
> Could someone please give me a hint why this doesn't work?
You need to link with the maths library.  Try this:

gcc -Wall -o glide glide.c -lm

Steven Smith,
sos22@cam.ac.uk.

--huq684BweRXVnRxX
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE9uFf/O4S8/gLNrjcRAmqWAJ4t3Q6+hqCfiWzpg26AgZBfZQPP1gCcCz5y
ulTgG/85gfHVQ0oXNF6fbuA=
=5iM3
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
