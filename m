From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: file deletion
Date: Fri, 31 Dec 2004 18:55:48 +0100
Message-ID: <20041231175548.GE2460@lug-owl.de>
References: <20041230130432.4f93abe2@tethys.montpellier.4js.com> <000b01c4eff2$623ff7e0$8a7e4ed5@j0s6l8>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8sxJaLVqap9C0Cus"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000b01c4eff2$623ff7e0$8a7e4ed5@j0s6l8>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--8sxJaLVqap9C0Cus
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 2005-01-01 11:09:37 -0000, Andy <andy_webb@onetel.com>
wrote in message <000b01c4eff2$623ff7e0$8a7e4ed5@j0s6l8>:
> Gents,
> thanks for this, this script seems to do the trick.
> Actually what I meant by "duplicate" but didn't clarify
> was identical name and file size, dates do not matter.
> What does md5sum {} do?

The "find" command will substitute "{}" inside an "-exec ... ;"
expression with the filename it currently checks. So this is only a
md5sum call with a given filename.

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

--8sxJaLVqap9C0Cus
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFB1ZKkHb1edYOZ4bsRAsZ1AJ0eBTd9T8NN/BiE0MPgJpA586hjMACfSiFJ
jASTPrn7IGXf/e5Pnimg2vA=
=/we2
-----END PGP SIGNATURE-----

--8sxJaLVqap9C0Cus--
