From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: gcc and threads
Date: Fri, 26 Nov 2004 21:26:07 +0100
Message-ID: <20041126202607.GY2067@lug-owl.de>
References: <B0004146823@hermes.imsd.uni-mainz.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R9qb+eAX/AZDW6n0"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <B0004146823@hermes.imsd.uni-mainz.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--R9qb+eAX/AZDW6n0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-11-25 17:25:54 +0100, Christian Stalp <stalp@imbei.uni-mainz.d=
e>
wrote in message <B0004146823@hermes.imsd.uni-mainz.de>:
> Hello everybody,
> does anyone know, how to enable the thread-support for gcc ?

There are several parts that need proper configury to actually reach a
multi-threaded application:

	- a thread library (typically linuxthreads or NPTL) is needed
	- GCC needs to make use out of that
	- your application must use it (pthread_create() et al.) and of
	  course link agains it (-lpthread)

If you're a typical Linux user on a mainstream platform (ie. you can
install your distribution's libc and gcc), then you can just start
hacking a thread-using application.

If you're working on the embedded border, you've probably to first build
a cross compiler. This is a major task, you may want to look at
"crosstool", a number of scripts to aid the user in this task, written
by Dan Kegel.

However, your question isn't specific in any way, so you may want to ask
another question not that broad :-)

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

--R9qb+eAX/AZDW6n0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBp5FeHb1edYOZ4bsRAvonAKCAsWaBejgjpt6lo5T7WDyQj1m/rACdFvfc
Wv41OULJQq9MmZje1YeH9vE=
=4R/c
-----END PGP SIGNATURE-----

--R9qb+eAX/AZDW6n0--
