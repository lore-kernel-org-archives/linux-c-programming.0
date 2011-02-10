From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: same pid ?
Date: Thu, 10 Feb 2011 23:39:01 +0530
Message-ID: <AANLkTikuVajDt1PmQgk=97jk-+8Aei=yg4HCrjJP9JHc@mail.gmail.com>
References: <AANLkTincdyMFR2Yb-HVvKmqoVTyTvSXweM5K_WLzFijC@mail.gmail.com>
	<AANLkTim1woaCE=eMNZFSOjAOOm9XJJ_OVobSoGTKnq_o@mail.gmail.com>
	<op.vqosn2a93l0zgt@mnazarewicz.zrh.corp.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=Si9Z3xBfELzpn+5x+Hk6ajdgipMsZE7e2Phe5yqcP1s=;
        b=uVWhWldawrywy5nunrAzZKmt2dLgZcVBI36/yclp4cWcxdl1oqmsxhLwdpt2n118nX
         FR5uhnXoe0xSVNWwjkvpADB2Vf2VoLczv1eEGtvXK5nCDBtpuVNuYVaT5F0XLqd7rga1
         9rAliTihN/YNLK+cPn+lUNTSlYEniUymXWGfI=
In-Reply-To: <op.vqosn2a93l0zgt@mnazarewicz.zrh.corp.google.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michal Nazarewicz <mina86@mina86.com>
Cc: linux-c-programming@vger.kernel.org

2011/2/10 Michal Nazarewicz <mina86@mina86.com>:
> On Thu, 10 Feb 2011 12:37:25 +0100, ratheesh k <ratheesh.ksz@gmail.co=
m>
> wrote:
>>
>> i created two threads with pthread library. But both threads returns
>> same pid with getpid() function. ???
>
> PID is a Process ID. =A0All threads in given process have the same PI=
D.
>

pthread uses clone system call. doen't it ? if so, please see - man clo=
ne


 CLONE_PID (obsolete)
             If  CLONE_PID is set, the child process is created with th=
e same
             process ID as the calling process.  This is good for hacki=
ng the
             system,  but  otherwise of not much use.  Since 2.3.21 thi=
s flag
             can be specified only by the system boot process  (PID  0)=
=2E   It
             disappeared in Linux 2.5.16.








> --
> Best regards, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 _ =A0 =A0 _
> .o. | Liege of Serenly Enlightened Majesty of =A0 =A0 o' \,=3D./ `o
> ..o | Computer Science, =A0Michal "mina86" Nazarewicz =A0(o o)
> ooo +-<email/jid: mnazarewicz@google.com>--------ooO--(_)--Ooo--
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
