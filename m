From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Newbie - Perl Equivalent Split - Seg Faults
Date: Mon, 13 Dec 2004 21:21:51 +0100
Message-ID: <20041213202151.GF16958@lug-owl.de>
References: <BDE333E9.1622%dsessions@ionosphere.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mg8cdxx98+SFDaXr"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BDE333E9.1622%dsessions@ionosphere.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--mg8cdxx98+SFDaXr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-12-13 11:56:25 -0500, Darren Sessions <dsessions@ionosphere.ne=
t>
wrote in message <BDE333E9.1622%dsessions@ionosphere.net>:
> #include <stdio.h>
> #include <string.h>
>=20
> char *split_char(char *string, char *delim) {
>   fprintf( stderr, "\tString =3D %s \n", string);
>   fprintf( stderr, "\tDelimiter =3D %s \n", delim);
>   string =3D strtok(string, delim);

Rule of thumb: don't use strtok(), because it internally maintains some
parsing state. Even if you (right now) only have a single-threaded
program which wouldn't probably suffer from strtok()'s limitations, you
don't know if your code won't be--at some time--used in a threaded
environment. Just use strtok_r() instead. ...and even if you use the
strtok_r(), try to avoid it:-)

Both strtok_r() and strtok() modify the string you supplied. While this
is acceptable for some uses, it'll break from time to time (as in this
example). This is why the man page actually warns about using these
functions.

=2E..but what happens here, why does it break? Well, that's easy. Keeping
in mind that this function actually modifies the supplied string, this
is actually where it segfaults...

>   return string;
> }
>=20
> int main()
> {
>   char *testvar;
>   testvar =3D split_char("test-hello", "-");

=2E..and it segfaults because you supply "test-hello right here, right the
way you do it.

If you put some "sdfkjhsdf constant somewhere, of if you have a=20

char *string =3D "some text";

the compiler is allowed to imply that these strings are never ever
modified, but (in the 2nd example) the *pointer* to the string may
change. So gcc knows that "test-hello" won't ever be modified and puts
it into a segment of memory that gets configured as "modify forbidden".
When split_char() calls strtok(), the later one tries to modify the
string (replaces ' ' by '\0') which will result in a segmentation
violation. So you need to force the compiler into laying out your text
as a modifyable string. You can do this by:

char test_hello[] =3D "test_hello";
=2E..
testvar =3D split_char (test_hello, "-");
=2E..

Notice that this time, I didn't declare a pointer to string (char *),
but an array of chars (char []). This builds up to the difference of
"modify forbidden" versus "modify allowed".

>   fprintf( stderr, "\tArray =3D %s \n", testvar);
>   return(0);
> }

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

--mg8cdxx98+SFDaXr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBvfnfHb1edYOZ4bsRAnwZAJ0ea1VTjsAagjsV8t2R4PSX/8Ub3ACdEz1c
wiaA2HztXggf8DiIjbUoIf4=
=Mird
-----END PGP SIGNATURE-----

--mg8cdxx98+SFDaXr--
