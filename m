From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: question about gcc and keyboard hadling
Date: Tue, 6 Aug 2002 08:19:07 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020806061907.GP758@lug-owl.de>
References: <02080504255200.24029@linux> <15694.36614.996185.222692@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="N5iGxCIPT7YMRg16"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <15694.36614.996185.222692@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--N5iGxCIPT7YMRg16
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2002-08-05 15:43:18 +0100, Glynn Clements <glynn.clements@virgin.ne=
t>
wrote in message <15694.36614.996185.222692@cerise.nosuchdomain.co.uk>:
> +Rudymartin wrote:
> > im trying to develop a text editor using gcc version 2.96 20000731 (Red=
 Hat=20
> > Linux 7.1 2.96-81) , and thats because I want to make some experience w=
ith=20
> > C++ (I used to program in Java and C under windowz) The Info pages have=
=20
> > information about most libraries and functions but I have found no way =
to=20
> > trap the modifiers keys (ALT/CTRL/SHIFT) under a terminal. And I notice=
d=20
> > emacs can trap those keys under a terminal.
>=20
> You can't get the same kind of modifier behaviour on a terminal that
> you can in a windowed environment.

Even better question: I'd like to work on a text-based application and
I'd like to act on simply pressing eg. Ctrl (change some context menu).
I can do this with the hack I just posted nicely, but it will fail when
running under X11. Is there any possibility in getting a callback
registered called everytime an event occures which affects my terminal
emulation's window? There, I could fetch the modifiers...

MfG, JBG

--=20
Jan-Benedict Glaw   .   jbglaw@lug-owl.de   .   +49-172-7608481
	 -- New APT-Proxy written in shell script --
	   http://lug-owl.de/~jbglaw/software/ap2/

--N5iGxCIPT7YMRg16
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9T2pbHb1edYOZ4bsRAisnAJ9b6xAUZXiq8BL9UszNU6C/HGefHwCferuv
NP9EfPjhh0CPMYjYQ18rRUE=
=/dPi
-----END PGP SIGNATURE-----

--N5iGxCIPT7YMRg16--
