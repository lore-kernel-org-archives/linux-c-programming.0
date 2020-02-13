From: Muni Sekhar <munisekharrms@gmail.com>
Subject: Re: big number(around 100 digits) arithmetic
Date: Thu, 13 Feb 2020 23:41:17 +0530
Message-ID: <CAHhAz+hEEg5_tcEDpFv-r=+HR8k7Myfrh5cp+5QfwB0D_7d5Jw@mail.gmail.com>
References: <CAHhAz+iDUgjBq8vWsf-dPHwbojMwFB8CKORraT84vS3LcBrt0A@mail.gmail.com>
 <20200213175033.GA29073@legohost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OCWZI/Xl2U5d3PRe6uSM6s799/TgWh/3JNdAsdp59uM=;
        b=O0Ik8JevJo2X8Do1jTvNihteztaDBAdMi+91OrJ8paRTRuJBvbmjury+4II6MFRkB9
         saR4WeSTYre2MAN+FaN6T6JXam+oTMf2s6rBMqUI8qrNyc47O+/iqp1NXSINQRPTM+F9
         A3L+gZVxOIKrJNa4gkgljiQuGuz14hB2NzuI5cuCTw2ZffCXnWSmmJ18q+MAGTr2y6Nl
         /2V5A4AvfkII4v2pEgZBcWecblFcsBFXPyaMRyCi/8SxuNEV9mift+fWj5fgWoS6+QY8
         VJNgburxNjHF85JlqtcoQCR1pDzfLSricv974JT/r0ApPjGlxpJhwB/uRk4o3aFVV+H0
         MifA==
In-Reply-To: <20200213175033.GA29073@legohost>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: lego12239@yandex.ru
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

On Thu, Feb 13, 2020 at 11:20 PM <lego12239@yandex.ru> wrote:
>
> On Thu, Feb 13, 2020 at 10:38:44PM +0530, Muni Sekhar wrote:
> > [ Please keep me in CC as I'm not subscribed to the list]
> >
> > HI all,
>
>   Hi.
>
> > I=E2=80=99m looking for a =E2=80=9CC=E2=80=9D program for big number(ar=
ound 100 digits)
> > arithmetic i.e.
> > mltiplication\addition\division\subtraction\exponentiation and
> > modulus, etc.
> >
> > Basically I want to use it for =E2=80=98Extended Euclidean Algorithm=E2=
=80=99 and
> > public-key encryption with the RSA algorithm which typically requires
> > larger integers and it will not fit into C data types. Can someone
> > point me the to the either source code or logical explanation on how
> > to handle big number arithmetic?
>
>   gmp lib - https://gmplib.org ?
Thanks.
>
> --
> =D0=9E=D0=BB=D0=B5=D0=B3 =D0=9D=D0=B5=D0=BC=D0=B0=D0=BD=D0=BE=D0=B2 (Oleg=
 Nemanov)



--=20
Thanks,
Sekhar
