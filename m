From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: complex variable
Date: Mon, 13 Sep 2004 23:57:42 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040913215742.GZ19967@lug-owl.de>
References: <E3E30069B061524E90BCEE4417E30661138525@monm207.monmouth.army.mil> <chml6d$kri$1@sea.gmane.org> <20040908120658.GZ6985@lug-owl.de> <chnv2v$j6n$1@sea.gmane.org> <20040910200519.GJ19967@lug-owl.de> <ci4sid$kgu$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZNveOOYjKturpEFp"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ci4sid$kgu$1@sea.gmane.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--ZNveOOYjKturpEFp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-09-13 21:32:06 +0200, Charlie Gordon <gmane@chqrlie.org>
wrote in message <ci4sid$kgu$1@sea.gmane.org>:
> "Jan-Benedict Glaw" <jbglaw@lug-owl.de> wrote in message
> news:20040910200519.GJ19967@lug-owl.de...
[...]
> > So you basically use creal() and cimag() to access the two numbers.
>=20
> Well it is still too vague :
> - what is the floating type of complex variable co ?

Not specified, I guess GCC "assumes" something there. But that doesn't
seem (from my reading) to match with C99 rules.

> - You did not specify float, double or long double, so what is the defaul=
t ?

Hmmm. You're probably right. I've digget into C99, but to be honest, my
reading is that a simple "complex" (without a real floating type) is
just illegal...

> - Reading tens of pages from C99 leaves that question open (!)

Right. At least from my point of view :-)

> - The creal and cimag macros apply to all 3 complex types.

Well, there has been some type-conversion in between :-)
-----------
7.3.9.2 The cimag functions
Sysnopsis
	#include <complex.h>
	double cimag(double complex z);
	float cimagf(float complex z);
	long double cimagl(long double complex z);
-----------

> PS: I have always hated floating point stuff ;-)

/me too, but sometimes, it helps to achieve more correct numbers :-)

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

--ZNveOOYjKturpEFp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBRhfWHb1edYOZ4bsRAsSUAJsG9PAjkXLeA5fjIp95DfI536d8SwCfV8Js
eQuC3hGpQL2ME/cdzDqTlXo=
=yE6z
-----END PGP SIGNATURE-----

--ZNveOOYjKturpEFp--
