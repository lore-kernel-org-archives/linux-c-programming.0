From: Benjamin Machuletz <bmachuletz@mnetworx.de>
Subject: Re: HOME directory
Date: Mon, 25 Apr 2005 18:43:15 +0200
Message-ID: <200504251843.19843.bmachuletz@mnetworx.de>
References: <200504251826.36321.hitoc_mail@yahoo.it>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1386421.6beQcUVYeC";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200504251826.36321.hitoc_mail@yahoo.it>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

--nextPart1386421.6beQcUVYeC
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

hi,

if you rename your home-directory, you have to change your /etc/passwd to=20
point your user entry to the new home-directory.

benjamin,


On Monday 25 April 2005 18:27, HIToC wrote:
> Hello all!
>  I am writing a piece of code that makes files, open directories in my
> HOME directory. All worked well until I changed the name of my HOME dir.
> To make the code portable I tried with use of '~' character:
>
>  const char* filename =3D "~/file.txt";
>  ofstream  my_file(filename, ios::out);
>
> but this solution does not work.
> Have you any suggestion to find the path of the current home directory or
> the current user name?
>
> Thanks for any suggestion.

--nextPart1386421.6beQcUVYeC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBCbR4nxOTOZUwH/CsRAlpBAJ9f3UveosDCxqJyT7y3s7m4Ji6eJQCfQDh4
sOnfk8rnMz13oM/LV9i0Z4o=
=O3AP
-----END PGP SIGNATURE-----

--nextPart1386421.6beQcUVYeC--
