From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: intercepting alt key and arrows
Date: Mon, 6 Sep 2004 18:11:50 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040906161150.GB6985@lug-owl.de>
References: <003101c49428$31be1500$0200a8c0@haneyhbmu5pv2g>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UXdImcDs+Jp8Skh3"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <003101c49428$31be1500$0200a8c0@haneyhbmu5pv2g>
List-Id: <linux-c-programming.vger.kernel.org>
To: Ameer Armaly <ameer@charter.net>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>


--UXdImcDs+Jp8Skh3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-09-06 11:43:02 -0400, Ameer Armaly <ameer@charter.net>
wrote in message <003101c49428$31be1500$0200a8c0@haneyhbmu5pv2g>:
> Hi all.
> What is the best way to intercept the alt key as well as the arrow keys? =
as
> far as I know they don't have ascii values.

Enable raw mode and interpret the input stream on your own.

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

--UXdImcDs+Jp8Skh3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBPIxGHb1edYOZ4bsRAuI4AJ42EfmPa29RZWaaN+BP9JAhd7QJMACeL9Nh
FKw4cABvEwSVFEOoKYi3cwQ=
=G9Ol
-----END PGP SIGNATURE-----

--UXdImcDs+Jp8Skh3--
