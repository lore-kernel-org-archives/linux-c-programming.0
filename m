From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Is there any function to delete lines from a text file
Date: Mon, 11 Oct 2004 07:31:34 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20041011053133.GJ5033@lug-owl.de>
References: <20041010160917.GA3279@jehuty.server01.org> <JLEEKLMLBNBBGELJFIHPGELICIAA.eparrilla@comcast.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/GGxXfKRHScBDXG5"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <JLEEKLMLBNBBGELJFIHPGELICIAA.eparrilla@comcast.net>
List-Id: <linux-c-programming.vger.kernel.org>
To: Edward Parrilla <eparrilla@comcast.net>
Cc: linux-c-programming@vger.kernel.org


--/GGxXfKRHScBDXG5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2004-10-10 17:55:00 -0500, Edward Parrilla <eparrilla@comcast.net>
wrote in message <JLEEKLMLBNBBGELJFIHPGELICIAA.eparrilla@comcast.net>:
> Hi there,
> I know that fputs(), or fgets() can store or get a line from a file, is
> there a way to delete a line from a text file?

No.

The only way to do that is to copy the whole file and omitting the line
you want to omit (using the "f" functions). Alternatively, you'd use the
"normal" functions and only copy the part after the line to be deleted
some bytes towards the front...

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

--/GGxXfKRHScBDXG5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBahq1Hb1edYOZ4bsRAizJAJ9hXHs+aKRjCekoQOCXc3dATH4/CACfZXYz
Msj+/ouEUw61ZxnwSdhNvKI=
=BWnY
-----END PGP SIGNATURE-----

--/GGxXfKRHScBDXG5--
