From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: About combined console/X11 programs (was: question about gcc and keyboard hadling)
Date: Tue, 6 Aug 2002 20:08:52 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020806180852.GX758@lug-owl.de>
References: <02080504255200.24029@linux> <15694.36614.996185.222692@cerise.nosuchdomain.co.uk> <20020806061907.GP758@lug-owl.de> <15695.63457.98209.624871@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uN3tURjgVTLfI0kr"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <15695.63457.98209.624871@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--uN3tURjgVTLfI0kr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2002-08-06 17:22:57 +0100, Glynn Clements <glynn.clements@virgin.ne=
t>
wrote in message <15695.63457.98209.624871@cerise.nosuchdomain.co.uk>:
>=20
> Jan-Benedict Glaw wrote:
>=20
> > Even better question: I'd like to work on a text-based application and
> > I'd like to act on simply pressing eg. Ctrl (change some context menu).
> > I can do this with the hack I just posted nicely, but it will fail when
> > running under X11. Is there any possibility in getting a callback
> > registered called everytime an event occures which affects my terminal
> > emulation's window?
>=20
> No, there isn't.
>=20
> An application which uses terminal I/O is inherently limited by the
> set of actions for which the terminal actually generates input.

Think different. Think of linking mentioned application against
xlibs/gtk+/whatever. Then, if(getenv("DISPLAY")) you could init the X11
client side. This way, you can work on console (using so far Linux'isms)
_and_ you can work under X11 within _one_ binary. What now is the point
is to fetch all the events which are ment to out xterm's window.

So, if you're running on console (!getenv("DISPLAY")), you initialize
your input routine using ioctl(), but if running under X11, you
initialize needed xlibs. The remaining problems then is to fetch the
right events. I currently see no easy way in doing this, but there of
course must be some:-}

MfG, JBG

--=20
Jan-Benedict Glaw   .   jbglaw@lug-owl.de   .   +49-172-7608481
	 -- New APT-Proxy written in shell script --
	   http://lug-owl.de/~jbglaw/software/ap2/

--uN3tURjgVTLfI0kr
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9UBC0Hb1edYOZ4bsRAkZ9AJ0X7OX6K3r6G/8FN4mkGigMSeem7gCeMaJE
+Mnhvur4sT9QGgB1ltGfym4=
=Bizg
-----END PGP SIGNATURE-----

--uN3tURjgVTLfI0kr--
