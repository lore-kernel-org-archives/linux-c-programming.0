From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: uint8_t  mean8[8] __attribute__ ((aligned (32))), *mp;
Date: Sat, 27 Nov 2004 11:08:13 +0100
Message-ID: <20041127100813.GD14719@lug-owl.de>
References: <20041126061831.5905.qmail@web52903.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n/aVsWSeQ4JHkrmm"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20041126061831.5905.qmail@web52903.mail.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux prg <linux-c-programming@vger.kernel.org>


--n/aVsWSeQ4JHkrmm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-11-26 06:18:31 +0000, Ankit Jain <ankitjain1580@yahoo.com>
wrote in message <20041126061831.5905.qmail@web52903.mail.yahoo.com>:
> if somebody can tell me what attribute is aligned here
>=20
>  uint8_t  mean8[8] __attribute__ ((aligned (32))),
> *mp;

gcc's info page tells that the mean8[] array will start at a byte that
can be devided by 32.

MfG, JBG

--=20
Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481             =
_ O _
"Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg  =
_ _ O
 fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Irak! =
  O O O
ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA)=
);

--n/aVsWSeQ4JHkrmm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBqFINHb1edYOZ4bsRAh8eAJ0QjniD1P6a0TR+qvL+hW6ti5q3ygCaAnCd
qEg9YIewRwpu2Pv5D73+Jpg=
=CxXt
-----END PGP SIGNATURE-----

--n/aVsWSeQ4JHkrmm--
