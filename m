From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: strtok_r crashing
Date: Thu, 14 Nov 2002 13:50:13 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20021114125013.GN1525@lug-owl.de>
References: <OF8E547BE6.AC22B859-ON65256C71.0045BBB6@pune.tcs.co.in>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fz0LNKsoEivY4NpG"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <OF8E547BE6.AC22B859-ON65256C71.0045BBB6@pune.tcs.co.in>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--fz0LNKsoEivY4NpG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2002-11-14 18:16:04 +0530, Hemant Mohan <hemantm@pune.tcs.co.in>
wrote in message <OF8E547BE6.AC22B859-ON65256C71.0045BBB6@pune.tcs.co.in>:
> Hi,
>=20
> I am trying to parse a string using strtok_r (I need reentrant code) as
> follows:
>=20
> #include <string.h>
> #include <stdio.h>
> #include <stdlib.h>
>=20
> int main()
> {
>   char *str =3D NULL;
>   char *temp =3D NULL;
>   char **ptr =3D NULL;   // Note that this is a char**

Note that there's no memory allocated for *ptr.

> This code receives a SIGSEGV in strtok_r.

Surely. Accessing random memory.


--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet!
   Shell Script APT-Proxy: http://lug-owl.de/~jbglaw/software/ap2/

--fz0LNKsoEivY4NpG
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)

iD8DBQE905wFHb1edYOZ4bsRAp2cAJ4oh9rsavA20z3j165BPr6dApieWgCZAYAz
TT0y2/TATyHFqDbEo9vqe8s=
=e7JT
-----END PGP SIGNATURE-----

--fz0LNKsoEivY4NpG--
