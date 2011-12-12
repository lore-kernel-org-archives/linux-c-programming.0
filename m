From: Renjith Gopinadhan <Renjith.Gopinadhan@Wolfsonmicro.com>
Subject: RE: header files missing
Date: Mon, 12 Dec 2011 15:04:55 +0000
Message-ID: <75E4E6EA13D477499AE4AE34E8AF042005AD4ECA9D@EXCMB2.wolfsonmicro.main>
References: <CAGZFCEGxdS6Wbye+jy_HCpv-OquSNX6gKFLh3xDK-Fwfn1T3ag@mail.gmail.com> 
    <4EE610E8.7010001@maxim-ic.com> 
    <CAGZFCEFiYf88nhEeYUGmHOJ5TXXgC3F5WOC6xx2CsofE5GEL9Q@mail.gmail.com> 
    <CACL2Z18JF+uke02_+SNpGB71UR2=jruMf=8X3oCK-6W7E9Qk0g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <CACL2Z18JF+uke02_+SNpGB71UR2=jruMf=8X3oCK-6W7E9Qk0g@mail.gmail.com>
Content-Language: en-US
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jonathan Isom <jeisom@gmail.com>, ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc: Jean-Marc Simohand <jeanmarc.simohand@maxim-ic.com>, linux-newbie <linux-newbie@vger.kernel.org>, "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

Surely, he has glibc installed, but the issue is  that anything to do w=
ith the PATH variable or anyother environment variable settings?

-----Original Message-----
=46rom: linux-newbie-owner@vger.kernel.org [mailto:linux-newbie-owner@v=
ger.kernel.org] On Behalf Of Jonathan Isom
Sent: 12 December 2011 15:01
To: ratheesh kannoth
Cc: Jean-Marc Simohand; linux-newbie; linux-c-programming@vger.kernel.o=
rg
Subject: Re: header files missing

On Mon, Dec 12, 2011 at 8:38 AM, ratheesh kannoth <ratheesh.ksz@gmail.c=
om> wrote:
> On Mon, Dec 12, 2011 at 8:04 PM, Jean-Marc Simohand=20
> <jeanmarc.simohand@maxim-ic.com> wrote:
>>
>> Hi Ratheesh,
>> did you install the "build-essential package" ?
>>
>> sudo apt-get install build-essential
>>
>
> =A0i don't have apt-get or yum. its a custom compiled kernel.
Hi
  What distro are you running? those header are part glibc & glibc-dev =
on many distros.

Later

Jonathan

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
> To unsubscribe from this list: send the line "unsubscribe=20
> linux-c-programming" in the body of a message to=20
> majordomo@vger.kernel.org More majordomo info at =A0
> http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-newbie"=
 in the body of a message to majordomo@vger.kernel.org More majordomo i=
nfo at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at http://www.linux-learn.org/faqs

Privacy & Confidentiality Notice
-------------------------------------------------
This message and any attachments contain privileged and confidential in=
formation that is intended solely for the person(s) to whom it is addre=
ssed. If you are not an intended recipient you must not: read; copy; di=
stribute; discuss; take any action in or make any reliance upon the con=
tents of this message; nor open or read any attachment. If you have rec=
eived this message in error, please notify us as soon as possible on th=
e following telephone number and destroy this message including any att=
achments. Thank you.
-------------------------------------------------
Wolfson Microelectronics plc
Tel: +44 (0)131 272 7000
=46ax: +44 (0)131 272 7001
Web: www.wolfsonmicro.com

Registered in Scotland

Company number SC089839

Registered office:=20

Westfield House, 26 Westfield Road, Edinburgh, EH11 2QB, UK
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
