From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: complex variable
Date: Wed, 8 Sep 2004 14:06:58 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040908120658.GZ6985@lug-owl.de>
References: <E3E30069B061524E90BCEE4417E30661138525@monm207.monmouth.army.mil> <chml6d$kri$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2y/feSa6JmJqKeZ6"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <chml6d$kri$1@sea.gmane.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--2y/feSa6JmJqKeZ6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-09-08 11:59:48 +0200, Charlie Gordon <gmane@chqrlie.org>
wrote in message <chml6d$kri$1@sea.gmane.org>:

> >     char  szName[] =3D "test_data.dat";
>=20
> This is quite inefficient : declaring a local initialized array will prod=
uce
> equivalent code to:
>=20
>   char szName[sizeof("test_data.dat")];
>   memcpy(szName, "test_data.dat", sizeof("test_data.dat"));
>=20
> Whereas declaring a const char* fileName =3D "test_data.dat" will likely =
get
> optimized by the compiler as not even storing the address into a local
> variable.

But remember there's a subtle difference between

	char filename[] =3D "/path/to/file";

and
	char *filename =3D "/path/to/file";


You may write to the first one (eg. later on use snprintf and friends
with it), but you may not write to the 2nd one!

> >     if(NULL !=3D (fp =3D fopen(szName, "rb")))
>=20
> This style is really ugly!  there is really no advantage at combining the
> assignment and the test:
>    fp =3D fopen(fileName, "rb");
>    if (fp !=3D NULL) {

That's somewhat personal style. Also notice that he's got the NULL at
the beginnnig of the comparison, not at the end. That's something that
seems to be tought these days, because assignments (if you mis-write
"!=3D" as "=3D!" or "|=3D") will produce compile-time errors (NULL isn't a
lvalue).

> >     {
> >         int N=3D32, i=3D0;
> >         complex x, *in =3D NULL;
>=20
> Are you sure about the complex type implementation ?
> Are the real and imaginary parts float, double, of even long double ?
> Reading them in bulk from the file is definitely not advisable, because of
> this and because of byte ordering issues.

For now, ignore the fact that in[] is wrongly accessed. It'll somewhat
work (while being non-portable), I guess this code is here to only have
a useful test program :-)

> >   if(NULL !=3D (in=3Dmalloc(sizeof(complex)*N)))
>=20
> N as the uppercase name implies seems to be a constant in this code...
> why not make it a const outside this block and declare in as a local array
> instead of allocating it off the heap.

A #define would have served, too, as well as a const int. Test code
*needs* to be a bit ugliysh to qualify as test code :-)

> >         {
> >             if(N =3D=3D fread(in, sizeof(complex), N, fp))
> >             {
> >                 for(i=3D0; i< N; i++)
> >                     printf("%lf\t", in[i]);
>=20
> What does this mean ?
> C99 makes no difference between %f and %lf
> I'm not sure what passing a complex to printf will actually do.  Most lil=
ely
> not what you want and definitely not portable.

Works for now, see the ugliness clause above. (Sure, you don't want that
code in your program's final version, though...)

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

--2y/feSa6JmJqKeZ6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBPvXiHb1edYOZ4bsRAg1xAJ9qGbfQ1Ti2Y8KIPsjGGvj8wXArAgCfc1Ue
8/SfYbyu/imArXCHtluO98E=
=QpxO
-----END PGP SIGNATURE-----

--2y/feSa6JmJqKeZ6--
