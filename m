From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: exit(42)
Date: Fri, 24 Sep 2004 18:33:00 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040924163300.GO22710@lug-owl.de>
References: <20040924115759.6133.qmail@web52908.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NO7MNF5gSBbQ6QZj"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040924115759.6133.qmail@web52908.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux prg <linux-c-programming@vger.kernel.org>


--NO7MNF5gSBbQ6QZj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-09-24 12:57:59 +0100, Ankit Jain <ankitjain1580@yahoo.com>
wrote in message <20040924115759.6133.qmail@web52908.mail.yahoo.com>:
> well do any body know what does this mean?
>=20
> exit(42)

It just leaves 42 (Illuminati!) back to the caller.

> and also when we say exit(0) or exit(1) then there is
> anyway to catch these values

Normally, you use a return value of zero to signal "Success!" and
anything else for "Something undesired happened."

> also when we return from main fn then what is the
> benfit?

exit() just here ends the program, possibly internally calling some
cleanup functions and the like. Return does only end a program IFF it
returns from the main() function.

> does it have any utilisation?

It does! Remember, exit() is "stop it here", while return is only "stop
it here, if I'm in main()."  See the difference? If, at some later time,
the whole program gets integrated into the codebase of a larger scale
program, where the former main() call just does one part of the work,
exit() from the old main() wouldn't be a nice thing:-)

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

--NO7MNF5gSBbQ6QZj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBVEw8Hb1edYOZ4bsRAnhAAJ9bz6L0amzkbEl6hmgjY5uOTrL19QCfQyiY
U+kdb683505+gYd10QMIJTI=
=5KyU
-----END PGP SIGNATURE-----

--NO7MNF5gSBbQ6QZj--
