From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: stdio
Date: Wed, 18 Jun 2003 14:02:17 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030618120217.GM6353@lug-owl.de>
References: <011801c33580$48425aa0$e764a8c0@fesnel.noip.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y4VYWfdFdHwFhC6D"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <011801c33580$48425aa0$e764a8c0@fesnel.noip.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming <linux-c-programming@vger.kernel.org>


--Y4VYWfdFdHwFhC6D
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-06-18 05:58:42 -0400, John T. Williams <jtwilliams@vt.edu>
wrote in message <011801c33580$48425aa0$e764a8c0@fesnel.noip.org>:
> I am trying to figure out how to cause a character to be printed to a
> specific place on the terminal
>=20
> what I'm actually trying to accomplish is to make a progress bar
>=20
> example:
>=20
> Progress [*****                           ]  25%
>=20
> and I want it to fill up the box with stars as my program progresses, but=
 I
> can't figure out how to just get c to write a single '*'  to anywhere oth=
er
> then the end of the streak
> I tried lseek and got no good results.

Well, what you want to do sounds quite simple, but it's really quite
complicated. The basic problem is that there are thousands of different
terminal types out there which need different control sequences to
position the cursor (if possible at all). You would need to know all of
them to be portable.

Because that would be a real PITA, this functionality has been placed
into some libraries. Look for libncurses (of libtermcap) to do this
task...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--Y4VYWfdFdHwFhC6D
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE+8FTJHb1edYOZ4bsRAjj0AJwLa7rcJ0fGbh8GwZs2eaNkNw3/9gCfXx/p
X1NdR4AfU01wUH/FEh322hg=
=t7ko
-----END PGP SIGNATURE-----

--Y4VYWfdFdHwFhC6D--
