From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Reading BIOS
Date: Thu, 25 Nov 2004 11:52:14 +0100
Message-ID: <20041125105214.GF2067@lug-owl.de>
References: <1101371672.3795.36.camel@myLinux>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dgVgbXf0Vb2tUvlQ"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1101371672.3795.36.camel@myLinux>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Linux C Programming <linux-c-programming@vger.kernel.org>


--dgVgbXf0Vb2tUvlQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-11-25 14:04:32 +0530, Jagadeesh Bhaskar P <jbhaskar@hclinsys.c=
om>
wrote in message <1101371672.3795.36.camel@myLinux>:
> Hi,
> Is it possible to probe for, say, ide controllers from the BIOS, CMOS
> information with a C program? Is there any documentation available
> regarding the same??

Well, you don't really want to fiddle with physical addresses from
within userspace programs while running a protected-mode operating
system:-)

If you only want to know the type of IDE controller, and if your
hardware wasn't build during stone age, it's probably as simple as
reading the IDE controller's PCI device IDs. There's a libpci available
for Linux which helps you doing this (because there are different access
methods for accessing the PCI busses).

'lspci' for example uses it, probably parsing lspci's output is just
enough for your job...

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

--dgVgbXf0Vb2tUvlQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBpbleHb1edYOZ4bsRAuaKAJsF52xbkIYBQ2Axe2+np29QogdBfwCcDoL/
HjlJ5TcPgmSN2JE0BD8yWvQ=
=AlR+
-----END PGP SIGNATURE-----

--dgVgbXf0Vb2tUvlQ--
