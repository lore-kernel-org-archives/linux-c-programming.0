From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: complex variable
Date: Fri, 10 Sep 2004 22:05:19 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040910200519.GJ19967@lug-owl.de>
References: <E3E30069B061524E90BCEE4417E30661138525@monm207.monmouth.army.mil> <chml6d$kri$1@sea.gmane.org> <20040908120658.GZ6985@lug-owl.de> <chnv2v$j6n$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LQAwcd5tHl0Qlnzi"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <chnv2v$j6n$1@sea.gmane.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--LQAwcd5tHl0Qlnzi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-09-08 23:54:45 +0200, Charlie Gordon <gmane@chqrlie.org>
wrote in message <chnv2v$j6n$1@sea.gmane.org>:
> "Jan-Benedict Glaw" <jbglaw@lug-owl.de> wrote in message
> news:20040908120658.GZ6985@lug-owl.de...
>=20
> > > >                 for(i=3D0; i< N; i++)
> > > >                     printf("%lf\t", in[i]);

> it's ugly because the whole complex number in whatever storage format it's
> in gets passed to printf.

Right.

> In my understanding, this may fail because there is no guaranty about whi=
ch
> part of the structure will be printed and the format specifier may be
> incorrect for the actual type thus passed.

Right, too. Here's how it ought to work:

-----------------------------------------------------------
#include <complex.h>
#include <stdio.h>
#include <stdlib.h>

int
main (int argc, char *argv[])
{
	complex co;

	co =3D 1.3 + I * 2.9;
	printf ("%lf %lf\n", creal (co), cimag (co));

	return EXIT_SUCCESS;
}
-----------------------------------------------------------

So you basically use creal() and cimag() to access the two numbers.

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

--LQAwcd5tHl0Qlnzi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBQgj/Hb1edYOZ4bsRAkasAKCQiBLOExAUjHWC/vC6q2FhD5/G+gCfQpgN
RFa2mzzQMit+npTBZHAuU70=
=wNqr
-----END PGP SIGNATURE-----

--LQAwcd5tHl0Qlnzi--
