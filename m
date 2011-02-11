From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: same pid ?
Date: Fri, 11 Feb 2011 14:32:51 +0530
Message-ID: <AANLkTimCJCePy_va9D=xMz1t20hq3zHT5DWaaeEiKCpr@mail.gmail.com>
References: <AANLkTincdyMFR2Yb-HVvKmqoVTyTvSXweM5K_WLzFijC@mail.gmail.com>
	<AANLkTim1woaCE=eMNZFSOjAOOm9XJJ_OVobSoGTKnq_o@mail.gmail.com>
	<op.vqosn2a93l0zgt@mnazarewicz.zrh.corp.google.com>
	<AANLkTikuVajDt1PmQgk=97jk-+8Aei=yg4HCrjJP9JHc@mail.gmail.com>
	<AANLkTin7D6yHCVGVVie0jY7o68FC+pkFAk2XWvHwFZz+@mail.gmail.com>
	<AANLkTinJHh5D+4nW-hVcdv8Ciy6qP7Yi2DG9UjKf0aDR@mail.gmail.com>
	<AANLkTinNi8QLzALkr0c=F6t=26-c-g-_bW1=k9yNkoR+@mail.gmail.com>
	<AANLkTimuBfJUTiL_gu8-me9ViVvNBt5DYG5ZwOS8+BKg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=blOmXHT6505Zex/BJjxIhnYiyxUrUs3XFddDdDFFAyA=;
        b=CrhG0UAHnmxTnTvhzyb/durvxJAcuMfb7k6dLcIkUX7k7h3x9q8FyxtCT5bwC9zI/t
         XlvQZWiIJivXULql6bUh1Qbe+Yh3Rjedp4f/1CyDoHGwq8pQU22CUk/eLYDG1pC2j+uV
         BZjTB6wtd7OxSRSHsUZROUJRgYj0wXZypnzQA=
In-Reply-To: <AANLkTimuBfJUTiL_gu8-me9ViVvNBt5DYG5ZwOS8+BKg@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-2022-jp"
To: =?ISO-2022-JP?B?U3RldmUgR3JhZWdlcnQgKBskQiU5JUYlIyE8JVYbKEIp?= <graegerts@gmail.com>
Cc: Jonathan Isom <jeisom@gmail.com>, Michal Nazarewicz <mina86@mina86.com>, linux-c-programming@vger.kernel.org

Just to summarize .....

All processes in a thread group (i.e., different execution contexts of
a process created by calling  clone with CLONE_THREAD as we will see
below) have a uniform thread group id (TGID). If a  process does not
use threads, its PID and TGID are identical.

getpid() returns tgid in pthread implementation. we have uniquid tid
for each thread, this could be returned using gettid().

-Ratheesh

2011/2/11 ratheesh k <ratheesh.ksz@gmail.com>:
> 2011/2/11 Steve Graegert (スティーブ) <graegerts@gmail.com>:
>> POSIX.1 requires threads to share a couple of attributes (mainly
>> process attributes) like the process ID, open FDs and many others.
>> What you are referring to ("everything as task") is the fact that each
>> thread is associated with a single scheduling entity within the kernel
>> implementing a 1:1 mapping.  Yet, threads created within the same
>> process share a single PID.
>>
>
> Thanks steve.
>
> I found some more info. posix thread uses CLONE_THREAD with clone()
> system call.
> i quoted from - man clone
>
> CLONE_THREAD (since Linux 2.4.0-test8)
>    If CLONE_THREAD is set, the child is placed in the same thread
> group as the calling process. To make the remainder of the discussion
> of CLONE_THREAD more readable, the term "thread" is used to refer to
> the processes within a thread group.
>
>    Thread groups were a feature added in Linux 2.4 to support the
> POSIX threads notion of a set of threads that share a single PID.
> Internally, this shared PID is the so-called thread group identifier
> (TGID) for the thread group. Since Linux 2.4, calls to getpid(2)
> return the TGID of the caller.
>
> -Ratheesh
>
>
>
>> On Fri, Feb 11, 2011 at 03:18, ratheesh k <ratheesh.ksz@gmail.com> wrote:
>>>>On Fri, Feb 11, 2011 at 4:56 AM, Jonathan Isom <jeisom@gmail.com> wrote:
>>>> Newer distros use Native POSIX Thread Library (NPTL).  They return the same pid.
>>>
>>> if linux treats every thing as task (both thread and process ) and
>>> CLONE_PID flag is obsolete, i expected unique pid.
>>
>
>> You are advised to consult pthreads(7) to make yourself familiar with the topic.
>>
>> Steve
>>
>
