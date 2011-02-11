From: =?ISO-2022-JP?B?U3RldmUgR3JhZWdlcnQgKBskQiU5JUYlIyE8JVYbKEIp?= 
	<graegerts@gmail.com>
Subject: Re: same pid ?
Date: Fri, 11 Feb 2011 06:12:06 +0100
Message-ID: <AANLkTinNi8QLzALkr0c=F6t=26-c-g-_bW1=k9yNkoR+@mail.gmail.com>
References: <AANLkTincdyMFR2Yb-HVvKmqoVTyTvSXweM5K_WLzFijC@mail.gmail.com>
	<AANLkTim1woaCE=eMNZFSOjAOOm9XJJ_OVobSoGTKnq_o@mail.gmail.com>
	<op.vqosn2a93l0zgt@mnazarewicz.zrh.corp.google.com>
	<AANLkTikuVajDt1PmQgk=97jk-+8Aei=yg4HCrjJP9JHc@mail.gmail.com>
	<AANLkTin7D6yHCVGVVie0jY7o68FC+pkFAk2XWvHwFZz+@mail.gmail.com>
	<AANLkTinJHh5D+4nW-hVcdv8Ciy6qP7Yi2DG9UjKf0aDR@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=mKkU/IU2ty0Ki7oEoSiYR6kbEI8PbuO29nHTijKdNBY=;
        b=ANQW8JXXLyBFVhvD9x261doWizNVe7luecQ5onH1CXJfkBYRyl7UTYHizGnudSom0s
         kNJKwoTQLw2HNyFDWzHJS67h7k09j8Njtq7mk+6wHXafdMvUIW0T1vWO4jVWC0naaUj1
         ci6Pt4b5rwFCOUzbuFDfuubw8m8irfl5U36GQ=
In-Reply-To: <AANLkTinJHh5D+4nW-hVcdv8Ciy6qP7Yi2DG9UjKf0aDR@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: Jonathan Isom <jeisom@gmail.com>, Michal Nazarewicz <mina86@mina86.com>, linux-c-programming@vger.kernel.org

On Fri, Feb 11, 2011 at 03:18, ratheesh k <ratheesh.ksz@gmail.com> wrot=
e:
>>On Fri, Feb 11, 2011 at 4:56 AM, Jonathan Isom <jeisom@gmail.com> wro=
te:
>> Newer distros use Native POSIX Thread Library (NPTL). =A0They return=
 the same pid.
>
> if linux treats every thing as task (both thread and process ) and
> CLONE_PID flag is obsolete, i expected unique pid.

POSIX.1 requires threads to share a couple of attributes (mainly
process attributes) like the process ID, open FDs and many others.
What you are referring to ("everything as task") is the fact that each
thread is associated with a single scheduling entity within the kernel
implementing a 1:1 mapping.  Yet, threads created within the same
process share a single PID.

You are advised to consult pthreads(7) to make yourself familiar with t=
he topic.

Steve
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
