From: Zhongye Jia <jia.zhongye@gmail.com>
Subject: Re: macro to print filename
Date: Thu, 2 Jun 2011 21:39:52 +0800
Message-ID: <BANLkTin7xYkdGqUKFqUp2hu3oktBxOzBgg@mail.gmail.com>
References: <BANLkTi=TrKOcaQ4QcEHKOsqLaAPxL9f9Kw@mail.gmail.com>
 <op.vweraiul3l0zgt@mnazarewicz-glaptop> <BANLkTinEDc3DLbaFezBxL=QQ0Nie83+NAQ@mail.gmail.com>
 <op.vwevg1xb3l0zgt@mnazarewicz-glaptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=9LZF0pfP2EAZPEqvTlJyP7rkDJSkMJz/3QhgDqgT2W4=;
        b=gBT32HZrJcZ8qEWR1wSZm8eALMlEFtzeggp8X+2LmltDdidJx1yQbxBtqun/56zYDv
         uNzkRQA+FHZDDMF/OkWAHZ43Z2pcfbHPrDt6JICmbx6PFBgQL6aWajsFvf4DvGsilLun
         631d79D0RKS4Hqrjoh0ihrhyBHckxeGR/4mnw=
In-Reply-To: <op.vwevg1xb3l0zgt@mnazarewicz-glaptop>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Michal Nazarewicz <mina86@mina86.com>
Cc: linux-c-programming@vger.kernel.org

thanks very much! it works very well only except that the
initialization should be placed out of the struct. the compiling time
computation in c++ is really amazing.

2011/6/2 Michal Nazarewicz <mina86@mina86.com>:
> On Wed, 01 Jun 2011 20:45:06 +0200, Zhongye Jia <jia.zhongye@gmail.co=
m>
> wrote:
>>
>> I do not think this can be done in *compiling* time, neither macro i=
n
>> c nor template in c++, so would you be so kind to offer the solution
>> by using template or just give =C2=A0some tips? Since I'm not that g=
ood at
>> c++ :)
>
> I was thinking along the lines of:
>
> template<unsigned offset>
> struct _filename {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0static const char *const val =3D __FILE__[=
offset] =3D=3D '/'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0? __FILE__ + o=
ffset + 1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: _filename<of=
fset-1>::val;
> };
>
> template<>
> struct _filename<0> {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0static const char *const val =3D __FILE__;
> };
>
> static const char *const filename =3D _filename<sizeof(__FILE__) - 1>=
;
>
> I'm a bit rusty so I dunno if that'll work in this format.
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
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
