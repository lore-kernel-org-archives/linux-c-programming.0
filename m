From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Antwort: Re: Antwort: Re: -EFAULT during freeing a pointer to a structure
Date: Fri, 8 Oct 2004 15:59:38 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20041008135938.GO5033@lug-owl.de>
References: <OF9FBCFEF1.D1EE727C-ONC1256F27.0043E708@bln.d-trust.de> <41669D5E.1050402@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XpNX0AP0or0vBirh"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <41669D5E.1050402@hq.ntsp.nec.co.jp>
List-Id: <linux-c-programming.vger.kernel.org>
To: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Cc: p.boehm@d-trust.net, linux-c-programming@vger.kernel.org


--XpNX0AP0or0vBirh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-10-08 21:59:58 +0800, Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
wrote in message <41669D5E.1050402@hq.ntsp.nec.co.jp>:
> I may not know how u got away with it by using even values for maxnum,
> but almost everbody knows that an array created with N elements/slots in=
=20
> C,C++ or in java
> could only be safely accessed/manipulated via the indices 0...N-1=20
> (unless if u're an expert in memory manipulation)

Don't ever do that. While you may "survive" on one operating system
using a specific malloc library and a specific processor, you just loose
all portability. Just use the malloc functions as they were advertised
in their manual pages :-)

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

--XpNX0AP0or0vBirh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBZp1KHb1edYOZ4bsRAq0eAJ9EwukfsW7id3iG52zXpQ2ATih8RgCeJEhY
qnUK3HIfYR46vulGrcBVtvY=
=z+N+
-----END PGP SIGNATURE-----

--XpNX0AP0or0vBirh--
