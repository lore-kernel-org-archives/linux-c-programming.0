From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: assignment makes pointer from integer without a cast?
Date: Mon, 13 Dec 2004 20:53:16 +0100
Message-ID: <20041213195316.GE16958@lug-owl.de>
References: <1102899159.7251.14.camel@guru.puzzled.xs4all.nl> <20041213014757.89052.qmail@web12706.mail.yahoo.com> <20041213161354.GD1487@sweetdream>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1BXV+/FYeXhtv2WT"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20041213161354.GD1487@sweetdream>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--1BXV+/FYeXhtv2WT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-12-13 17:13:54 +0100, Francesco Gadaleta <francesco@gadaleta.o=
rg>
wrote in message <20041213161354.GD1487@sweetdream>:
> > void usage(char *prog_ptr) /* not int* */
> > {
> > 	fprintf(stdout,"progname is: %s\n",prog_ptr); /* not
> > *prog_ptr */
> > }
> > =09
> > int main(int argc, char *argv[])
> > {
> > 	char *prog_ptr; /* not int * */
> > 	prog_ptr =3D basename (argv[0]);
> > 	usage(prog_ptr); /* not &prog_ptr */
> > 	return(0);
> > }
> change this line:
> prog_ptr =3D basename (argv[0]);
>=20
> with this:
> prog_ptr =3D (char*) basename (argv[0]);

No, better include the proper header file <libgen.h> or <string.h>
(after #defining _GNU_SOURCE). This way, you don't force gcc into
guessing it's type. If you had compiled this with a C++ compiler (*), it
wouldn't even had accepted the code or wouldn't link it later on.

MfG, JBG
(*) Compiling not-too-complicated C code with a C++ compiler can reveal
some additional oddities that a pure C compiler wouldn't warn on. So if
you keep your code being compileable with both a C and a  C++ compiler
when you start a new project, this won't hurt (but probably pay back at
some time). (-> Right, I'm a C programmer and personally don't use C++
that often, because it's too hard to write "basic" stuff with it).

--=20
Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481             =
_ O _
"Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg  =
_ _ O
 fuer einen Freien Staat voll Freier B=C3=BCrger" | im Internet! |   im Ira=
k!   O O O
ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA)=
);

--1BXV+/FYeXhtv2WT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBvfMsHb1edYOZ4bsRAh5pAJ4vAL0q1dqBXD6xuIKbv0d1u3FGZgCeI3ae
g4iZmiPRgrmS3DCJCQ5dDL8=
=gEjP
-----END PGP SIGNATURE-----

--1BXV+/FYeXhtv2WT--
