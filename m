From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: How to RESET the client connection socket?
Date: Wed, 21 Apr 2004 15:32:08 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040421133208.GF12700@lug-owl.de>
References: <20040421131653.73513.qmail@web21208.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yzCAVeWw9RvyYzgB"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040421131653.73513.qmail@web21208.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--yzCAVeWw9RvyYzgB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-04-21 06:16:53 -0700, Srinivas Chinta <chintasrinivas_tech@yah=
oo.com>
wrote in message <20040421131653.73513.qmail@web21208.mail.yahoo.com>:

> I have a server, and some clients connected to it. How
> do i RESET a client connection socket ? Are there any

IIRC you can do that with shutdown(2).

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--yzCAVeWw9RvyYzgB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAhnfYHb1edYOZ4bsRAq69AJ9HoOPco/OLoRTh08tJpV3iQzRqrgCeNxYv
aNBeFa0TQIeKz6G60vGamMA=
=6Cv2
-----END PGP SIGNATURE-----

--yzCAVeWw9RvyYzgB--
