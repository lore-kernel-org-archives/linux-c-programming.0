From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Basic C encryption
Date: Tue, 8 Jul 2003 22:09:40 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030708200940.GT20605@lug-owl.de>
References: <DDFD9B60F648D411AD670000F80822EA03FCAAB7@mail7.monmouth.army.mil>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MET8MpPxp2u2c48q"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DDFD9B60F648D411AD670000F80822EA03FCAAB7@mail7.monmouth.army.mil>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


--MET8MpPxp2u2c48q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-07-08 16:03:30 -0400, Huber, George K CECOM RDEC STCD SRI <Geo=
rge.K.Huber@us.army.mil>
wrote in message <DDFD9B60F648D411AD670000F80822EA03FCAAB7@mail7.monmouth.a=
rmy.mil>:
> Jan-Benedict Glaw wrote:
> >Nice examples, but mostly worthless. It was asked to "encrypt" a
> >function (or a class/instance), not a file. Starting with the binary,
> >you'd first need to find your function/method. Note that objects per se
> actually read the original post, quoted below:
>=20
> "Hi, I need a small, basic way to encrypt a binary file saving a custom
> class from a windoze 32 proyect.

"custom class"?

> The original poster wanted to encrypt a binary file.  The question that he
> asks is how to add a one to each characte (byte) being saved to disk -
> exactly what my examples show.

If it was ment that way - you're right and I claim to be unable to
read:)

However, my reading was that he wanted to hide some
functions/methods/classes from a binary executable file, which is a
non-trivial task, esp. because unencrypting it is much more easier than
encrypting it.

For the purpose of simply encrypting some random data, I'd say to
install gnupg and use one of its simple password ciphers. Then, he even
gets high-quality encryption for the price of only writing some little
wrapper (or using gpgme, which IMHO isn't really easier than writing a
wrapper for that purpose...).

If I misread the original posting - I'm really sorry for submitting TOFU
then...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--MET8MpPxp2u2c48q
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/CyUEHb1edYOZ4bsRAitKAJsGX8CoPWSfQfgbpST24QunCX63JgCfewdv
P5UNsehdQyWDT/8WkfVuvGE=
=gmO2
-----END PGP SIGNATURE-----

--MET8MpPxp2u2c48q--
