From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Curses and key-up information
Date: Tue, 7 Jan 2003 08:08:10 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030107070810.GD2529@lug-owl.de>
References: <4DB84F6A7711D511A5020002A550C8B778710B@BELL> <15897.43047.454804.466506@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SO98HVl1bnMOfKZd"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <15897.43047.454804.466506@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--SO98HVl1bnMOfKZd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-01-06 16:00:39 +0000, Glynn Clements <glynn.clements@virgin.ne=
t>
wrote in message <15897.43047.454804.466506@cerise.nosuchdomain.co.uk>:
> > I'm writing to write a little curses maze game that involves a lot of k=
ey
> > handling, and the most obvious way to handle the control is with a
> > IsKeyDown(char key) type-function. Alas, curses doesn't appear to have =
one
> > and was wondering is anyone else has found a way around this problem (e=
ither
> > within curses, or using ioctl/poll or similar).
>=20
> It can't be done. The process only receives notification of key
> presses; there is no way to discover when a key is released.

Well, in some special cases, you _can_ get key-up information as well as
key-down notofications. However, this is hackish...

> Bear in mind that Unix terminal I/O was designed for terminals (vt100
> etc) rather than a keyboard which is attached directly. Terminals
> (whether hardware terminals such as the vt100, emulators such as
> xterm, the linux console, telnet etc) simply don't send anything when
> a key is released, so there's no way to detect it.

Some time ago, we had almost the same topic. IIRC I've had posted some
code snipplets at that time.

Basically, as long as you use your console as a real terminal (probably
using some helper library as (n)curses/termcap etc), you don't get
key-{up|down} information, but only "key Y was hit". However, in special
cases (switching console into raw mode), you'll get all information (if
available...), as for example X11 indeed does use any information
available.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet!
   Shell Script APT-Proxy: http://lug-owl.de/~jbglaw/software/ap2/

--SO98HVl1bnMOfKZd
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+GnzaHb1edYOZ4bsRAu9ZAJwJv2wLeSj6mzW4Trngf6SGfArKkgCgkS48
J2Bd3/mZt67KqkaiPoPQU4E=
=r6JJ
-----END PGP SIGNATURE-----

--SO98HVl1bnMOfKZd--
