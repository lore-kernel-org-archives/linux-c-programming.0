From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Filesystem as a module?
Date: Sun, 14 Mar 2004 00:52:42 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040313235242.GU17857@lug-owl.de>
References: <20040313194721.EB5123DC2@xprdmailfe6.nwk.excite.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1c4XeR3HBwmMPD2z"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040313194721.EB5123DC2@xprdmailfe6.nwk.excite.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--1c4XeR3HBwmMPD2z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 2004-03-13 14:47:21 -0500, Vineet Joglekar <vintya@excite.com>
wrote in message <20040313194721.EB5123DC2@xprdmailfe6.nwk.excite.com>:
> > Better create another directory below ./linux/fs/ and place your source=
s there.
>=20
> Thanks for the prompt reply. I'll try to do it. I have 1 more question re=
garding this approach. In which make files do I need to make changes / addi=
tions so that while building the kernel, my newly added directory will be c=
ompiled too?

Well, for 2.4.x, you'll need to touch ./linux/fs/Makefile,
=2E/linux/fs/Config.in and ./linux/Documentation/Configure.help. In 2.6.x,
you need to modify ./linux/fs/Makefile and ./linux/fs/Kconfig.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--1c4XeR3HBwmMPD2z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAU57KHb1edYOZ4bsRAl9/AJ9SWFEQg3sLEZrprP0nLc0N25SjuQCffscl
/de6lJxdkjDLwHPRbn/EI3U=
=BdkV
-----END PGP SIGNATURE-----

--1c4XeR3HBwmMPD2z--
