From: =?iso-8859-1?q?Ankit=20Jain?= <ankitjain1580@yahoo.com>
Subject: Re: complex variable
Date: Wed, 8 Sep 2004 17:25:37 +0100 (BST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040908162537.4782.qmail@web52906.mail.yahoo.com>
References: <20040908120658.GZ6985@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040908120658.GZ6985@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: linux prg <linux-c-programming@vger.kernel.org>

thanks....

but sorry sir i could not understand one thing which u
also clearly detected. it is "in" variable....its a
complex variable. this is somewhat not correct

complex x, *in =3D NULL;

but i wanted to ask if i want to use in as a 2D array
how to do that?

Ankit
 --- Jan-Benedict Glaw <jbglaw@lug-owl.de> wrote:=20
> On Wed, 2004-09-08 11:59:48 +0200, Charlie Gordon
> <gmane@chqrlie.org>
> wrote in message <chml6d$kri$1@sea.gmane.org>:
>=20
> > >     char  szName[] =3D "test_data.dat";
> >=20
> > This is quite inefficient : declaring a local
> initialized array will produce
> > equivalent code to:
> >=20
> >   char szName[sizeof("test_data.dat")];
> >   memcpy(szName, "test_data.dat",
> sizeof("test_data.dat"));
> >=20
> > Whereas declaring a const char* fileName =3D
> "test_data.dat" will likely get
> > optimized by the compiler as not even storing the
> address into a local
> > variable.
>=20
> But remember there's a subtle difference between
>=20
> 	char filename[] =3D "/path/to/file";
>=20
> and
> 	char *filename =3D "/path/to/file";
>=20
>=20
> You may write to the first one (eg. later on use
> snprintf and friends
> with it), but you may not write to the 2nd one!
>=20
> > >     if(NULL !=3D (fp =3D fopen(szName, "rb")))
> >=20
> > This style is really ugly!  there is really no
> advantage at combining the
> > assignment and the test:
> >    fp =3D fopen(fileName, "rb");
> >    if (fp !=3D NULL) {
>=20
> That's somewhat personal style. Also notice that
> he's got the NULL at
> the beginnnig of the comparison, not at the end.
> That's something that
> seems to be tought these days, because assignments
> (if you mis-write
> "!=3D" as "=3D!" or "|=3D") will produce compile-time
> errors (NULL isn't a
> lvalue).
>=20
> > >     {
> > >         int N=3D32, i=3D0;
> > >         complex x, *in =3D NULL;
> >=20
> > Are you sure about the complex type implementation
> ?
> > Are the real and imaginary parts float, double, of
> even long double ?
> > Reading them in bulk from the file is definitely
> not advisable, because of
> > this and because of byte ordering issues.
>=20
> For now, ignore the fact that in[] is wrongly
> accessed. It'll somewhat
> work (while being non-portable), I guess this code
> is here to only have
> a useful test program :-)
>=20
> > >   if(NULL !=3D (in=3Dmalloc(sizeof(complex)*N)))
> >=20
> > N as the uppercase name implies seems to be a
> constant in this code...
> > why not make it a const outside this block and
> declare in as a local array
> > instead of allocating it off the heap.
>=20
> A #define would have served, too, as well as a const
> int. Test code
> *needs* to be a bit ugliysh to qualify as test code
> :-)
>=20
> > >         {
> > >             if(N =3D=3D fread(in, sizeof(complex),
> N, fp))
> > >             {
> > >                 for(i=3D0; i< N; i++)
> > >                     printf("%lf\t", in[i]);
> >=20
> > What does this mean ?
> > C99 makes no difference between %f and %lf
> > I'm not sure what passing a complex to printf will
> actually do.  Most lilely
> > not what you want and definitely not portable.
>=20
> Works for now, see the ugliness clause above. (Sure,
> you don't want that
> code in your program's final version, though...)
>=20
> MfG, JBG
>=20
> --=20
> Jan-Benedict Glaw       jbglaw@lug-owl.de    .
> +49-172-7608481             _ O _
> "Eine Freie Meinung in  einem Freien Kopf    | Gegen
> Zensur | Gegen Krieg  _ _ O
>  fuer einen Freien Staat voll Freier B=FCrger" | im
> Internet! |   im Irak!   O O O
> ret =3D do_actions((curr | FREE_SPEECH) &
> ~(NEW_COPYRIGHT_LAW | DRM | TCPA));
>=20

> ATTACHMENT part 2 application/pgp-signature
name=3Dsignature.asc
=20

_______________________________________________________________________=
_
Yahoo! Messenger - Communicate instantly..."Ping"=20
your friends today! Download Messenger Now=20
http://uk.messenger.yahoo.com/download/index.html
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
