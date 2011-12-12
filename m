From: Jean-Marc Simohand <jeanmarc.simohand@maxim-ic.com>
Subject: Re: header files missing
Date: Mon, 12 Dec 2011 16:03:43 +0100
Message-ID: <4EE617CF.9050307@maxim-ic.com>
References: <CAGZFCEGxdS6Wbye+jy_HCpv-OquSNX6gKFLh3xDK-Fwfn1T3ag@mail.gmail.com> <4EE610E8.7010001@maxim-ic.com> <CAGZFCEFiYf88nhEeYUGmHOJ5TXXgC3F5WOC6xx2CsofE5GEL9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-newbie-owner@vger.kernel.org>
In-Reply-To: <CAGZFCEFiYf88nhEeYUGmHOJ5TXXgC3F5WOC6xx2CsofE5GEL9Q@mail.gmail.com>
Sender: linux-newbie-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc: linux-newbie <linux-newbie@vger.kernel.org>, "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

Le 12/12/2011 15:38, ratheesh kannoth a =E9crit :
> On Mon, Dec 12, 2011 at 8:04 PM, Jean-Marc Simohand
> <jeanmarc.simohand@maxim-ic.com>  wrote:
>>
>> Hi Ratheesh,
>> did you install the "build-essential package" ?
>>
>> sudo apt-get install build-essential
>>
>
>   i don't have apt-get or yum. its a custom compiled kernel.
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

Ok,
If your custom kernel is on an embedded target you can use ucLibc. If=20
you are runing on a host (a PC) you can download Libc6.

But there is a but... these headers are for userland not for kernel dev=
=2E
for the kernel dev, download you kernel headers it's something like
linux-headers.2.6.xx-yy

Note: for embedded systems you can use buildroot which will help you to=
=20
download & install all that you need.



--=20
Best Regards,
Jean-Marc Simohand
Sr. MTS Applications
Maxim Integrated Products
ZI Athelia IV - Le Forum, Bat A
Quartier Roumagoua
13600 La Ciotat - France
Phone +33 (0)4.42.98.18.25


--
To unsubscribe from this list: send the line "unsubscribe linux-newbie"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at http://www.linux-learn.org/faqs
