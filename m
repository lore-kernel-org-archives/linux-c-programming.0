From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: complex variable
Date: Tue, 7 Sep 2004 18:05:35 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040907160535.GT6985@lug-owl.de>
References: <E3E30069B061524E90BCEE4417E30661138525@monm207.monmouth.army.mil>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fbglzKaagM3twbm3"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E3E30069B061524E90BCEE4417E30661138525@monm207.monmouth.army.mil>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--fbglzKaagM3twbm3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-09-07 11:37:06 -0400, Huber, George K RDECOM CERDEC STCD SRI <=
George.K.Huber@us.army.mil>
wrote in message <E3E30069B061524E90BCEE4417E30661138525@monm207.monmouth.a=
rmy.mil>:
> In addition to the previously given suggestions, I would suggest checking
> the return=20
> value of fopen (it can fail), as well as printing out the error codes.  F=
or
> example,
> I would recode the above as (note - this is uncompiled/tested code but is
> should
> give an example of what I mean):

Error checking is always a good idea :-)

> #include<stdlib.h>
> #include<complex.h>
> #include<stdio.h>
> #include<errno.h>
>=20
> int main()
> {
>     FILE* fp=3DNULL;

No need to initialize *fp to NULL because you assign a value before it's
read for the first time. That'll only bloat the program :)

>     char  szName[] =3D "test_data.dat";
>=20
>     if(NULL !=3D (fp =3D fopen(szName, "rb")))
>     {
>         int N=3D32, i=3D0;
>         complex x, *in =3D NULL;
> 	  if(NULL !=3D (in=3Dmalloc(sizeof(complex)*N)))
Same here -- no need to initialize *in.

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

--fbglzKaagM3twbm3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBPdxPHb1edYOZ4bsRAtojAJ9IH7HYTo86rjS8z/ILPIkXkzeaxgCgguom
xa5u86SydYfWWl1+Q9zmYlc=
=FUA6
-----END PGP SIGNATURE-----

--fbglzKaagM3twbm3--
