From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: memory_allocation
Date: Fri, 13 Aug 2004 15:01:53 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040813130153.GL16935@lug-owl.de>
References: <I2DXAF$7B97927BCA10A589B58FC0F34E16A58F@laposte.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XZq0mbLCR4KNTYFe"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <I2DXAF$7B97927BCA10A589B58FC0F34E16A58F@laposte.net>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming <linux-c-programming@vger.kernel.org>


--XZq0mbLCR4KNTYFe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-08-13 14:27:51 +0200, simon.guinot <simon.guinot@laposte.net>
wrote in message <I2DXAF$7B97927BCA10A589B58FC0F34E16A58F@laposte.net>:
> hello,
>=20
> i have a problem with a structure memory allocation...
> =20
> struct dns_answer {
>          unsigned short type;
>          unsigned short class;
>          unsigned int ttl;
>          unsigned short rdlength;
>          unsigned int addr_answer;
>          } dns_answ;
>=20
> all this element are not adjacent in memory... i have two
> "free bytes" between rdlenght and addr_answer...
> since here, i have alway made my headers like this... and no
> problem...

You can add  "__attribute__ ((packed))" to the declaration of that
struct to force GCC to pack it. However, keep in mind that the gap does
serve a purpose! Accessing those parts at unaligned offsets may cause
quite some speed penalty on some CPUs. However, if it's a binary
structure (as it looks like), that's okay. (NB: Is your coding
endianess-save in that case?)

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

--XZq0mbLCR4KNTYFe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBHLvAHb1edYOZ4bsRAmDNAKCKeY7VJe7OIaCS6CrEWkRKO3V4wwCcCHgM
awhlUpBiggel3HzZGkoCdH8=
=FWKr
-----END PGP SIGNATURE-----

--XZq0mbLCR4KNTYFe--
