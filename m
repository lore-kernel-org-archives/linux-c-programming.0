From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: dereferencing pointer to incomplete type in current->pid
Date: Fri, 22 Nov 2002 21:11:30 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20021122201129.GJ30328@lug-owl.de>
References: <3DDE8109.375DA70C@upsa.es>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEkEgRdBLZYkpbX2"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3DDE8109.375DA70C@upsa.es>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--PEkEgRdBLZYkpbX2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2002-11-22 20:10:01 +0100, Alberto <apedrero@upsa.es>
wrote in message <3DDE8109.375DA70C@upsa.es>:
> Hi,
>=20
> I'm triying to work with the current macro. When i compile this code i
> get the message:
> "dereferencing pointer to incomplete type".

You're mixing up kernel space (where something like "current" exists and
user space, where this concept is meaningless.

This is why it simply doesn't exist there...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet!
   Shell Script APT-Proxy: http://lug-owl.de/~jbglaw/software/ap2/

--PEkEgRdBLZYkpbX2
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)

iD8DBQE93o9xHb1edYOZ4bsRAmdxAJ93Uymq6e3i+JjoHal0nCDihPxzCQCfR759
bHxRQ8M7KEbjWQQIVGiYZsc=
=efdT
-----END PGP SIGNATURE-----

--PEkEgRdBLZYkpbX2--
