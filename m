From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: what is libcurl
Date: Fri, 26 Nov 2004 21:30:40 +0100
Message-ID: <20041126203040.GZ2067@lug-owl.de>
References: <20041126090510.860.qmail@web53008.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="70fLfmUGd5x0AJTB"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20041126090510.860.qmail@web53008.mail.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Vger Kernel <linux-c-programming@vger.kernel.org>


--70fLfmUGd5x0AJTB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-11-26 01:05:10 -0800, rinku rathore <rinku_ques@yahoo.com>
wrote in message <20041126090510.860.qmail@web53008.mail.yahoo.com>:
>  Hello,
> > Can you give me some more information about this
> > libcurl
> I wanted to ftp through C program without user
> intervention,Is this libcurl help if yes in what way.

I am not sure if libcurl implements all features FTP offers (eg.
password-authenticated upload, FTP with TLS/SSL, ...), but a good
starting point is probably libcurl's documentation that comes with the
sources.

libcurl's homepage is at http://curl.haxx.se/ ,  which is also the first
match for a Google search for "libcurl". The features libcurl offers
(http://curl.haxx.se/docs/features.html ,  linked from libcurl's home
page mentioned above) sound quite promising (for your application as
described by you).

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

--70fLfmUGd5x0AJTB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBp5JwHb1edYOZ4bsRAqa+AJ9qjaW7eb5cKAFvHRwggXg9BfU/ogCeOsdk
yyeZVFccEYSfEAshhQcoVHQ=
=CzA+
-----END PGP SIGNATURE-----

--70fLfmUGd5x0AJTB--
