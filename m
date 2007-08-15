From: Jesse Ruffin <joruffin@gmail.com>
Subject: Re: String comparison for fixed strings
Date: Wed, 15 Aug 2007 14:51:21 -0400
Message-ID: <200708151451.48929.joruffin@gmail.com>
References: <9870a8150708150406x6297b877u473bfbbc62949f10@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1355457.JvPkCkknoY";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <9870a8150708150406x6297b877u473bfbbc62949f10@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

--nextPart1355457.JvPkCkknoY
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

If you are only checking for exact equality of a buffer against a string, t=
he memcmp() function may be slightly faster.

if ( memcmp( (const void*) s, (const void*) "ABC", 3 ) =3D=3D 0 ) {
	// equal
} else {
	// not equal
}

Jesse Ruffin

On Wednesday 15 August 2007 07:06, KhaOsh wrote:
> Hello everyone,
>=20
> In terms of speed what the fastest way of doing a strings comparison
> on fixed strings? Using one of those strcmp() functions or doing the
> following:
>=20
> (Pseudo code)
> "if (s[0] =3D=3D 0xa && s[1] =3D=3D 0xb && s[2] =3D=3D 0xc)" (etc)
> or
> "if (s[0] =3D=3D 'A' && s[1] =3D=3D 'B' && s[2[ =3D=3D 'C')" (etc)
>=20
> Thanks for your help.
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-program=
ming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--nextPart1355457.JvPkCkknoY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQBGw0s+8GGeAXLl3osRAgQrAJ9kAg583kpqgj8ujUF7+fkRU/1PtwCeMmAo
MEOXxoJEcybdUc7JozITwFU=
=YD0o
-----END PGP SIGNATURE-----

--nextPart1355457.JvPkCkknoY--
