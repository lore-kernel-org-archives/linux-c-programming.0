From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: generating ethernet packets
Date: Wed, 7 Jan 2004 10:22:38 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040107092238.GP14285@lug-owl.de>
References: <20031231144746.7eade402.cialdi@firenze.net> <Pine.LNX.4.44.0401050357350.19414-100000@jlap.stev.org> <20040106123019.76fd7d22.cialdi@firenze.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b6+Jx0QtehpXLScj"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040106123019.76fd7d22.cialdi@firenze.net>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--b6+Jx0QtehpXLScj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-01-06 12:30:19 +0100, Massimiliano Cialdi <cialdi@firenze.net>
wrote in message <20040106123019.76fd7d22.cialdi@firenze.net>:
> On Mon, 5 Jan 2004 03:58:32 +0000 (GMT)
> James Stevenson <james@stev.org> wrote:

> > iirc there are 100's of example on doing this
> where are all these examples?

Mailing lists aren't for saving you from asking some search engines. Try
this and read the first 20 hits.

http://www.google.de/search?hl=3Dde&ie=3DUTF-8&oe=3DUTF-8&q=3Dlinux+socket+=
send+raw+ethernet&btnG=3DGoogle+Suche&meta=3D

> it is also possible to generate an ethernet frame with wrong crc?

Don't *ask*! That's something that you can easily try after getting your
basic program ready. Just prepare a wrongly CRCed frame and try to send
it. While doing so, let a tcpdump run on the local machine as well as on
some remote machine.

Oh, and results may be surprising.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--b6+Jx0QtehpXLScj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/+8/eHb1edYOZ4bsRAhAbAJ4/9Cu689wr0Kekfw1x35m997SLWACcDYGB
j17aRDwdkmxdawKBPt+wmEk=
=/qSl
-----END PGP SIGNATURE-----

--b6+Jx0QtehpXLScj--
