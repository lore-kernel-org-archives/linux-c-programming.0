From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: md5sum or libraries
Date: Sun, 2 Jan 2005 21:55:53 +0100
Message-ID: <20050102205553.GO2460@lug-owl.de>
References: <200501021822.55287.benjamin@benjamin76.plus.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pYU1PAVEPli1Yt9/"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200501021822.55287.benjamin@benjamin76.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--pYU1PAVEPli1Yt9/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2005-01-02 18:22:55 +0000, Benjamin Jeeves <benjamin@benjamin76.plu=
s.com>
wrote in message <200501021822.55287.benjamin@benjamin76.plus.com>:
> I have written the code to scan the folders but can not find anything on=
=20
> md5sum or md5_file for C?

libgcrypt does implement a number of cryptographic hash functions, md5
is fur sure one of those. However, you've got to do the file-reading
yourself (though, that shouldn't be much of a problem :)

But keep in mind that md5 is nowadays considered broken. So if you just
want to check some random files, it may serve you very well, but if you
need to to some contract-checking or things like that, you should
consider other hash functions.

MfG, JBG

--=20
Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481             =
_ O _
"Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg  =
_ _ O
 fuer einen Freien Staat voll Freier B=C3=BCrger" | im Internet! |   im Ira=
k!   O O O
ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA)=
);

--pYU1PAVEPli1Yt9/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFB2F/ZHb1edYOZ4bsRAnJbAJ95odgqSZSWmj+yJJrWeS7BcN2DDwCgjJes
nLJEbLlc62wbtR5D4Doaxww=
=uVz1
-----END PGP SIGNATURE-----

--pYU1PAVEPli1Yt9/--
