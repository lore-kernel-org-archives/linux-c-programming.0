From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: select function question
Date: Sat, 2 Oct 2004 22:45:17 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20041002204517.GS5033@lug-owl.de>
References: <Pine.LNX.4.61.0410011749450.20884@debian>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tgGnixv3tJWXBxdL"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.61.0410011749450.20884@debian>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--tgGnixv3tJWXBxdL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-10-01 17:51:08 -0400, Ameer Armaly <ameer@charter.net>
wrote in message <Pine.LNX.4.61.0410011749450.20884@debian>:
> I have some question about select:
> 1. one of the parameters is called writefds; what does this mean?

The first set contains file descriptors you don't want to block upon
read(). The second set (writefds) contains a set of file descriptors you
don't want to block upon write(). Consider pipes or something like that
with a limited local buffer (on the kernel side).

> 2. what does exceptfds mean?

Never used these, but I guess these would make some sense in connection
to timed out network sockets or the like.

> 3. how do I automatically know when an fd has new data?

Actually, you don't:-)  select() will only tell you that you won't block
at the next read() or write() call. It doesn't actually mean that you
really can read any data from it -- it may return an error and set errno
instead!

However, for some file descriptor types (ie. serial ports or network
sockets) there are ways to determine if there's actually data available.

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

--tgGnixv3tJWXBxdL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBXxNdHb1edYOZ4bsRAs45AJ0SnAbd3QiMO0SDs3JOX/bzi3YWzwCeJ+y/
KZCGC4Jcq9M96Q1ODTxY9tY=
=uj7D
-----END PGP SIGNATURE-----

--tgGnixv3tJWXBxdL--
