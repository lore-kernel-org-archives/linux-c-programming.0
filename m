From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: function pointers in C++
Date: Mon, 15 Mar 2004 11:27:51 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040315102750.GY17857@lug-owl.de>
References: <1079342899.405577335bb24@webmail.uoa.gr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VGJtZYeI3LbW67dD"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1079342899.405577335bb24@webmail.uoa.gr>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--VGJtZYeI3LbW67dD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-03-15 11:28:19 +0200, elathan@phys.uoa.gr <elathan@phys.uoa.gr>
wrote in message <1079342899.405577335bb24@webmail.uoa.gr>:
> Hello!=20
> =20
> Suppose I have:=20
> =20
> class Foo=20
> {=20
> public:=20
> 	Foo();=20
> 	~Foo();=20
> 	int bar(int);=20
> };=20
> =20
> Now, why I can't do this:=20
> =20
> Foo *f =3D new Foo();=20
> taz(f->bar);=20
> =20
> Where taz()'s protype is:=20
> =20
> void taz(int (*f)(int));=20

You're looking for "static"ally declared member functions.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--VGJtZYeI3LbW67dD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAVYUmHb1edYOZ4bsRAtVrAKCOYrBJp/O+C8ewatTQbQoXRFlnAACaAz/H
C8//PsR32iWhf7eZH+32vdU=
=/NW6
-----END PGP SIGNATURE-----

--VGJtZYeI3LbW67dD--
