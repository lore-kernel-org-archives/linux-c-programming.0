From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: How to RESET the client connection socket?
Date: Thu, 22 Apr 2004 12:24:16 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040422102416.GQ12700@lug-owl.de>
References: <20040421133208.GF12700@lug-owl.de> <20040422091722.78999.qmail@web21208.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iks5JP/frMpeeVyh"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040422091722.78999.qmail@web21208.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--iks5JP/frMpeeVyh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-04-22 02:17:22 -0700, Srinivas Chinta <chintasrinivas_tech@yah=
oo.com>
wrote in message <20040422091722.78999.qmail@web21208.mail.yahoo.com>:
> Thanks a lot for clearing my problem.
> By the way, is shutdown(2) something similar to
> setting socket linger options ?
> And, this shutdown(2) send any RESET error something
> back to client? or, client will be able to know that
> the server has RESET the connection?

Just try it:) You don't even need to modify your code for that. Simply
start your application within a debugger and call the shutdown function
by hand. While doing so, run a tcpdump to see what's happening.

And for the SO_LINGER option, right, there's some interaction with
close() and shutdown(). See socket(7).

Oh, for in-depth exploration of socket programming, see if you can
afford W. Richard Steven's books (_Unix Network Programming Vol1+Vol2_
for the practical part, _TCP/IP Illustrated Vol1/2/3_ for the theory).
They're really worth the money.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--iks5JP/frMpeeVyh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAh51QHb1edYOZ4bsRAo9KAJ9nqt27q/X6qPK3jvoOkfr01KH/RACcDuft
c2pcwqPfWq5PhupMjRqKyQ4=
=bg0E
-----END PGP SIGNATURE-----

--iks5JP/frMpeeVyh--
