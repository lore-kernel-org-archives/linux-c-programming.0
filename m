From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Unable set the priority for a pthread through pthread_setschedparam
Date: Wed, 4 Feb 2009 01:49:20 +0000
Message-ID: <18824.62496.424541.675373@cerise.gclements.plus.com>
References: <F5BA82141F7AA94885B9643C77EEA5F2103C73@mail.esntechnologies.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <F5BA82141F7AA94885B9643C77EEA5F2103C73@mail.esntechnologies.co.in>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Srinivas G." <srinivasg@esntechnologies.co.in>
Cc: linux-c-programming@vger.kernel.org


Srinivas G. wrote:

> I have written a small thread program in C using the pthreads. I am able
> to set the threads priority with pthread_setschedparam API when I login
> as ROOT. If I login as a normal user other than ROOT, then the API
> returns the error number 1 (EPERM). 
> 
> Please let me know whether a normal user can set the pthreads priority
> with pthread_setschedparam API or not.

Yes, subject to certain restrictions, which are detailed in the
sched_setscheduler(2) manpage.

In particular, a non-privileged process cannot set the real-time
priority higher than its RLIMIT_RTPRIO setting. You can change this
with an "rtprio" entry in /etc/security/limits.conf (settings are
applied on login, so changes won't affect existing login sessions).

Privilege is determined by the CAP_SYS_NICE capability.

-- 
Glynn Clements <glynn@gclements.plus.com>
