From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: complex variable
Date: Mon, 6 Sep 2004 18:37:01 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040906163701.GD6985@lug-owl.de>
References: <20040906134525.33692.qmail@web52908.mail.yahoo.com> <20040906162532.22345.qmail@web52904.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xugVLPVe/nLWwmIL"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040906162532.22345.qmail@web52904.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--xugVLPVe/nLWwmIL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-09-06 17:25:32 +0100, Ankit Jain <ankitjain1580@yahoo.com>
wrote in message <20040906162532.22345.qmail@web52904.mail.yahoo.com>:
> >       1 #include<stdlib.h>
> >       2 #include<complex.h>
> >       3 #include<stdio.h>
> >       4
> >       5 int main()
> >       6 {
> >       7         FILE *fp;
> >       8         fp=3Dfopen("test_data.dat","rb");
> >       9         int N=3D32,i=3D0;
> >      10         complex x,*in;
> >      11         in=3Dmalloc(sizeof(complex)*N);

You need to check the "in" pointer -- malloc() may fail!

> >      12         if (fread(in,16,32,fp) !=3D 32)

"16" should read "sizeof (complex)". If you don't do that, you loose any
portability (for no added value). Additionally, both "32" should be "N",
since that's what you really want to read, what you really malloc()ed.

Also (from personal experience), I can only strongly advise you not to
read in (or write out) numbers like that. All the data types may look
different on different CPUs or operating systems, so better stick to an
encoding that's common to all of them.

Define an own encoding for those values (eg. printf() out their real and
imaginary part as decimal floating-point values and translate these back
to "complex" values). It's a real *nightmare*.

> >      13          printf("error in reading from file
> > failed\n");
> >      14         else{
> >      15         for(i=3D0;i<N;i++)
> >      16           printf("%lf\t",*(in+i+0));

Others would have used that as in[i] ... Easier to read:-)

> >      17         }
> >      18         return 0;
> >      19 }
> >=20
> > i am sorry but this code also gives the same error
> >=20
> > error in reading from file failed

Even while your programs "features" a good number of typical no-no's,
it should probably work. Are you sure the file is long enough? Could you
provide a strace from this program being run?

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

--xugVLPVe/nLWwmIL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBPJItHb1edYOZ4bsRArssAJ9bCZWA6pXGT6GUCezbCowi26uqggCfZbqM
wE28UJB6+blgmy1oF3nLZ64=
=RrNt
-----END PGP SIGNATURE-----

--xugVLPVe/nLWwmIL--
