From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: 64 bits integer
Date: Wed, 10 Nov 2004 15:46:50 +0100
Message-ID: <20041110144649.GH10443@lug-owl.de>
References: <41916F51.2060102@ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Hix8K3b8kRbLLbv+"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <41916F51.2060102@ig.com.br>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming <linux-c-programming@vger.kernel.org>


--Hix8K3b8kRbLLbv+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-11-09 22:30:57 -0300, Luciano Moreira - igLnx <lucianolnx@ig.c=
om.br>
wrote in message <41916F51.2060102@ig.com.br>:
> How can we do to manipulate integer higher than 32 bits in linux ?
>=20
> Does exist some system call (or another library), that allow us to do=20
> something like as following ?
>=20
> int64 x;
> x =3D atoi64("12345678901234567890");
>=20
> char x[21];
> i64toa(x, sizeof(x));

As pointed out, gcc uses a 64 bit wide integer as long long. If you
really require exactly a 64 bit integer, you'd declare it as uint64_t
(which is from stdint.h). Also, printf() etc will handle it just fine.

If you, however, require integers of at least 64 bit of size (with an
open end), you need to use any of the libraries that offers an
implementation of that. This is beyond the scope of C.  I've just
recently used libgcryp11 for something like that (actually, the large
integers are afterwards used to verify a POS printer's fiscal journal),
but there are other libs for it, too.

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

--Hix8K3b8kRbLLbv+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBkinZHb1edYOZ4bsRApwUAJ9MxV+aX8w+6/j+5ZR6KSebfkJPDACfb80Q
dNUvq0sSTVhP4k1Aa5ERAZc=
=iUtY
-----END PGP SIGNATURE-----

--Hix8K3b8kRbLLbv+--
