From: Uday Verma <uday.karan@gmail.com>
Subject: Re: Help on bit operation
Date: Wed, 26 Aug 2009 18:37:57 -0500
Message-ID: <4f2e7cd30908261637n6bf44249yebfaafd54ebe1e21@mail.gmail.com>
References: <34e1241d0908261602k4d07d422o7ea69b606210701a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=qE+/yBW1mcFNZbNwQkW9+RVDCDvBBXLUclAy7XNNy3E=;
        b=vYOG8YmY6tG5jvfuTLSVgSoKdaG05DNfuQ1Mdk7bXkPzccxyt1oI3jcF7ofr16oXrt
         q1ijSq23+ZMtfu5nDKlBkFS2uwwYs/DVfVBkrUPvMV1rtdNGEQtd67FI5zlwmoZtK/gS
         k/HlvGO1C2E1TxxQi1Mo7ePAfeIR+I2inCB2Y=
In-Reply-To: <34e1241d0908261602k4d07d422o7ea69b606210701a@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

If the sizes of your infos is fixed you can do something like this:

info5 =3D packet & 0x1FF;
info4 =3D (packet >> 9) & 0x1F;
=2E. and so on

note that I am masking out unwanted parts of the 32 bit packet using
an all 1s  bit pattern 0x1FF : 1 1111 1111, 0x1F : 1 1111.  in case of
info4, I first need to move the value 9 bits to the right so that 5
bits of info4 form the LSB.

You can form the packet similarly,

unsigned int packet =3D ((info1 & 0x3F) << 26) | ((info2 & 0xF) << 22) =
=2E..

HTH

packet is your single 32-bit integer which has all these infos encoded.

On Wed, Aug 26, 2009 at 6:02 PM, Randi Botse<nightdecoder@gmail.com> wr=
ote:
> Hi, I'm beginner C programmer, i have a problem, i want to store some
> information in a integer, a integer will be 32 bit on my machine, i
> want to have as follow:
>
> 6 bit (information 1) =C2=A0 MSB
> 4 bit (information 2)
> 8 bit (information 3)
> 5 bit (information 4)
> 9 bit (information 5) =C2=A0 LSB
>
> For example i set the informations as follow (in decimal):
>
> information 1 =3D 43 =C2=A0 =C2=A0 =C2=A0 =C2=A0or 101011
> information 2 =3D 11 =C2=A0 =C2=A0 =C2=A0 =C2=A0or 1011
> information 3 =3D 120 =C2=A0 =C2=A0 =C2=A0or 1111000
> information 3 =3D 30 =C2=A0 =C2=A0 =C2=A0 =C2=A0or 11110
> information 4 =3D 418 =C2=A0 =C2=A0 =C2=A0or 110100010
>
> if i join all informations i should get a 32 bit integer valued
> 2935782212 or 01010111011111100011110110100010, then my problem is ho=
w
> to retrieve these informations on bit operation? i want to know what'=
s
> the value of information-2 or information-3, etc directly. =C2=A0And,=
 is
> there any good way to join these informations to be an 32 bit integer=
?
>
> at this time i convert the 32bit integer into binary string, process
> it's with array segment to get all informations then convert them to
> integer,
> to build the 32bit integer, i join all information value into binary
> string (yes, 32 bit of char ;p) join all of them then convert to
> integer.
>
> I know my way is sucks and too far away from COOL thing ;p, =C2=A0i t=
hink
> there are cool way to do this!.
>
> Thanks before!
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>



--=20
Uday
http://soundc.de/
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
