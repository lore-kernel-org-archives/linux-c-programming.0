From: Steven Smith <sos22@cantab.net>
Subject: Re: Forcing a core dump
Date: Fri, 20 Aug 2004 18:33:43 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040820173343.GB779@archibold.chu.cam.ac.uk>
References: <200408191209.37695.opacki@acn.waw.pl> <412622F5.2080208@fi.uba.ar>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <412622F5.2080208@fi.uba.ar>
List-Id: <linux-c-programming.vger.kernel.org>
To: Dar?o Mariani <dmarian@fi.uba.ar>
Cc: linux-c-programming@vger.kernel.org, sos22@srcf.ucam.org


--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>   Is it possible to force a running program to generate a core dump. My=
=20
> problem is that I have a program that, from time to time, it freezes and=
=20
> I want to know what's going on.
If it's still attached to its terminal, Control-\ usually works.
Failing that, try kill -QUIT <pid_of_your_program>.

Steven Smith,
sos22@cantab.net.
--=20
One day, I'm going to get an Alice-bot to answer all my email for me,
and see how long it takes people to notice.

--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (FreeBSD)

iD8DBQFBJjX3O4S8/gLNrjcRAhfGAKCZsFZVFS7HcPBbZhVs9o0Btp1jdgCfSKtg
PulmMvL3oFqOMQkdnPbR2N4=
=0gQI
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--
