From: Ben Rosenberg <scdlbx@gmail.com>
Subject: Re: Help on bit operation
Date: Fri, 28 Aug 2009 12:58:00 -0700
Message-ID: <ca4725240908281258v4715038m1243ebf84b9f7ed9@mail.gmail.com>
References: <34e1241d0908261602k4d07d422o7ea69b606210701a@mail.gmail.com>
	 <19093.53306.413232.981055@cerise.gclements.plus.com>
	 <34e1241d0908262343p1cd899a8o4c9e956371d570b3@mail.gmail.com>
	 <34e1241d0908272152r32591e52wb1885433edb9a9ff@mail.gmail.com>
	 <ca4725240908281002h4fc32b39t23fb84518bd0ab6a@mail.gmail.com>
	 <34e1241d0908281139k66e8102dy94b70e9fcfd86763@mail.gmail.com>
	 <34e1241d0908281140t65d6eb8cq371ce68cefc2f531@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=N17NDyGLX5b/s2VQyZn3ZpDa5m0u79n0SagHviYY2tw=;
        b=cFpuyavLI7VwFI4BOvYhblnbauiHam3YcPvAttRdRDUlATbODH+yAxWSP1o/UugATK
         bahNk2N8up7sqwmyQiunb2cWhmhtzBuuMUggBDbVZ2ruj3A/XFiAy+KUrFwMMmpYBldz
         29L564nukkBG/XJmg5aoBCzxvUWBsiuH768qA=
In-Reply-To: <34e1241d0908281140t65d6eb8cq371ce68cefc2f531@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Fri, Aug 28, 2009 at 11:40 AM, Randi Botse<nightdecoder@gmail.com> w=
rote:
> Ben, after assign all bitfield struct member, how to pack them to be =
a
> 32bit integer value?
>
> DEC =A0 =A0 =A0BIN
> 43 =A0 =A0 =A0 =A0101011 =A0 =A0 =A0 =A0-> foo.a (6 bit)
> 11 =A0 =A0 =A0 =A01011 =A0 =A0 =A0 =A0 =A0 =A0-> foo.b (4 bit)
> 120 =A0 =A0 =A001111000 =A0 =A0-> foo.c (8 bit)
> 30 =A0 =A0 =A0 =A011110 =A0 =A0 =A0 =A0 =A0-> foo.d (5 bit)
> 418 =A0 =A0 =A0110100010 =A0-> foo.e (9 bit)
>
> the bit pattern is : 10101110110111100011110110100010 or 2933800354 i=
n
> decimal, is this possible?
>
> while with masking and shift i can pack them with:
> ((foo.a & 0x3f) << 26) | ((foo.b & 0xf) << 22) | ((foo,c & 0xff) <<
> 14) | ((foo.d & 0x1f) << 9) | (foo.e & 0x1ff)
>
>

The bitfield struct is already packed, you don't need to do anything
else. Just assign values to the different parts.

Ben
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
