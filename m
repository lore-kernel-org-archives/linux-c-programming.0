From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: 64 bits int on ia32
Date: Sat, 9 Oct 2004 22:16:15 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20041009201615.GB5033@lug-owl.de>
References: <20041009141739.GA2134@jehuty.server01.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wshT/1ut16otUOEK"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20041009141739.GA2134@jehuty.server01.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--wshT/1ut16otUOEK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 2004-10-09 16:17:39 +0200, Ricardo Catalinas Jimenez <th1nk3r@serve=
r01.org>
wrote in message <20041009141739.GA2134@jehuty.server01.org>:
> Hi everybody,
>=20
> I know the 'long long' type, I also try 'sizeof(long long)' and it return=
s 8.
> But when I use it, the max number it can store is 0xffffffff.

How did you check that this is the largest number? I guess you either
used a wrong format specifier for a printf call (that'd clamp the value
to it's low-order long value). Also note that you should probably add a
type suffix of "LL" or "ULL" to that value, cf. 6.4.4.1 of the C99
standard.

So how did you use the long long typed variable?

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

--wshT/1ut16otUOEK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBaEcPHb1edYOZ4bsRAlW6AJ9OIAS3Ru8X3Mxr4FZpg0ihqH3EBwCdH1O0
8hdP6Ux+H3XbqHruSvUDiyk=
=jBRH
-----END PGP SIGNATURE-----

--wshT/1ut16otUOEK--
