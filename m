From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: pthread stack limit.
Date: Thu, 25 Nov 2004 11:48:36 +0100
Message-ID: <20041125104836.GE2067@lug-owl.de>
References: <6eee1c404112423345c1d792f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m4E4Spob7u7JiHeu"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6eee1c404112423345c1d792f@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming <linux-c-programming@vger.kernel.org>


--m4E4Spob7u7JiHeu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-11-25 13:04:01 +0530, Vadiraj <vadiraj.cs@gmail.com>
wrote in message <6eee1c404112423345c1d792f@mail.gmail.com>:

>   Does any one has idea on how this thread stack limit is decided
> upon. I see different max stack limit for different pthread
> implementation. Is there a standard that is followed in deciding on
> thread stack size and number of threads?

I guess pthread_attr_getstacksize() and pthread_attr_setstacksize()
can be used for getting/setting the size...

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

--m4E4Spob7u7JiHeu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBpbiEHb1edYOZ4bsRAnkUAKCSQlu9JB8a/4jDrUUuvX/EZYsMEACeIOZ3
OzbpY1J9O4nYRZDW8Rsyh08=
=HuZM
-----END PGP SIGNATURE-----

--m4E4Spob7u7JiHeu--
