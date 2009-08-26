From: Akos Marton <makos999@gmail.com>
Subject: Re: Help on bit operation
Date: Thu, 27 Aug 2009 01:33:53 +0200
Message-ID: <a913862f0908261633v1fd747acvf5d1ac448cc803db@mail.gmail.com>
References: <34e1241d0908261602k4d07d422o7ea69b606210701a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=dtKo+sd80QjKx85Z4gsV3fsvgD0TiQmLoLB7dtro/Vk=;
        b=KFsLEhuhCPq0cmn0D8xmkIr7GgQW8tORZduJ1EGqe2pK+gBeSxxazqc7jDiPKIka71
         FawAX131/ane9WZtfoRLQOFZphkqFIF8c19liA54PNrDc4Hj8z5148CrcvRte8eaBa3u
         nlmOLaLxa7on1lQlni5k7mqWDUxg4ksDmRIhY=
In-Reply-To: <34e1241d0908261602k4d07d422o7ea69b606210701a@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Hello Randi,

I suppose for you the bitfields is useful:
struct {
  int information_1: 6;
  int information_2: 4;
  int information_3: 8;
  int information_4: 5;
  int information_5: 9;
};
This solution is reduce the usage of memory, but needs more
computation in general C programming.
May there another solution using 'union {};' ?

mAkos

On Thu, Aug 27, 2009 at 1:02 AM, Randi Botse<nightdecoder@gmail.com> wr=
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
People seldom notice clothes, if you wear a big smile.
http://counter.li.org/
OLVASD: http://napirajz.hu
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
