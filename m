From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Floating point exception
Date: Sat, 11 Sep 2004 16:58:15 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040911145815.GP19967@lug-owl.de>
References: <20040911113913.86435.qmail@web52904.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0UhZIN3Sa23/ILEd"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040911113913.86435.qmail@web52904.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux prg <linux-c-programming@vger.kernel.org>


--0UhZIN3Sa23/ILEd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 2004-09-11 12:39:13 +0100, Ankit Jain <ankitjain1580@yahoo.com>
wrote in message <20040911113913.86435.qmail@web52904.mail.yahoo.com>:
> #include<stdlib.h>
> #include<string.h>
> #include<complex.h>
> #include<errno.h>
> #include<time.h>
> #include<stdio.h>
> #define NX 4 	 	=20
> #define NY 4
> #define N 2*NX*NY		//N is the size of 2 D DFT

Braces missing

> #include <math.h>

You'd first finish all includes, then add your own defines.

> #define num 2
> #define SWAP(a,b) tempr=3D(a);(a)=3D(b);(b)=3Dtempr

This may cause subtle errors. Consider

	if (something)
		SWAP (x, y);

Only the part "tempr=3D(a);" would be executed conditionally, what is not
exactly what you intended. I suggest using:

#define SWAP(a,b)		\
	do {			\
		tempr =3D (a);	\
		(a) =3D (b);	\
		(b) =3D tempr;	\
	} while (0)

> void fft(float data[], unsigned long nn[], int ndim,
> int isign)
> {
> int idim;
> unsigned long
> i1,i2,i3,i2rev,i3rev,ip1,ip2,ip3,ifp1,ifp2;
> unsigned long ibit,k1,k2,n,nprev,nrem,ntot;
> float tempi,tempr;
> double theta,wi,wpi,wpr,wr,wtemp; //Double precision
> for trigonometric recur-rences.
> for (ntot=3D1,idim=3D1;idim<=3Dndim;idim++)    //Compute
> total number of complex val-ues.
> 	ntot *=3D nn[idim];
> nprev=3D1;
>=20
> for (idim=3Dndim;idim>=3D1;idim--)=20
> {					// Main loop over the dimensions.
> 	n=3Dnn[idim];
> 	nrem=3Dntot/(n*nprev);

In your example code, n may become zero, so you devide by zero, which
isn't legal.

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

--0UhZIN3Sa23/ILEd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBQxKHHb1edYOZ4bsRAknCAJ9eHJ64vTY1RLZKzTQtvQQJaIp5hACcCQT/
Etv8pPya9lUQXuoQpcrvMB4=
=hbPF
-----END PGP SIGNATURE-----

--0UhZIN3Sa23/ILEd--
