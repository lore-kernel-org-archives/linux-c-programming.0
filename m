From: Randi Botse <nightdecoder@gmail.com>
Subject: Re: C Question
Date: Tue, 1 Jun 2010 07:59:37 -0400
Message-ID: <AANLkTik-eE99MeOMhJKcINHwzyzT_BcduarrMLVWvCDs@mail.gmail.com>
References: <AANLkTimNataepVFhtn4kSv_kGv1wTBHMAOgeZTK0hgW-@mail.gmail.com>
	<87r5l09pjt.fsf@erwin.mina86.com>
	<AANLkTilJ0HUomkRuJwrywTcmVoeAAmQb2MTZbwoT57fn@mail.gmail.com>
	<87r5ktfttj.fsf@erwin.mina86.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=DQf67noUbCBdFBn5MkmqAXHG+rWaO5EdEeHBSJwv01w=;
        b=B3lgVm+9W8RotLccCl9f4aXEE7gWIb4vNfkRmv1EavyqFrpSozOr3c+f/O9/mQiQC3
         0FUWEYp9JIDjSnEql5aOgMhu4WwygGn3aMARDhng2uk6BcNTdgKfBqrI6sGPAcbhBX0O
         xcRPK4yo59j3u26WxY0XA896Ssxb/UZGO2JPM=
In-Reply-To: <87r5ktfttj.fsf@erwin.mina86.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michal Nazarewicz <mina86@tlen.pl>
Cc: linux-c-programming@vger.kernel.org

That's clear now, i was though the 'unindexed' strings (in this case
index 1, 2, 3, and 5) remains unintialized (not initialized to NULL).

Thanks very much.

Randi,

2010/5/30 Michal Nazarewicz <mina86@tlen.pl>:
> Randi Botse <nightdecoder@gmail.com> writes:
>> Yes, the N_(x) macro used for localization that i discard in my ques=
tion.
>>
>> Sorry but, i just having another question, consider this code:
>>
>> const char *my_strings[] =3D {
>> =A0 =A0 [0] =3D "index0",
>> =A0 =A0 [4] =3D "index4",
>> =A0 =A0 [6] =3D "index6"
>> };
>
> NULLs will be written at indexes 1, 2, 3 and 5. =A0There will be tota=
l of
> 7 pointers (the last one will point to "index6").
>
> --
> Best regards, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 _ =A0 =A0 _
> =A0.o. | Liege of Serenly Enlightened Majesty of =A0 =A0 =A0o' \,=3D.=
/ `o
> =A0..o | Computer Science, =A0Michal "mina86" Nazarewicz =A0 (o o)
> =A0ooo +--<mina86-tlen.pl>--<jid:mina86-jabber.org>--ooO--(_)--Ooo--
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
