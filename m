From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: mktemp()
Date: Sat, 5 Jun 2004 13:16:48 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040605111647.GW20632@lug-owl.de>
References: <20040605093054.A613@Imrashi.net.bd> <16577.21054.198004.325948@cerise.nosuchdomain.co.uk> <20040605141705.A681@Imrashi.net.bd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u38uBrv5Nk1Kq3n1"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040605141705.A681@Imrashi.net.bd>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org
Cc: Progga <abulfazl@juniv.edu>


--u38uBrv5Nk1Kq3n1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 2004-06-05 14:17:05 +0600, Progga <abulfazl@juniv.edu>
wrote in message <20040605141705.A681@Imrashi.net.bd>:
> On Sat, Jun 05, 2004 at 05:55:26AM +0100, Glynn Clements wrote:

>  Does the above mean that mktemp( "abcXXXXXX" ) can return "abc123456" ev=
en if
> there's a symlink with the name "abc123456" ?

No. This one has good chances to SIGSEGV before it returns at all:)

---------------------------------
char *my_temp_template =3D "abcXXXXXX";
char *my_temp_file;

my_temp_file =3D mktemp (my_temp_template);
if (!my_temp_file)
	errex ("Couldn't create temp file\n");
---------------------------------
The above one may SEGV as well, because the template may be stored in
memory marked as read-only.

This one will work:
---------------------------------
char my_temp_template[] =3D "abcXXXXXX";
char *my_temp_file;

my_temp_file =3D mktemp (my_temp_template);
if (!my_temp_file)
	errex ("Couldn't create temp file\n");
---------------------------------

Also, I remember there was at least one compiler (some older MAC OS?)
which didn't add the final \0 on it's own to xxx[]...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--u38uBrv5Nk1Kq3n1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAwaufHb1edYOZ4bsRAhleAJ9yyeA9LD62aQrTQiy9RRz1nIH1uQCff3B0
kiNneXtbws8tIx7/aNjEFa8=
=ILh5
-----END PGP SIGNATURE-----

--u38uBrv5Nk1Kq3n1--
