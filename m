From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: static or shared
Date: Tue, 7 Jan 2003 14:17:59 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030107131759.GH2529@lug-owl.de>
References: <Pine.LNX.4.33.0301071646230.5493-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G44BJl3Aq1QbV/QL"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0301071646230.5493-100000@soochak.ncst.ernet.in>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux c programming mailing list <linux-c-programming@vger.kernel.org>


--G44BJl3Aq1QbV/QL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-01-07 16:49:29 +0530, Mohammed Khalid Ansari <khalid@ncst.erne=
t.in>
wrote in message <Pine.LNX.4.33.0301071646230.5493-100000@soochak.ncst.erne=
t.in>:
>=20
> Hi,
>=20
> If /usr/lib contains both static and shared libraries of the same name=20
> eg odbc, which library compiler is going to take if I do..
>=20
> gcc file.c -lodbc
>=20
> How do I explicitly I define which library to take during compilation.

"-l" is commonly used for shared libraries. If you want to statically
link some library into your program, simply name it's file name as one
of the object file names which are to be linked. But beware! Libs need
to be on the end of your file list.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet!
   Shell Script APT-Proxy: http://lug-owl.de/~jbglaw/software/ap2/

--G44BJl3Aq1QbV/QL
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+GtOHHb1edYOZ4bsRAgiKAJ9JXyuEajiuPzVZPZkMCGP7kP0vLACgkHWp
J5nA7NiXo3mKorLDUpoqlMs=
=8NTQ
-----END PGP SIGNATURE-----

--G44BJl3Aq1QbV/QL--
