From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: mktemp()
Date: Sat, 5 Jun 2004 15:18:53 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040605131853.GA20632@lug-owl.de>
References: <20040605093054.A613@Imrashi.net.bd> <16577.21054.198004.325948@cerise.nosuchdomain.co.uk> <20040605141705.A681@Imrashi.net.bd> <20040605111647.GW20632@lug-owl.de> <20040605184000.A300@Imrashi.net.bd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="D/vLTo7a3QhZ1xwt"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040605184000.A300@Imrashi.net.bd>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org
Cc: Progga <abulfazl@juniv.edu>


--D/vLTo7a3QhZ1xwt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 2004-06-05 18:40:01 +0600, Progga <abulfazl@juniv.edu>
wrote in message <20040605184000.A300@Imrashi.net.bd>:
> On Sat, Jun 05, 2004 at 01:16:48PM +0200, Jan-Benedict Glaw wrote:
> > char my_temp_template[] =3D "abcXXXXXX";
> > char *my_temp_file;
> >=20
> > my_temp_file =3D mktemp (my_temp_template);
> > if (!my_temp_file)
> > 	errex ("Couldn't create temp file\n");
>=20
>  mktemp() does not create the tmp file; it just returns the name string p=
ointer.

That's why my_temp_file is "char *" and neither "FILE *" or "int".

> mkstemp() creates file though.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--D/vLTo7a3QhZ1xwt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAwcg9Hb1edYOZ4bsRAvY1AJ0Su+qX5UAao6ndMfICf81hSpIcsgCcCA+r
QX4bN/1p4hss6Itb6fkTtDE=
=uX0K
-----END PGP SIGNATURE-----

--D/vLTo7a3QhZ1xwt--
