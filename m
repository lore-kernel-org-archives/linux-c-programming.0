From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: newby.-interpreting C
Date: Thu, 30 Dec 2004 12:40:11 +0100
Message-ID: <20041230114011.GA2460@lug-owl.de>
References: <cq77vi$1ej$1@sea.gmane.org> <20041220211709.GD2460@lug-owl.de> <16851.58832.659413.893211@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NEAn2rYUJijllS+S"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16851.58832.659413.893211@gargle.gargle.HOWL>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--NEAn2rYUJijllS+S
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-12-30 11:26:08 +0000, Glynn Clements <glynn@gclements.plus.com>
wrote in message <16851.58832.659413.893211@gargle.gargle.HOWL>:
> Jan-Benedict Glaw wrote:
>=20
> > General rule: if you don't *need* this for a good reason, or if you even
> > don't know what it does, you don't need it, since it also introduces a
> > performance penalty: CPUs tend to be fast at naturally aligned memory
> > accesses, but quite slow on non-aligned accesses.
>=20
> On most processor types, unaligned accesses will fail (either generate
> an exception or return bogus data). The x86 family is the exception,
> in that unaligned access merely reduces performance.

As is the VAX :)

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

--NEAn2rYUJijllS+S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFB0+kbHb1edYOZ4bsRAlKjAJ95xUtj3c8wTQXhtQ0393WuSsWIyACfXYyp
TUQlemMztr4Vnojio14FInY=
=LSu3
-----END PGP SIGNATURE-----

--NEAn2rYUJijllS+S--
