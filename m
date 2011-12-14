From: Yichao Yu <yyc1992@gmail.com>
Subject: Re: header files missing
Date: Wed, 14 Dec 2011 10:20:29 -0500
Message-ID: <CAMvDr+St9yT=iQh5SAQsd7b=YjX1Q4ErR5OujCwXy1FOrq10Hg@mail.gmail.com>
References: <CAGZFCEGxdS6Wbye+jy_HCpv-OquSNX6gKFLh3xDK-Fwfn1T3ag@mail.gmail.com>
 <4EE610E8.7010001@maxim-ic.com> <CAGZFCEFiYf88nhEeYUGmHOJ5TXXgC3F5WOC6xx2CsofE5GEL9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=mtp7GAaJAT/GkKiKFFGM6bLWD6nXMxKfBE9Q1065BHc=;
        b=qUt2obKo6WLKAQq6NiYAzxQtL83nij5jG5FAhK//YWkmHwPPP+WQsNoZdOHx/mGzRa
         nrZIj1qlbOwyk95WYmhp5/VGSjQK+keIufL+D4PEdRRODdKaOmk2Un8UllQOxSqmueAc
         d1I+093tfGZIf+Tbfg9GM80H5zG88bhMWXzX4=
In-Reply-To: <CAGZFCEFiYf88nhEeYUGmHOJ5TXXgC3F5WOC6xx2CsofE5GEL9Q@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc: Jean-Marc Simohand <jeanmarc.simohand@maxim-ic.com>, linux-newbie <linux-newbie@vger.kernel.org>, "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

On Mon, Dec 12, 2011 at 9:38 AM, ratheesh kannoth
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
> =A0i don't have apt-get or yum. its a custom compiled kernel.

Do you mean u r using LFS system? but in that way you should have
header files installed along with binaries (if you just ./configure &&
make && make install)

Otherwise you should have a package manager (Don't know any "real"
distro that don't have it.)

Are you sure you don't have the header file or the compiler cannot
find it? How did you install glibc?

>
>> --
>> Best Regards,
>> Jean-Marc Simohand
>> Sr. MTS Applications
>> Maxim Integrated Products
>> ZI Athelia IV - Le Forum, Bat A
>> Quartier Roumagoua
>> 13600 La Ciotat - France
>> Phone +33 (0)4.42.98.18.25
>>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
