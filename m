From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Some question about one method.
Date: Fri, 21 May 2004 23:19:30 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040521211930.GQ1912@lug-owl.de>
References: <53BBBB3235C2C74583722B212B36CA0D61F909@vishnu.ctd.hcltech.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3jiw5ANPVMOzTnRQ"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53BBBB3235C2C74583722B212B36CA0D61F909@vishnu.ctd.hcltech.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: Linux devellist <linux-c-programming@vger.kernel.org>


--3jiw5ANPVMOzTnRQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-05-21 16:24:23 +0530, Ranga Reddy M - CTD ,Chennai. <rangaredd=
ym@ctd.hcltech.com>
wrote in message <53BBBB3235C2C74583722B212B36CA0D61F909@vishnu.ctd.hcltech=
=2Ecom>:
> Hi,
>=20
> char ch[1];
> ch[0]=3D(char) sym;
> ch[1]=3D'\0';
>=20
> strcat(tmp,ch);
>=20
> usage of the strcat as you mentioned.
> But, how fast this is going to be I have no idea.

Whoops, off by one! That's a bad (read as wrong and possibly even a
security relevant bug). You declared "ch"  to be an array with one
element, that's ch[0]. So you're not allowed to assign anything to
ch[1]. If you need two bytes, just ask for that.

Remember, inside the braces you put number of elements. It's not the
highest useable index (which is one less than number of elements).

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--3jiw5ANPVMOzTnRQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFArnJiHb1edYOZ4bsRAn3IAKCSM5S954EhH8VxTGx3JwQU62dyVgCfQ1TE
gTyZgOIsu34WtVKsk3I1dfo=
=lDP0
-----END PGP SIGNATURE-----

--3jiw5ANPVMOzTnRQ--
