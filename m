From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Some question about one method.
Date: Fri, 21 May 2004 23:17:14 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040521211714.GP1912@lug-owl.de>
References: <1085135081.21344.21.camel@relay.localnet>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3Yrl+jGa2CfIAyZq"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1085135081.21344.21.camel@relay.localnet>
List-Id: <linux-c-programming.vger.kernel.org>
To: Linux devellist <linux-c-programming@vger.kernel.org>


--3Yrl+jGa2CfIAyZq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-05-21 14:24:41 +0400, Alphex Kaanoken <alphex@crew.org.ru>
wrote in message <1085135081.21344.21.camel@relay.localnet>:
> Hi guys,
> I'm have a some question
> how I can change the:
> sprintf(tmp,"%s%c",tmp,sym);
> where - char *tmp;int sym;
> may I use strcat or another method.
> I need a fast and better method for do it.

That's perfectly good in C. Why do you want to change that? It the
length of ths ASCIIZ string pointed to by temp is known, there's a good
chance to optimize it. However, that's against readability, so I'd
advise against it.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--3Yrl+jGa2CfIAyZq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFArnHaHb1edYOZ4bsRAmXPAJ42IU/i1LvGevgnsq/p3wsIuwZL9QCfS/Zv
8iGfQX8NrczIEY8h910mJbo=
=pOm8
-----END PGP SIGNATURE-----

--3Yrl+jGa2CfIAyZq--
