From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Antwort: Re: Antwort: Re: -EFAULT during freeing a pointer to a structure
Date: Fri, 8 Oct 2004 14:43:36 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20041008124335.GM5033@lug-owl.de>
References: <OF9FBCFEF1.D1EE727C-ONC1256F27.0043E708@bln.d-trust.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KacV9ay54byzWlry"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <OF9FBCFEF1.D1EE727C-ONC1256F27.0043E708@bln.d-trust.de>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--KacV9ay54byzWlry
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-10-08 14:27:11 +0200, p.boehm@d-trust.net <p.boehm@d-trust.net>
wrote in message <OF9FBCFEF1.D1EE727C-ONC1256F27.0043E708@bln.d-trust.de>:
>=20
> sorry, but it isn't a problem of loop. check this while running the prog.=
=2E.

It *is* a problem of the loop.
> test one:
>=20
>      #define MAXNUM 7
>      compile it and run ...
>      you'll see while freeing ptr->next[0] an -EFAULT occours.

Right, because:

struct abc {                                                               =
              =20
     struct xy *next[MAXNUM];                                              =
              =20
};                                                                         =
              =20

You malloc one of these struct abc. It's size depends on MAXNUM. You're
not allowed to access the "next" array with any index outside of
[0 .. MAXNUM-1]. If you do, unpredictable results happen (as you see:-)

> test two:
>=20
>      #define MAXMUM 8
>      compile it and run ...
>      you'll see freeing ptr->next[0] works fine.
>=20
> my question: why it is so.

Because by writing to the ->next[8] element, which is outside of what
you had allocated before, you overwrite glibc's internal housekeeping
data.

Glibc's internal malloc functions are written for correctness and speed.
They don't tolerate being abused by writing data to memory outside your
allocated memory.

In your example above, using MAXNUM=3D7, I guess glibc internally
allocates 32 bytes (28 to be used for struct abc) and the last four
bytes for glibc's own bookkeeping. By writing to ->next[8] (which is
syntactically correct, but semantically not allowed, because you
declared the array to be one element shorter than this:-) ,  you
overwrite data which is internal to glibc. Some time later (at free()
time), this internal data (you previously overwrote because the loops
were semantically broken) gets used and is wrong (because you altered
it). It's okay to crash then.

In the case of MAXNUM=3D8, glibc probably allocates a 2nd chunk of 32
bytes to store it's internal data. ...and because it's internal data is
probably stored in it's last 4 bytes, you don't overwrite it, because
you only overwrite the first 4 byte of this extra block of memory.

To keep the long story short, your program wrote to memory it's not
permitted to write to and subsequently crashes. That's totally okay and
expected. Just fix those two loops to stay within the range allowed for
the index.

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

--KacV9ay54byzWlry
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBZot3Hb1edYOZ4bsRAlHcAKCS6G7IWEwQkUWBQMlt2NEb1GgdEQCgjIS/
PPtWMHaQUGN3ukrmCI4BYkQ=
=8bhR
-----END PGP SIGNATURE-----

--KacV9ay54byzWlry--
