From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: -fomit-frame-pointer + -g
Date: Sun, 10 Oct 2004 13:15:47 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20041010111547.GE5033@lug-owl.de>
References: <20041010110717.GA3207@jehuty.server01.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PYn5GdOhTT6Zr5C/"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20041010110717.GA3207@jehuty.server01.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--PYn5GdOhTT6Zr5C/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2004-10-10 13:07:17 +0200, Ricardo Catalinas Jimenez <th1nk3r@serve=
r01.org>
wrote in message <20041010110717.GA3207@jehuty.server01.org>:
> So when I do: gcc -o test test.c -g -fomit-frame-pointer
>=20
> What happend, can I debug correctly?

Even easier than asking others to dig into your problem, how about just
firing up a gdb yourself and have a try? You'd just see the result:-)

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

--PYn5GdOhTT6Zr5C/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBaRnjHb1edYOZ4bsRArQ6AJ9OOW4hySQH1vAwpHlcBbxR8ArGpgCfSjcp
MweEugnCjMRQNbVADb7PMQ4=
=l5jg
-----END PGP SIGNATURE-----

--PYn5GdOhTT6Zr5C/--
