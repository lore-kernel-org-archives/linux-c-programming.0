From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Multithreaded /sbin.init? Is it possible?
Date: Sun, 14 Sep 2003 21:45:43 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030914194543.GB12661@lug-owl.de>
References: <200309141240.55800.eric@cisu.net> <20030914182509.GZ12661@lug-owl.de> <200309141359.50596.eric@cisu.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UEYxRAcbr7cS1UOX"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200309141359.50596.eric@cisu.net>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--UEYxRAcbr7cS1UOX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 2003-09-14 13:59:50 -0500, Eric <eric@cisu.net>
wrote in message <200309141359.50596.eric@cisu.net>:
> > However, I've done a little test with my laptop (P2-266, 128MB RAM).
> > Groupwise parallelized, taking rc2 (not rcS) takes 5sec, vs. 20sec for
> > the non-parallelized traversal. But screen output now is even less
> > readable than before (Ever seen HP-UX starting?)...
>=20
> 	I just had tought after sending my previous e-mail. Would it be possible=
 to=20
> capture the output of the programs being run? Like each thread would capt=
ure=20
> the output of the program it runs without being printed to the screen and=
=20
> then when the thread terminates the main program writes it to the screen.=
=20
> That would make the entire message of the program being run atomic and th=
us=20
> eliminate odd echo's out of place and done messages conflicting with othe=
rs.=20
> Although the messages from each group might be printed in an undefined or=
der,=20
> you would still get the complete message.

That's not much of a problem. You can even get the messages in proper
order...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--UEYxRAcbr7cS1UOX
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/ZMVnHb1edYOZ4bsRAlzaAJ4heTt2cNttS2mBArw9OSQIERpDGwCeILON
+qmN5XAVPGMSDyfexT1nUkI=
=QUKX
-----END PGP SIGNATURE-----

--UEYxRAcbr7cS1UOX--
