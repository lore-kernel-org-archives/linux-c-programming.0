From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Forcing a core dump
Date: Sat, 21 Aug 2004 22:08:28 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040821200828.GW16935@lug-owl.de>
References: <200408191209.37695.opacki@acn.waw.pl> <412622F5.2080208@fi.uba.ar>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ej9ILg6a1PJf5JwG"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <412622F5.2080208@fi.uba.ar>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--ej9ILg6a1PJf5JwG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-08-20 13:12:37 -0300, Dar=EDo Mariani <dmarian@fi.uba.ar>
wrote in message <412622F5.2080208@fi.uba.ar>:
> Hello:
>   Is it possible to force a running program to generate a core dump. My=
=20
> problem is that I have a program that, from time to time, it freezes and=
=20
> I want to know what's going on.

SIGABRT is ment to do exactly that. However, "ulimit" must allow for the
core to be created and core dumps won't work with multi-threaded
programs (I heared rumors that this was changed in 2.6.x).

Also, in cases of a freeze, attaching a debugger (gdb) might help as
much:

$ gdb /path/to/your/program `pidof program`

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

--ej9ILg6a1PJf5JwG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBJ6u8Hb1edYOZ4bsRAjWZAJ9E1838Na52p3enZjGGyFOPl/iDjwCfUDw3
eK+uAyQ8btRvjEtNimkkxF8=
=QaPk
-----END PGP SIGNATURE-----

--ej9ILg6a1PJf5JwG--
