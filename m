From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: gcc: Floating point exception
Date: Sun, 20 Feb 2005 22:05:22 +0100
Message-ID: <20050220210522.GR17589@lug-owl.de>
References: <Pine.LNX.4.21.0502202150070.2008-100000@hestia>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eg5eBT6TqBL7dLoR"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0502202150070.2008-100000@hestia>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--eg5eBT6TqBL7dLoR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2005-02-20 21:58:54 +0100, J. <mailing-lists@xs4all.nl>
wrote in message <Pine.LNX.4.21.0502202150070.2008-100000@hestia>:
>  int red =3D 0;=20
>  int green =3D 128;=20
>  int blue =3D 0;
>=20
>  printf("%d %d %d\n", (100 / (256 / red)),=20
>    (100 / (256 / green)), (100 / (256 / blue)));

With red =3D blue =3D 0, you're having two divisions by zero. That won't
fly...

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

--eg5eBT6TqBL7dLoR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFCGPuSHb1edYOZ4bsRAvPzAJ0b9hccqPN6M5xMuWnyojbeRQOTcACgjszU
HQCrF7CBBHj621nrw1vfK8Y=
=9F1s
-----END PGP SIGNATURE-----

--eg5eBT6TqBL7dLoR--
