From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Question about Malloc
Date: Tue, 19 Oct 2004 15:27:38 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20041019132738.GR5033@lug-owl.de>
References: <1097386256.6100.16.camel@localhost.localdomain> <20041010111316.GD5033@lug-owl.de> <a3c4234104101905413e127d3e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Az0epPX+YORSTLVv"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a3c4234104101905413e127d3e@mail.gmail.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux prg <linux-c-programming@vger.kernel.org>


--Az0epPX+YORSTLVv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-10-19 09:41:49 -0300, Mat=EDas Aguirre <matiasaguirre@gmail.co=
m>
wrote in message <a3c4234104101905413e127d3e@mail.gmail.com>:
> It's not safer to make:
>=20
> Recpointer r;
> r=3D(Recpointer)malloc(Recpointer);

malloc is void, while r isn't. So you don't need the cast here. However,
notice that your malloc call is actually wrong: the argument isn't a
number (or sizeof(something)), but only a type.

General rule of thumb:

	The "output" of malloc should be assigned to a variable whose
	type is a pointer to whatever you give to sizeof(xxx) as the
	malloc argument.

or in short:

	One star more on the left than on the right.

Of course, if you play with types, this doesn't apply any longer...

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

--Az0epPX+YORSTLVv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBdRZKHb1edYOZ4bsRAjDNAKCGWaR0aGdpFZtaF6eo1eptD9tRZgCffSq2
545lEbFu0oYIQxCW8H3RsQg=
=XKkI
-----END PGP SIGNATURE-----

--Az0epPX+YORSTLVv--
