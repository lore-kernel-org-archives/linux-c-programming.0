From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Help on bit operation
Date: Thu, 27 Aug 2009 01:15:54 +0100
Message-ID: <19093.53306.413232.981055@cerise.gclements.plus.com>
References: <34e1241d0908261602k4d07d422o7ea69b606210701a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <34e1241d0908261602k4d07d422o7ea69b606210701a@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Randi Botse wrote:

> Hi, I'm beginner C programmer, i have a problem, i want to store some
> information in a integer, a integer will be 32 bit on my machine, i
> want to have as follow:
>=20
> 6 bit (information 1) =A0 MSB
> 4 bit (information 2)
> 8 bit (information 3)
> 5 bit (information 4)
> 9 bit (information 5)   LSB
>=20
> For example i set the informations as follow (in decimal):
>=20
> information 1 =3D 43        or 101011
> information 2 =3D 11        or 1011
> information 3 =3D 120      or 1111000
> information 3 =3D 30        or 11110
> information 4 =3D 418      or 110100010
>=20
> if i join all informations i should get a 32 bit integer valued
> 2935782212 or 01010111011111100011110110100010, then my problem is ho=
w
> to retrieve these informations on bit operation? i want to know what'=
s
> the value of information-2 or information-3, etc directly.  And, is
> there any good way to join these informations to be an 32 bit integer=
?
>=20
> at this time i convert the 32bit integer into binary string, process
> it's with array segment to get all informations then convert them to
> integer,
> to build the 32bit integer, i join all information value into binary
> string (yes, 32 bit of char ;p) join all of them then convert to
> integer.
>=20
> I know my way is sucks and too far away from COOL thing ;p,  i think
> there are cool way to do this!.

Two options:

1. Bit fields:

	struct information {
	#if __BYTE_ORDER =3D=3D __LITTLE_ENDIAN
		unsigned int information_1 : 6;
		unsigned int information_2 : 4;
		unsigned int information_3 : 8;
		unsigned int information_4 : 5;
		unsigned int information_5 : 9;
	#else
		unsigned int information_5 : 9;
		unsigned int information_4 : 5;
		unsigned int information_3 : 8;
		unsigned int information_2 : 4;
		unsigned int information_1 : 6;
	#endif
	};

2. Shift and mask:

	value =3D value & ~0x3F  << 26 | (information_1 & 0x3F)  << 26;
	value =3D value & ~0x0F  << 22 | (information_2 & 0x0F)  << 22;
	value =3D value & ~0xFF  << 14 | (information_3 & 0xFF)  << 14;
	value =3D value & ~0x1F  <<  9 | (information_4 & 0x1F)  <<  9;
	value =3D value & ~0x1FF <<  0 | (information_5 & 0x1FF) <<  0;

	information_1 =3D value >> 26 & 0x3F;
	information_2 =3D value >> 22 & 0x0F;
	information_3 =3D value >> 14 & 0xFF;
	information_4 =3D value >>  9 & 0x1F;
	information_5 =3D value >>  0 & 0x1FF;

Regarding masks, the following should be memorised:

	Hex	Binary

	0	0000
	1	0001
	3	0011
	7	0111
	F	1111

	F	1111
	E	1110
	C	1100
	8	1000
	0	0000

--=20
Glynn Clements <glynn@gclements.plus.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
