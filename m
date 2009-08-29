From: Randi Botse <nightdecoder@gmail.com>
Subject: Re: Help on bit operation
Date: Sat, 29 Aug 2009 14:40:54 +0700
Message-ID: <34e1241d0908290040j3be6c1d8t4370329f07a45c73@mail.gmail.com>
References: <34e1241d0908261602k4d07d422o7ea69b606210701a@mail.gmail.com>
	 <19093.53306.413232.981055@cerise.gclements.plus.com>
	 <34e1241d0908262343p1cd899a8o4c9e956371d570b3@mail.gmail.com>
	 <34e1241d0908272152r32591e52wb1885433edb9a9ff@mail.gmail.com>
	 <ca4725240908281002h4fc32b39t23fb84518bd0ab6a@mail.gmail.com>
	 <34e1241d0908281139k66e8102dy94b70e9fcfd86763@mail.gmail.com>
	 <34e1241d0908281140t65d6eb8cq371ce68cefc2f531@mail.gmail.com>
	 <19096.15296.699625.446036@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=GJw3IE57KNGcvjRniWyk9h+PGYU9GDR3NWD68iNS5jY=;
        b=O035M6TvsUgDoLj4abovBkHIkjmRIthkya+Ud+57UDgZyThlKtYWnGq1A0+cr5A8uH
         ZTnR0G6HzcJOY3uV8soOwG5bP7jfLHwEX3Z5hx5L2plmN6qFT5cRP4I1RMfMO2mYzZhJ
         916XdI5wzWLyOv0hgVG28cdaGFLm+OCefM+tM=
In-Reply-To: <19096.15296.699625.446036@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

everything is clear now!, thanks all for your guides and patience.

    - Randi


On Sat, Aug 29, 2009 at 3:19 AM, Glynn Clements<glynn@gclements.plus.co=
m> wrote:
>
> Randi Botse wrote:
>
>> Ben, after assign all bitfield struct member, how to pack them to be=
 a
>> 32bit integer value?
>
> The structure should be 32 bits wide. If you need the value as a
> uint32_t, either use a union:
>
> =A0 =A0 =A0 =A0union bits_or_int {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct bitfield fields;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uint32_t value;
> =A0 =A0 =A0 =A0};
>
> or a cast, e.g.:
>
> =A0 =A0 =A0 =A0struct bitfield foo;
> =A0 =A0 =A0 =A0...
> =A0 =A0 =A0 =A0uint32_t value =3D *(uint32_t *)&foo;
>
> --
> Glynn Clements <glynn@gclements.plus.com>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
