From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: what causes SIGTERMs?
Date: Tue, 22 Jul 2003 17:11:21 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030722151118.GT7452@lug-owl.de>
References: <00be01c34553$57ea97a0$caba0ba4@uwe.ac.uk> <16138.54505.701672.164306@cerise.nosuchdomain.co.uk> <012101c3462f$ec43a810$caba0ba4@uwe.ac.uk> <008101c35061$18aebb20$caba0ba4@uwe.ac.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QCC2I/2CckNfI+Tr"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <008101c35061$18aebb20$caba0ba4@uwe.ac.uk>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--QCC2I/2CckNfI+Tr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-07-22 15:54:04 +0100, Matthew Studley <matthew.studley@uwe.ac.=
uk>
wrote in message <008101c35061$18aebb20$caba0ba4@uwe.ac.uk>:
> A brief follow-up
>=20
> > > > * Am I correct that this is unlikely to be issued in response to a =
bug
> > in my
> > > > code?
>=20
> As it turns out, this was issued in response to a runaway memory leak in =
my
> code.  Still not sure where the signal came from.

So, most probably you got SIGTERMinated by the kernel at some
out-of-memory situation after you grew too large...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--QCC2I/2CckNfI+Tr
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/HVQVHb1edYOZ4bsRAvndAJ9AXiVDszoIjg5KmET1zapw6DX1ZQCfYWBK
+Gq9hmXbK+aUoNfivUG8dzw=
=9EA0
-----END PGP SIGNATURE-----

--QCC2I/2CckNfI+Tr--
