From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Windows can use cpp in c code but in linux ?? I dont know how .
Date: Fri, 1 Oct 2004 00:24:50 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040930222450.GJ847@lug-owl.de>
References: <E3E30069B061524E90BCEE4417E3066113853D@monm207.monmouth.army.mil>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HlXFiQcSFG/a+HqU"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E3E30069B061524E90BCEE4417E3066113853D@monm207.monmouth.army.mil>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--HlXFiQcSFG/a+HqU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-09-30 13:12:16 -0400, Huber, George K RDECOM CERDEC STCD SRI <=
George.K.Huber@us.army.mil>
wrote in message <E3E30069B061524E90BCEE4417E3066113853D@monm207.monmouth.a=
rmy.mil>:
> Suciu wrote:
> >To solve this is easy, link with the c++ library: -lstdc++
>=20
> >gcc a.c mylib.a -lstdc++
>=20
> Or you could use g++ (the GNU C++ compiler)  It should handle
> C files as well.

However, there are good reasons to use a C compiler for C code. Eg. try
using C99 style structure initializers with a g++ :-)

MfG, JBG

--=20
Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481             =
_ O _
"Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg  =
_ _ O
 fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Irak! =
  O O O
ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA)=
);

--HlXFiQcSFG/a+HqU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBXIeyHb1edYOZ4bsRApNPAJ0ZdbrTZXlMzfDNa5mtx0selVe+XQCeJgIp
FKPmizCiwHvkpB+8V34DPb0=
=DZPX
-----END PGP SIGNATURE-----

--HlXFiQcSFG/a+HqU--
