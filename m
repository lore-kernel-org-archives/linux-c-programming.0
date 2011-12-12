From: Jonathan Isom <jeisom@gmail.com>
Subject: Re: header files missing
Date: Mon, 12 Dec 2011 09:01:07 -0600
Message-ID: <CACL2Z18JF+uke02_+SNpGB71UR2=jruMf=8X3oCK-6W7E9Qk0g@mail.gmail.com>
References: <CAGZFCEGxdS6Wbye+jy_HCpv-OquSNX6gKFLh3xDK-Fwfn1T3ag@mail.gmail.com>
 <4EE610E8.7010001@maxim-ic.com> <CAGZFCEFiYf88nhEeYUGmHOJ5TXXgC3F5WOC6xx2CsofE5GEL9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=lPpNQQWw1gpmet1SOTdLSpBA9j2pClo2lqa+QXuql6c=;
        b=lvFDEqRhAIvPB2KnkUUyz1PZTYVaOt4uSnPHLKQx03rdwcsHkDxZ1za5F/Np5FDyoX
         EhW4HZhmG7NiZXNHEB8fa9tQi7kwoWK8uLeUP3yPFGhuWRNnTIdg0Ik774Vn4fbcrEqv
         3Vdsdu75fBqphgkfzELKCIH3mXViqgz6GHLtk=
In-Reply-To: <CAGZFCEFiYf88nhEeYUGmHOJ5TXXgC3F5WOC6xx2CsofE5GEL9Q@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc: Jean-Marc Simohand <jeanmarc.simohand@maxim-ic.com>, linux-newbie <linux-newbie@vger.kernel.org>, "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

On Mon, Dec 12, 2011 at 8:38 AM, ratheesh kannoth
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
Hi
  What distro are you running? those header are part glibc & glibc-dev
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
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
