From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Curses and key-up information
Date: Fri, 17 Jan 2003 12:21:40 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030117112140.GB9407@lug-owl.de>
References: <4DB84F6A7711D511A5020002A550C8B778718F@BELL> <001d01c2bdbd$d746b880$28d831c8@oemcomputer>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <001d01c2bdbd$d746b880$28d831c8@oemcomputer>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--jho1yZJdad60DJr+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-01-16 21:17:36 -0300, +RudyMartin <rmb@coopenet.com.ar>
wrote in message <001d01c2bdbd$d746b880$28d831c8@oemcomputer>:
>=20
> perhaps its my lack of experience in linux programming but I tried the
> referred source code and it didnt worked

Then you probably did something wrong:-)

> also, the ioctrl documentation says the keyboard access is done trhough t=
he
> tty driver but i wanted a direct keyboard access, like VMware under X

Well, if you do direct I/O the the keyboard controller, you face a
number of problems:

	1. Your code is not portable, in no way. Not even between
	different architectures running Linux
	2. You face races between your code and the in-kernel code which
	will cause spurious errors

> since im doing a Brief emulation I was forced to remap some default keys.=
 :(
> (btw the text editor is currently at 5% of completion but its working pre=
tty
> good, if anyone wants a copy of the sources just let me know)

That's not good at all:-(

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet!
   Shell Script APT-Proxy: http://lug-owl.de/~jbglaw/software/ap2/

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+J+dEHb1edYOZ4bsRAj6IAJ4lqLbNn0j0dqeMmbW5nrh/m4fdZwCeOljV
pwZpgxvTi2kY8sblealpocs=
=Nc48
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--
