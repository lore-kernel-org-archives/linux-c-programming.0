From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Stupid Question.
Date: Thu, 13 May 2004 16:38:52 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040513143852.GE1912@lug-owl.de>
References: <1084387986.15249.25.camel@scotus.fesnel.no-ip.org> <6.0.1.1.0.20040512125919.02e8cec0@no.incoming.mail>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s33SFO/vI16wUVFN"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6.0.1.1.0.20040512125919.02e8cec0@no.incoming.mail>
List-Id: <linux-c-programming.vger.kernel.org>
To: "Linux-C-Programming (E-mail)" <linux-c-programming@vger.kernel.org>


--s33SFO/vI16wUVFN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-05-12 13:02:25 -0600, Jeff Woods <Kazrak+kernel@cesmail.net>
wrote in message <6.0.1.1.0.20040512125919.02e8cec0@no.incoming.mail>:
> At 5/12/2004 02:53 PM -0400, John T. Williams wrote:
> >What does declaring a function static do?    ie
> >What is the difference between
> >static int blue() {
> >        return 0;
> >}
> >and
> >int blue() {
> >        return 0;
> >}
>=20
> It makes the function visible only within the comilation unit it's in.  S=
ee=20
> also:

A static function (or variable) will only be "visible" within exactly
that .c file which it is defined in.

Static automatic variables (those that are within functions) do have a
different semantic: their contents is preserved during multiple function
calls.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--s33SFO/vI16wUVFN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAo4h8Hb1edYOZ4bsRAqhoAJ9D3kAKgT4vwYTsoEBcIkf1L3FgEgCfTZHU
kZAXqpWFnQYlSuYbzNKOAfg=
=UuOC
-----END PGP SIGNATURE-----

--s33SFO/vI16wUVFN--
