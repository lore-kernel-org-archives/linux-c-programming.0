From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: complex variable
Date: Fri, 10 Sep 2004 22:09:23 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040910200923.GK19967@lug-owl.de>
References: <E3E30069B061524E90BCEE4417E30661138526@monm207.monmouth.army.mil>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aqWxf8ydqYKP8htK"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E3E30069B061524E90BCEE4417E30661138526@monm207.monmouth.army.mil>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--aqWxf8ydqYKP8htK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-09-08 14:40:35 -0400, Huber, George K RDECOM CERDEC STCD SRI <=
George.K.Huber@us.army.mil>
wrote in message <E3E30069B061524E90BCEE4417E30661138526@monm207.monmouth.a=
rmy.mil>:
> #define MakeIndex(r,c)  (r)*NUM_COLS + (y)

Don't forgetan additional pair of braces around the statement. Consider

	MakeIndex(a,b) * 4

In this case, only "y" would be 4'ed, but not the whole expression.

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

--aqWxf8ydqYKP8htK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBQgnzHb1edYOZ4bsRAmfOAJ4+dIxZssH8IuZy0tVHCuRicB35WgCdGTcb
gtjobbJj70PYjKWh83xA9d0=
=uiH6
-----END PGP SIGNATURE-----

--aqWxf8ydqYKP8htK--
