From: Gery <zaphod001@gmail.com>
Subject: Re: reading elf section data
Date: Mon, 12 Nov 2007 14:11:47 -0500
Message-ID: <4738A573.4060709@gmail.com>
References: <473856E2.5050707@gmail.com>	 <18232.12586.211596.82841@cerise.gclements.plus.com>	 <6a00c8d50711120329g161f6029ta6724d41c291a049@mail.gmail.com>	 <47389D7E.5070508@gmail.com> <6a00c8d50711120407t7c0f39b9g3fb3b45fc630ef31@mail.gmail.com>
Reply-To: zaphod001@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject:references:in-reply-to:content-type:content-transfer-encoding;
        bh=RidOLrZ8qQFY4itCwlOgUlW4LF4OwXZB1Bi5NPce5Yo=;
        b=aehy8biPi3teRpIKRgqMUpW2LbC6SKjOmV+I+LsWPFYy/jqrrz+GAVTZNgoiDUvV7msIni0D6w3R47GIety+e7OojkV+mWh2Mxvw3/xq55u54skw/IXhXK/K92Vy6iROGM+AsYDFG3v4Jacibc5UBSCKWECvCE01/P2XuIkxSE0=
In-Reply-To: <6a00c8d50711120407t7c0f39b9g3fb3b45fc630ef31@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Steve Graegert <graegerts@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Steve Graegert wrote:
> On Nov 12, 2007 7:37 PM, Gery <zaphod001@gmail.com> wrote:
>  =20
>> Steve Graegert wrote:
>>    =20
>>> On Nov 12, 2007 11:55 AM, Glynn Clements <glynn@gclements.plus.com>=
 wrote:
>>>      =20
>>>> Gery wrote:
>>>>
>>>>        =20
>>>>> How to read in human format data from elf section?
>>>>>          =20
>>>> Can you be more specific? What kind of data? What format?
>>>>        =20
>>> I stopped replying to messages like those from the OP.  Demanding h=
elp
>>> without providing a minimum of information is just annoying, but
>>> doing so without any etiquette is simply rude.
>>>
>>>       \Steve
>>>
>>> --
>>>
>>> Steve Gr=E4gert
>>> DigitalEther.de
>>> -
>>> To unsubscribe from this list: send the line "unsubscribe linux-c-p=
rogramming" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>>      =20
>> Just for my understanding :)
>> What is OP?
>> What is it wrong w/ my etiquette?
>> PLease, help me to fix my mistakes.
>>
>>    =20
>
> Hi Gery,
>
> Let's start with a greeting, you'll be welcome and you're done with
> 50% of the "etiquette".
> The OP stands for "original poster" and refers to the thread starter.
> Finally I like to conclude a post with a closing formula or just a
> signature including your name.  That's the second part of the
> "etiquette".
>
> What I mean by rude is that questions like "How to read ELF data?"
> motivates no one to answer as we have to ask for clarification first.
> If you'd have asked "How do I read custom ELF sections added by GCC
> using C?" everyone knows exactly what you want just by being a bit
> more accurate.
>
> Regarding your original question: try readelf first.  It'll probably
> do the trick.
>
> 	\Steve
>
> --
>
> Steve Gr=E4gert
> DigitalEther.de
>
>  =20
Thank you, Steve.

I already tried readelf and even sectiondump utility from=20
elfutils-0.130/tests/
I hope there is a solution w/o coding, but may be not :(

Gery
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
