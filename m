From: Mat Harris <mat.harris@genestate.com>
Subject: writing logfile
Date: Tue, 25 Feb 2003 10:57:40 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030225105740.A31033@genestate.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

WARNING: Newbie ALERT!!!

I am trying to write three functions to plugin to my app. They are defined=
=20
in log.h and are used for opening, writing to, and closing a logfile. I have
attached log.h.

My questions are: How do I tell fopen to create if not there or append if
it is? I seem to get an error either way.=20

And: Why does the fputs cause a segfault? Is there a better way of doing it?
I know I do not understand types and casting very well so I may have it
totally wrong.

Thanks

--=20
Mat Harris			OpenGPG Public Key ID: C37D57D9
mat.harris@genestate.com	www.genestate.com=09

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE+W0wkEsYvZsN9V9kRAoXdAJ96CScmQpB8MSJKAfy6JbmsykjfDwCguUPU
SO3Y47NPrxFe0NWZdgXbueI=
=wVx9
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
