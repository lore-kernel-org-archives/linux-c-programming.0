From: leslie.polzer@gmx.net
Subject: Handling ioctl() argp memory
Date: Sun, 4 Mar 2007 17:48:44 +0100
Message-ID: <20070304164844.GA7231@wintermute.farpoint>
Reply-To: leslie.polzer@gmx.net
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hello folks,

  I'm passing an array to a ioctl.
  ioctl(2) says it needs to point at memory, so I'm allocating it.
  Do I need to, or rather, am I allowed to free the memory afterwards?

  It seems I'm getting segfaults when I free the memory...

    Leslie

--=20
gpg --keyserver pgp.mit.edu --recv-keys DD4EBF83
http://nic-nac-project.de/~skypher/

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFF6vhsyYzv6N1Ov4MRAjV8AJ9VGZGoVFKoWBJUmUB+EcuIHkqkigCffXt1
R7OrWdZ1MGBTaQX/1lDneZg=
=puWO
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
