From: Randi Botse <nightdecoder@gmail.com>
Subject: Re: C Question
Date: Tue, 25 May 2010 17:49:54 +0700
Message-ID: <AANLkTikPPM6DhdUB6bTujgBgg9pDmuJCUVRnn3uvbULx@mail.gmail.com>
References: <AANLkTimNataepVFhtn4kSv_kGv1wTBHMAOgeZTK0hgW-@mail.gmail.com>
	 <AANLkTinLnlZjmZ4bm78hWiOElWaqEQP0aJbmQ6k7lvw0@mail.gmail.com>
	 <AANLkTinTu94E7guvzjySpGjht2Hjw4aop4vRIVpHo9UL@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=3ZsO9QQS0FsCkuJClmkBQ+/u10tbp1GtVfqnlru1vQQ=;
        b=bV9pvh2jxMVV1Ao82qbixD+VXnn+xAJbxFD7XuNBdiKpN2I2jfYQCpi6F9d5N7SquV
         eGkqxifX/UV2kM69Y6War47jVYdD9TTSzZHmQ3e2LNfuUZQQv2r5GOLzfEnNwYiQBIpR
         fwNfxvxYA/umb9Wr7z0rPFRCjeorlW8V0MJBQ=
In-Reply-To: <AANLkTinTu94E7guvzjySpGjht2Hjw4aop4vRIVpHo9UL@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Guillaume Leconte <guillaume.leconte@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Yes, that's i was talking about, i got the idea, gcc even let me
declared "unordered" subobject index like this..

const char *my_strings[] =3D {
            [0] =3D "string1",
            [2] =3D "string2",
            [1] =3D "string3",
            etc...
}

Actually, this is my first time seeing codes like this, it was strange
for me :p, many thanks for let me know!

- Randi,


On Tue, May 25, 2010 at 5:24 PM, Guillaume Leconte
<guillaume.leconte@gmail.com> wrote:

> I think he is talking about the [VIRT_NONE] =3D ... style, which is C=
99.
>
>>
>> > /* virtualization types */
>> > enum {
>> > =A0 =A0 =A0 =A0VIRT_NONE =A0 =A0 =A0 =3D 0,
>> > =A0 =A0 =A0 =A0VIRT_PARA,
>> > =A0 =A0 =A0 =A0VIRT_FULL
>> > };
>> > const char *virt_types[] =3D {
>> > =A0 =A0 =A0 =A0[VIRT_NONE] =A0 =A0 =3D N_("none"),
>> > =A0 =A0 =A0 =A0[VIRT_PARA] =A0 =A0 =3D N_("para"),
>> > =A0 =A0 =A0 =A0[VIRT_FULL] =A0 =A0 =3D N_("full")
>> > };
>
> It is equivalent to:
>
> const char *virt_types[3];
>
> virt_types[VIRT_NONE] =3D N_("none");
> virt_types[VIRT_PARA] =3D N_("para");
> virt_types[VIRT_FULL] =3D N_("full");
>
>
>>
>> > --
>> > To unsubscribe from this list: send the line "unsubscribe
>> > linux-c-programming" in
>> > the body of a message to majordomo@vger.kernel.org
>> > More majordomo info at =A0http://vger.kernel.org/majordomo-info.ht=
ml
>> >
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-c-programming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
>
>
> --
> =AB I've seen things you people wouldn't believe. =A0Attack ships on =
fire
> off the shoulder of Orion. =A0I watched C-beams glitter in the dark n=
ear
> the Tanhauser gate. =A0All those moments will be lost in time like te=
ars
> in rain. =A0Time to die. =BB
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
