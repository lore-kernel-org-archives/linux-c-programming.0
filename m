From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Question about X
Date: Wed, 24 Nov 2004 13:12:39 +0100
Message-ID: <20041124121239.GR2067@lug-owl.de>
References: <20041124143656.264fc1ca.akaanoken@softminecorp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CPn8Wy5ME997YUMW"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20041124143656.264fc1ca.akaanoken@softminecorp.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--CPn8Wy5ME997YUMW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-11-24 14:36:56 +0300, Alphex Kaanoken <akaanoken@softminecorp.=
com>
wrote in message <20041124143656.264fc1ca.akaanoken@softminecorp.com>:
> Hi all,
> I'm want to get the last inputed string in focused window - and
> modify it if it's contain  errors.
> I'm try to do it with sending key events to focused window (like
> Shift+left|right arrows), and  see it and modify with this method
> too, but it doesn't work ;-( or work very buggy =3D(

Source code for that?

> How I can do it with other method?

Well, I'd modify the application to check the values upon pressing the
"OK" button. If the input format doesn't match your expectation, just
mark all the field's contents and position the cursor somewhere in this
input field.

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

--CPn8Wy5ME997YUMW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBpHq3Hb1edYOZ4bsRAlgCAJ9i1B1KIKW0BgLnX4VSCN5wL2mqCACeLt8q
+TIMCuzp1aQw4rfvpDsiUf0=
=Yhnu
-----END PGP SIGNATURE-----

--CPn8Wy5ME997YUMW--
