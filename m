From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: same pid ?
Date: Fri, 11 Feb 2011 12:49:23 +0530
Message-ID: <AANLkTimuBfJUTiL_gu8-me9ViVvNBt5DYG5ZwOS8+BKg@mail.gmail.com>
References: <AANLkTincdyMFR2Yb-HVvKmqoVTyTvSXweM5K_WLzFijC@mail.gmail.com>
	<AANLkTim1woaCE=eMNZFSOjAOOm9XJJ_OVobSoGTKnq_o@mail.gmail.com>
	<op.vqosn2a93l0zgt@mnazarewicz.zrh.corp.google.com>
	<AANLkTikuVajDt1PmQgk=97jk-+8Aei=yg4HCrjJP9JHc@mail.gmail.com>
	<AANLkTin7D6yHCVGVVie0jY7o68FC+pkFAk2XWvHwFZz+@mail.gmail.com>
	<AANLkTinJHh5D+4nW-hVcdv8Ciy6qP7Yi2DG9UjKf0aDR@mail.gmail.com>
	<AANLkTinNi8QLzALkr0c=F6t=26-c-g-_bW1=k9yNkoR+@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=5WHxvNBCLOH91vtdQfNpLNFJRb4zL3Ut3bTkfnyNB8k=;
        b=QUf1I1q6v+P5o/HqplX5mYoM9pFEul7TGZFRHdxp2yXwrlpIv5tOuhSsZ+pFQIytDg
         L0i6VYxKwM66R3lP1PMIUghvqfDdeJO885LBY9zHvVxsM64545TSsCedhOFV941SbmVm
         Pf7yl27wHOgYP1LSJG+ZSoWM620c/VXesk5c4=
In-Reply-To: <AANLkTinNi8QLzALkr0c=F6t=26-c-g-_bW1=k9yNkoR+@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-2022-jp"
To: =?ISO-2022-JP?B?U3RldmUgR3JhZWdlcnQgKBskQiU5JUYlIyE8JVYbKEIp?= <graegerts@gmail.com>
Cc: Jonathan Isom <jeisom@gmail.com>, Michal Nazarewicz <mina86@mina86.com>, linux-c-programming@vger.kernel.org

2011/2/11 Steve Graegert (スティーブ) <graegerts@gmail.com>:
> POSIX.1 requires threads to share a couple of attributes (mainly
> process attributes) like the process ID, open FDs and many others.
> What you are referring to ("everything as task") is the fact that each
> thread is associated with a single scheduling entity within the kernel
> implementing a 1:1 mapping.  Yet, threads created within the same
> process share a single PID.
>

Thanks steve.

I found some more info. posix thread uses CLONE_THREAD with clone()
system call.
i quoted from - man clone

CLONE_THREAD (since Linux 2.4.0-test8)
    If CLONE_THREAD is set, the child is placed in the same thread
group as the calling process. To make the remainder of the discussion
of CLONE_THREAD more readable, the term "thread" is used to refer to
the processes within a thread group.

    Thread groups were a feature added in Linux 2.4 to support the
POSIX threads notion of a set of threads that share a single PID.
Internally, this shared PID is the so-called thread group identifier
(TGID) for the thread group. Since Linux 2.4, calls to getpid(2)
return the TGID of the caller.

-Ratheesh



> On Fri, Feb 11, 2011 at 03:18, ratheesh k <ratheesh.ksz@gmail.com> wrote:
>>>On Fri, Feb 11, 2011 at 4:56 AM, Jonathan Isom <jeisom@gmail.com> wrote:
>>> Newer distros use Native POSIX Thread Library (NPTL).  They return the same pid.
>>
>> if linux treats every thing as task (both thread and process ) and
>> CLONE_PID flag is obsolete, i expected unique pid.
>

> You are advised to consult pthreads(7) to make yourself familiar with the topic.
>
> Steve
>
