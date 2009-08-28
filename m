From: Tim Walberg <twalberg@comcast.net>
Subject: Re: Help on bit operation
Date: Fri, 28 Aug 2009 15:14:20 -0500
Message-ID: <20090828201420.GW5294@comcast.net>
References: <34e1241d0908261602k4d07d422o7ea69b606210701a@mail.gmail.com> <19093.53306.413232.981055@cerise.gclements.plus.com> <34e1241d0908262343p1cd899a8o4c9e956371d570b3@mail.gmail.com> <34e1241d0908272152r32591e52wb1885433edb9a9ff@mail.gmail.com> <ca4725240908281002h4fc32b39t23fb84518bd0ab6a@mail.gmail.com> <34e1241d0908281139k66e8102dy94b70e9fcfd86763@mail.gmail.com> <34e1241d0908281140t65d6eb8cq371ce68cefc2f531@mail.gmail.com> <ca4725240908281258v4715038m1243ebf84b9f7ed9@mail.gmail.com>
Reply-To: Tim Walberg <twalberg@comcast.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xPlWqmdJYj61cSlc"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ca4725240908281258v4715038m1243ebf84b9f7ed9@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: Ben Rosenberg <scdlbx@gmail.com>
Cc: Randi Botse <nightdecoder@gmail.com>, linux-c-programming@vger.kernel.org


--xPlWqmdJYj61cSlc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

If you absolutely need to get at the 32-bit integer value, you can use

union mytype {
{ struct bits {
    unsigned int a:6;
    unsigned int b:4;
    unsigned int c:8;
    unsigned int d:5;
    unsigned int e:9;
  } b;
  unsigned int v;
} variable;

then access the bit-fields like

  unsigned int x =3D variable.b.e;
  variable.b.a =3D 3;
  x =3D variable.v;


 =20


On 08/28/2009 12:58 -0700, Ben Rosenberg wrote:
>>	On Fri, Aug 28, 2009 at 11:40 AM, Randi Botse<nightdecoder@gmail.com> wr=
ote:
>>	> Ben, after assign all bitfield struct member, how to pack them to be a
>>	> 32bit integer value?
>>	>
>>	> DEC =A0 =A0 =A0BIN
>>	> 43 =A0 =A0 =A0 =A0101011 =A0 =A0 =A0 =A0-> foo.a (6 bit)
>>	> 11 =A0 =A0 =A0 =A01011 =A0 =A0 =A0 =A0 =A0 =A0-> foo.b (4 bit)
>>	> 120 =A0 =A0 =A001111000 =A0 =A0-> foo.c (8 bit)
>>	> 30 =A0 =A0 =A0 =A011110 =A0 =A0 =A0 =A0 =A0-> foo.d (5 bit)
>>	> 418 =A0 =A0 =A0110100010 =A0-> foo.e (9 bit)
>>	>
>>	> the bit pattern is : 10101110110111100011110110100010 or 2933800354 in
>>	> decimal, is this possible?
>>	>
>>	> while with masking and shift i can pack them with:
>>	> ((foo.a & 0x3f) << 26) | ((foo.b & 0xf) << 22) | ((foo,c & 0xff) <<
>>	> 14) | ((foo.d & 0x1f) << 9) | (foo.e & 0x1ff)
>>	>
>>	>
>>=09
>>	The bitfield struct is already packed, you don't need to do anything
>>	else. Just assign values to the different parts.
>>=09
>>	Ben
>>	--
>>	To unsubscribe from this list: send the line "unsubscribe linux-c-progra=
mming" in
>>	the body of a message to majordomo@vger.kernel.org
>>	More majordomo info at  http://vger.kernel.org/majordomo-info.html
End of included message



--=20
+----------------------+
| Tim Walberg          |
| 830 Carriage Dr.     |
| Algonquin, IL 60102  |
| twalberg@comcast.net |
+----------------------+

--xPlWqmdJYj61cSlc
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqYOpwACgkQw+Wcj22rJWZ0DgCdGGcfR390BIBt6EgsGkhB9U6d
0SIAnAubDvWKGIPbUz6sRMUpSnxRe75Z
=elqn
-----END PGP SIGNATURE-----

--xPlWqmdJYj61cSlc--
