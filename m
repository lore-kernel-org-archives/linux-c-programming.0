From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: parse error
Date: Tue, 28 Sep 2004 08:14:51 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040928061451.GC847@lug-owl.de>
References: <20040926143252.39003.qmail@web52902.mail.yahoo.com> <20040925062900.GC1997@velka.phys.uoa.gr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040925062900.GC1997@velka.phys.uoa.gr>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux prg <linux-c-programming@vger.kernel.org>


--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, 2004-09-25 09:29:01 +0300, Elias Athanasopoulos <elathan@phys.uoa.g=
r>
wrote in message <20040925062900.GC1997@velka.phys.uoa.gr>:
> On Sun, Sep 26, 2004 at 03:32:52PM +0100, Ankit Jain wrote:
> > hi
> >=20
> > i could not understand why compiler has put semi colon
> > before else due t owhich this parse error comes....
> >=20
> > thanks
> >=20
> >  =20
> > #define exch(x,y) { int tmp; tmp=3Dx; x=3Dy; y=3Dtmp; }
>=20
> #define exch(x,y) do { int tmp; tmp=3Dx; x=3Dy; y=3Dtmp; } while(0);

Nearly:-) Omit the last semicolon to make it work...

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

--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBWQFbHb1edYOZ4bsRAidRAJ9GRRzBc1QooiW4CmNS3tbggQ7IhQCeJim7
+XIUZCuRMTIb3/50hMr2rlw=
=uASP
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--
