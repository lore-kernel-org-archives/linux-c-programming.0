From: Jonathan Isom <jeisom@gmail.com>
Subject: Re: same pid ?
Date: Thu, 10 Feb 2011 17:26:46 -0600
Message-ID: <AANLkTin7D6yHCVGVVie0jY7o68FC+pkFAk2XWvHwFZz+@mail.gmail.com>
References: <AANLkTincdyMFR2Yb-HVvKmqoVTyTvSXweM5K_WLzFijC@mail.gmail.com>
 <AANLkTim1woaCE=eMNZFSOjAOOm9XJJ_OVobSoGTKnq_o@mail.gmail.com>
 <op.vqosn2a93l0zgt@mnazarewicz.zrh.corp.google.com> <AANLkTikuVajDt1PmQgk=97jk-+8Aei=yg4HCrjJP9JHc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=mVcCFFDjluk2dI1QhOt5pkUZFZPn/fpk+7dWMosRDRg=;
        b=F7TWVyYoF9kmd3XxniNao12DAYoK7GXcFOGNLSpl3j+aaOE1zdiCnxzdroIk+L1PzU
         dZMXJcxWcvUSSo4Sfe3oocJ5NyKLpTejE8bz2B0rneGwkZ+JVq1p+R1pfVRqAbSYmYgC
         Qoaj9AmATjImu/E+KE40SrP3lNz0S2eJTZ+ME=
In-Reply-To: <AANLkTikuVajDt1PmQgk=97jk-+8Aei=yg4HCrjJP9JHc@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: Michal Nazarewicz <mina86@mina86.com>, linux-c-programming@vger.kernel.org

On Thu, Feb 10, 2011 at 12:09 PM, ratheesh k <ratheesh.ksz@gmail.com> w=
rote:
> 2011/2/10 Michal Nazarewicz <mina86@mina86.com>:
>> On Thu, 10 Feb 2011 12:37:25 +0100, ratheesh k <ratheesh.ksz@gmail.c=
om>
>> wrote:
>>>
>>> i created two threads with pthread library. But both threads return=
s
>>> same pid with getpid() function. ???
>>
>> PID is a Process ID. =A0All threads in given process have the same P=
ID.
>>
>
> pthread uses clone system call. doen't it ? if so, please see - man c=
lone
>
>
> =A0CLONE_PID (obsolete)
> =A0 =A0 =A0 =A0 =A0 =A0 If =A0CLONE_PID is set, the child process is =
created with the same
> =A0 =A0 =A0 =A0 =A0 =A0 process ID as the calling process. =A0This is=
 good for hacking the
> =A0 =A0 =A0 =A0 =A0 =A0 system, =A0but =A0otherwise of not much use. =
=A0Since 2.3.21 this flag
> =A0 =A0 =A0 =A0 =A0 =A0 can be specified only by the system boot proc=
ess =A0(PID =A00). =A0 It
> =A0 =A0 =A0 =A0 =A0 =A0 disappeared in Linux 2.5.16.
>
>

Newer distros use Native POSIX Thread Library (NPTL).  They return the =
same pid.


>
>
>
>
>
>> --
>> Best regards, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 _ =A0 =A0 _
>> .o. | Liege of Serenly Enlightened Majesty of =A0 =A0 o' \,=3D./ `o
>> ..o | Computer Science, =A0Michal "mina86" Nazarewicz =A0(o o)
>> ooo +-<email/jid: mnazarewicz@google.com>--------ooO--(_)--Ooo--
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
ASUS M4A78 PRO motherboard
Athlon II X4 640 Processor
4 Gigabytes of DDR2-800
Galaxy GTX 465=A0Graphics adapter
KWorld ATSC 110 TV Capture Card
KWorld ATSC 115 TV Capture Card
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
