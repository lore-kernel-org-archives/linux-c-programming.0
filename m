From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Some question about one method.
Date: Mon, 24 May 2004 19:30:18 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040524173017.GW1912@lug-owl.de>
References: <1085135081.21344.21.camel@relay.localnet> <20040521211714.GP1912@lug-owl.de> <c8sab1$biq$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ACGiE8uuT6i9JzJt"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c8sab1$biq$1@sea.gmane.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--ACGiE8uuT6i9JzJt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-05-24 10:06:51 +0200, Charlie Gordon <gmane@chqrlie.org>
wrote in message <c8sab1$biq$1@sea.gmane.org>:
> On Fri, 2004-05-21 14:24:41 +0400, Alphex Kaanoken <alphex@crew.org.ru>
> wrote in message <1085135081.21344.21.camel@relay.localnet>:
> > Hi guys,
> > I'm have a some question
> > how I can change the:
> > sprintf(tmp,"%s%c",tmp,sym);
> > where - char *tmp;int sym;
> > may I use strcat or another method.
> > I need a fast and better method for do it.
>=20
> Jan-Benedict Glaw commented:
> > That's perfectly good in C. Why do you want to change that? It the
> > length of ths ASCIIZ string pointed to by temp is known, there's a good
> > chance to optimize it. However, that's against readability, so I'd
> > advise against it...
>=20
> I must disagree : this piece of code is NOT perfectly good in C.
>=20
> 1) sprintf is a nest of buffer overflow bugs waiting to bite.  The issue =
is
> of course the size of the tmp buffer. If it is known, the code can be
> optimized and that will not make it less readable, conversely, if it is n=
ot
> known, then we have a real bug in front of us, as extending the string by
> one character will likely overwrite whatever is next in memory.
> Don't use sprintf !  use snprintf.  If you cannot use snprintf, then you =
are
> in trouble.

There are sane uses of sprintf(). C is (and always was) by experts for
experts. So you've to do proper allocation anyways:)

> 2) assuming you can use the destination buffer as an argument to sprintf =
is
> asking for trouble !  Obviously it would almost certainly fail if not used
> as the first argument for a format string starting with %s : a very

Argh, you're right on this one. I didn't catch it :-(

> restrictive case.  ISO-C is very clear about such an abuse: 7.19.6.6
> Description "...If copying takes place between objects that overlap, the
> behavior is undefined."  A C library that would not support it and modify
> tmp before it is used as the source for %s would not be incorrect.  The
> unsuspecting C newbie (and the vast majority of his elders) would not
> understand why sprintf(tmp,"%s%c",tmp,sym); would "work" and
> sprintf(tmp,"%c%s",sym,tmp); would "fail".
> Do not encourage such ugly code.

I don't - I'm totally against it now that I've seen that. I never ever
came to the idea of using a source string for destination...

[code fragments]

> Lastly, if you do not understand the above code snipplets, you are lacking
> some fundamental C concepts esp. pointers and should not undertake any
> significant programming project in C.  This is just friendly advice, as
> debugging it will be horribly frustrating.

I second that. C's syntax is quite simple, but only people who really
understand C's pointer and allocation concepts should use it.

> JBG's concern about readability would be best addressed with a utility
> function, possibly implemented inline such as:
>=20
> char *strncat1(char *buf, int bufsize, int c);

Right:)

> - what is -1 ?
> - what is wrong with : enum BOOL { FALSE=3D0, TRUE=3D1 };
> - what is the difference between : i << 2  and i * 4
> - same question for : i >> 2  and  i / 4

That's mostly sign problems/questions. (I don't think there's something
technically wrong with the enum BOOL, but you shouldn't use it except
with other enum BOOL xxx variables ...). But more interestingly:

char *a;
short *b;
int *c;
long *d;
long long *e;

--> What's the difference between a++ and e++?

struct {
	char first;
	char second;
} s1;
struct {
	char both[2];
} s2;

What's the difference:)

But to come to an end, I haven't seen the abous of tmp in the given
example...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--ACGiE8uuT6i9JzJt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAsjEpHb1edYOZ4bsRAptIAKCFkf/dmfplZtYv+vR1Z12FFW8dVwCfZdUD
VNQm+acLsqkgs7o9+ppnJ94=
=hdub
-----END PGP SIGNATURE-----

--ACGiE8uuT6i9JzJt--
