From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: #include problem
Date: Fri, 15 Oct 2004 23:15:06 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20041015211505.GB5033@lug-owl.de>
References: <200410151648.i9FGmlqM026477@students.fct.unl.pt>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hp5Mu6hJkc9hZLmH"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200410151648.i9FGmlqM026477@students.fct.unl.pt>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--hp5Mu6hJkc9hZLmH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-10-15 17:48:47 +0100, C-16  <pmr17184@students.fct.unl.pt>
wrote in message <200410151648.i9FGmlqM026477@students.fct.unl.pt>:
> Howdy,
> i have a file main.c in my program that needs to include four headers
> aaa.h , bbb.h ,ccc.h and ddd.h . Each one of these headers need to
> include another header xxx.h . With this implementation i get a
> "redefinition" compilation error. How can i solve this problem ? Thanks
> in advance.

Could you please post the exact error message, along with the code lines
it belongs to? I think you've actually got two problems.

One was already explained by various list readers, you'd better use
appropriate header guards.

But "redefinition" and a new declaration are basically two different
things, so I think there's also the error around that your header file
possibly contains actual definitions of variable (instead of only
declarations for those...).

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

--hp5Mu6hJkc9hZLmH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBcD3ZHb1edYOZ4bsRAoEuAJ9wMY9n0z8rcurAd+g9EuZ7ZDlSowCeO8zm
A+1J05g2mEXnW9t5N7Aeifs=
=7gtt
-----END PGP SIGNATURE-----

--hp5Mu6hJkc9hZLmH--
