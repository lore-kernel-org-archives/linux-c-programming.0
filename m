From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: offtopic
Date: Wed, 25 Jun 2003 22:43:13 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030625204313.GM29233@lug-owl.de>
References: <Pine.LNX.4.44.0306251354300.16254-100000@ns.isi.ulatina.ac.cr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0+35XlDF45POFHfm"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0306251354300.16254-100000@ns.isi.ulatina.ac.cr>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--0+35XlDF45POFHfm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-06-25 13:56:17 -0600, Fabio Miranda Hamburger <fabmirha@ns.isi=
.ulatina.ac.cr>
wrote in message <Pine.LNX.4.44.0306251354300.16254-100000@ns.isi.ulatina.a=
c.cr>:
> Hi, I am curious if It's possible to code in C, a small user keylloger.
> For exmaple, a unprivileged user log on a machine and the "user kelogger"
> start and all key are logged including those typed on getpass() functions.
> (ej: passwd) and remote connections with telnet and ssh.

No need to do programming. Simlpy strace user's shell (and any spawned
processes) and look I/O to file descriptors 0 and 1.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--0+35XlDF45POFHfm
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE++glhHb1edYOZ4bsRAikIAJ4sp2dYPvkjCFJJirXwtpTt7HBMRgCeIcig
dBCW6TTwFlF9xGoVq+NQ3tM=
=DDT/
-----END PGP SIGNATURE-----

--0+35XlDF45POFHfm--
