From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Assignment  make pointers
Date: Mon, 13 Dec 2004 11:10:11 +0100
Message-ID: <20041213101011.GO16958@lug-owl.de>
References: <20041213_100432_025782.r_zaca@ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wTzoGrkn2AhIv4sC"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20041213_100432_025782.r_zaca@ig.com.br>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--wTzoGrkn2AhIv4sC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-12-13 08:04:32 -0200, r_zaca <r_zaca@ig.com.br>
wrote in message <20041213_100432_025782.r_zaca@ig.com.br>:
Content-Description: Mail message body
>   If you take a look in "man 3 basename", you'll see that basename functi=
on=20
> just returns a pointer to a char. In the case above you need to "cast" th=
e=20
> pointer returned to be of type int.=20
>   Like: prog_ptr =3D (int *) basename (argv[0]);=20

Don't do that. Usually, you can write even quite large programs without
using casts at all. Most of the time, a cast points to spots in your
programs that are badly designed from the type of your variables point
of view. If your variables are of senseful types and obey a well-thought
structure (like using enums and unions instead of #defines and casts),
you usually don't need to cast.

Also, I usually suggest to compile code with "-Wall" -- that'll show you
probably lots of odd constructs that should be written differently (or
using proper types).

MfG, JBG

--=20
Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481             =
_ O _
"Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg  =
_ _ O
 fuer einen Freien Staat voll Freier B=C3=BCrger" | im Internet! |   im Ira=
k!   O O O
ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA)=
);

--wTzoGrkn2AhIv4sC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBvWqDHb1edYOZ4bsRAh/0AJ40dbv5J0pnOPFX0UJ2j/sjxunVhQCcD8/m
GMmGYWb/9MuBWTIlpNJpb5o=
=pjbQ
-----END PGP SIGNATURE-----

--wTzoGrkn2AhIv4sC--
