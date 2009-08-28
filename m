From: Randi Botse <nightdecoder@gmail.com>
Subject: Re: Help on bit operation
Date: Sat, 29 Aug 2009 01:40:56 +0700
Message-ID: <34e1241d0908281140t65d6eb8cq371ce68cefc2f531@mail.gmail.com>
References: <34e1241d0908261602k4d07d422o7ea69b606210701a@mail.gmail.com>
	 <19093.53306.413232.981055@cerise.gclements.plus.com>
	 <34e1241d0908262343p1cd899a8o4c9e956371d570b3@mail.gmail.com>
	 <34e1241d0908272152r32591e52wb1885433edb9a9ff@mail.gmail.com>
	 <ca4725240908281002h4fc32b39t23fb84518bd0ab6a@mail.gmail.com>
	 <34e1241d0908281139k66e8102dy94b70e9fcfd86763@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=nFYbz+bkuW/bKSNN4oyQebIYFeiAQ2ps3PwXJlnlMSc=;
        b=yAIrR2K6ohuRjJzSFQTr6cVDxiHQjMVGZviC9mNUmnBfT5r2iY5pg1R9wQTjYzGNoA
         M39p0wCDsfuGj2/qLV6pXmRHUvykiK0bPiGJe2wx9TyNgNQ8ErY9WRhLAnZvrJjX8/T5
         //DkYBh1uI860PjH4VU/6aik3MPTiWGT+WnaI=
In-Reply-To: <34e1241d0908281139k66e8102dy94b70e9fcfd86763@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Ben, after assign all bitfield struct member, how to pack them to be a
32bit integer value?

DEC =A0 =A0 =A0BIN
43 =A0 =A0 =A0 =A0101011 =A0 =A0 =A0 =A0-> foo.a (6 bit)
11 =A0 =A0 =A0 =A01011 =A0 =A0 =A0 =A0 =A0 =A0-> foo.b (4 bit)
120 =A0 =A0 =A001111000 =A0 =A0-> foo.c (8 bit)
30 =A0 =A0 =A0 =A011110 =A0 =A0 =A0 =A0 =A0-> foo.d (5 bit)
418 =A0 =A0 =A0110100010 =A0-> foo.e (9 bit)

the bit pattern is : 10101110110111100011110110100010 or 2933800354 in
decimal, is this possible?

while with masking and shift i can pack them with:
((foo.a & 0x3f) << 26) | ((foo.b & 0xf) << 22) | ((foo,c & 0xff) <<
14) | ((foo.d & 0x1f) << 9) | (foo.e & 0x1ff)


On Sat, Aug 29, 2009 at 12:02 AM, Ben Rosenberg<scdlbx@gmail.com> wrote=
:

> Glynn's example of bitfields is cleaner and better than this, but I
> put a basic implementation of bitfields using your parameters at the
> end of this message. From my understanding, the way bitfields are
> implemented in C is with bit shifts and masks, so I don't think there
> is a performance difference between the two.
>
> #include <stdio.h>
>
> struct bitfield {
> =A0 =A0unsigned int a:6;
> =A0 =A0unsigned int b:4;
> =A0 =A0unsigned int c:8;
> =A0 =A0unsigned int d:5;
> =A0 =A0unsigned int e:9;
> };
>
> int main(void) {
> =A0 =A0struct bitfield foo;
> =A0 =A0foo.a =3D =A043;
> =A0 =A0foo.b =3D =A011;
> =A0 =A0foo.c =3D 120;
> =A0 =A0foo.d =3D =A030;
> =A0 =A0foo.e =3D 418;
> =A0 =A0printf("%u %u %u %u %u\n",foo.a,foo.b,foo.c,foo.d,foo.e);
> =A0 =A0return 0;
> }
>
>
> Ben
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
