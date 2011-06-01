From: Zhongye Jia <jia.zhongye@gmail.com>
Subject: Re: macro to print filename
Date: Thu, 2 Jun 2011 02:45:06 +0800
Message-ID: <BANLkTinEDc3DLbaFezBxL=QQ0Nie83+NAQ@mail.gmail.com>
References: <BANLkTi=TrKOcaQ4QcEHKOsqLaAPxL9f9Kw@mail.gmail.com> <op.vweraiul3l0zgt@mnazarewicz-glaptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=lTalcRtY7TZ/ZcclYr67j5dPECDnjzJuV1YxEktd/h4=;
        b=aH4VwH/Ey7SEklOo11bo04BkgZIOU107tYG+BFPa4g0kYe3cbCcfSsPm/0Zn0MtyJP
         rY/SpuR+G5o8ZXW3F/Wi2dUea6qyMW9WKz/ZQD8Wqf80BrIjSUpauRWY3HQrs9bZKvsQ
         jGxWAqxcCs2sKSXQ9IX2vCiqUmpB2/1zzuAkA=
In-Reply-To: <op.vweraiul3l0zgt@mnazarewicz-glaptop>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Michal Nazarewicz <mina86@mina86.com>
Cc: linux-c-programming@vger.kernel.org

I do not think this can be done in *compiling* time, neither macro in
c nor template in c++, so would you be so kind to offer the solution
by using template or just give  some tips? Since I'm not that good at
c++ :)

On Thu, Jun 2, 2011 at 01:38, Michal Nazarewicz <mina86@mina86.com> wro=
te:
> On Wed, 01 Jun 2011 18:07:42 +0200, ratheesh kannoth
> <ratheesh.ksz@gmail.com> wrote:
>>
>> __FILE__ macro prints relative path name of the file.
>
> Not prints but expands to but we know what you mean. ;)
>
>> I need only filename. How to extract this?
>>
>> I don't want to use any string library - since it includes more
>> Processing and needs to store the character array in executable.
>> Is there any method at preprocessing level to do this.
>
> I can say with 99,9% confidence that there is no such thing in C
> standard and 99% that there is no such thing in GCC.
>
> You probably can do that in C++ with templates if that's any
> constellation.
>
> --
> Best regards, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 _ =C2=A0 =C2=A0 _
> .o. | Liege of Serenely Enlightened Majesty of =C2=A0 =C2=A0 =C2=A0o'=
 \,=3D./ `o
> ..o | Computer Science, =C2=A0Michal "mina86" Nazarewicz =C2=A0 =C2=A0=
(o o)
> ooo +-----<email/xmpp: mnazarewicz@google.com>-----ooO--(_)--Ooo--
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
