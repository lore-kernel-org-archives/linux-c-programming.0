From: Javier Martinez Canillas <martinez.javier@gmail.com>
Subject: Re: header files missing
Date: Mon, 12 Dec 2011 15:59:16 +0100
Message-ID: <CAAwP0s08xMLYrp2X0_4ktx+9apEYz5HfTCpT=fmrwnmcO7iULA@mail.gmail.com>
References: <CAGZFCEGxdS6Wbye+jy_HCpv-OquSNX6gKFLh3xDK-Fwfn1T3ag@mail.gmail.com>
 <4EE610E8.7010001@maxim-ic.com> <CAGZFCEFiYf88nhEeYUGmHOJ5TXXgC3F5WOC6xx2CsofE5GEL9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=dm2/y4N2eQ0zSufOpr7nblAfAnNu1Po6kRM8InDiDqE=;
        b=GPI3qOuWHd5OUY4Xlu8wnyTKEi6paSaG92gTp32itqb9MmAT2i5Tc0FDhbkn4+g30v
         nWfO2c6HrDgQiIkYd7kJYFBh/U00EuWmAb5P7Sw1oA/EvhFmSIioUZEbXdp1grWLGBxm
         /75yNY1DxCJy+ukU3JsWEPtkly+kaNxI6aEs0=
In-Reply-To: <CAGZFCEFiYf88nhEeYUGmHOJ5TXXgC3F5WOC6xx2CsofE5GEL9Q@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc: Jean-Marc Simohand <jeanmarc.simohand@maxim-ic.com>, linux-newbie <linux-newbie@vger.kernel.org>, "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

On Mon, Dec 12, 2011 at 3:38 PM, ratheesh kannoth
<ratheesh.ksz@gmail.com> wrote:
> On Mon, Dec 12, 2011 at 8:04 PM, Jean-Marc Simohand
> <jeanmarc.simohand@maxim-ic.com> wrote:
>>
>> Hi Ratheesh,
>> did you install the "build-essential package" ?
>>
>> sudo apt-get install build-essential
>>
>
> =C2=A0i don't have apt-get or yum. its a custom compiled kernel.
>

I think you are mixing concepts here. stdio.h and others are ANSI C
user-space library headers. These comes with a C library like glibc.
The kernel has nothing to do about it. Unless you want to compile
user-space applications that use kernel headers.

Best regards,

--=20
Javier Mart=C3=ADnez Canillas
(+34) 682 39 81 69
Barcelona, Spain
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
