From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: System hang at high bandwidth
Date: Sat, 27 Mar 2004 19:11:37 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040327181137.GB27362@lug-owl.de>
References: <1080048682.7452.69.camel@one.test.com> <Pine.LNX.4.44.0403260056310.4797-100000@csews72.cse.iitk.ac.in>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0403260056310.4797-100000@csews72.cse.iitk.ac.in>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-03-26 01:05:28 +0530, K.Anantha Kiran <ananth@cse.iitk.ac.in>
wrote in message <Pine.LNX.4.44.0403260056310.4797-100000@csews72.cse.iitk.=
ac.in>:
> based on some hash function. When I try this experiment at high speeds=20
> (>250 Mbps) using either raw sockets (application level programming) or b=
y=20
> writing a kernel module for IP_PREROUTING_HOOK, my system is hanging. Can=
 any one please help me out=20
> by telling some possible reason for this and how to get rid of this.

The possible reason is: "There's a bug somewhere". However, nobody can
help because you messed to pass along some URL where we can download
your userspace application and/or your kernel module's sources.

>    Is it OK to use 4 NICs simultaneously at such high speeds.

Yes.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAZcPZHb1edYOZ4bsRAt8AAJ48qibcI2VS5HvYVp1YdpsWkpZGkgCgkY98
XgFP+OyAf0OUTM+KUYv4sZM=
=KNkM
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--
