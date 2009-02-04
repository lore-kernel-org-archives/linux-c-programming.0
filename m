From: "Srinivas G." <srinivasg@esntechnologies.co.in>
Subject: RE: Unable set the priority for a pthread through pthread_setschedparam
Date: Wed, 4 Feb 2009 12:01:15 +0530
Message-ID: <F5BA82141F7AA94885B9643C77EEA5F2103CF8@mail.esntechnologies.co.in>
References: <F5BA82141F7AA94885B9643C77EEA5F2103C73@mail.esntechnologies.co.in> <18824.62496.424541.675373@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <18824.62496.424541.675373@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org, Manish Katiyar <mkatiyar@gmail.com>

Glynn Clements wrote:

> Yes, subject to certain restrictions, which are detailed in the
> sched_setscheduler(2) manpage.
> 
> In particular, a non-privileged process cannot set the real-time
> priority higher than its RLIMIT_RTPRIO setting. You can change this
> with an "rtprio" entry in /etc/security/limits.conf (settings are
> applied on login, so changes won't affect existing login sessions).
> 
> Privilege is determined by the CAP_SYS_NICE capability.

Thanks Glynn.

I have tried to set the RLIMIT_RTPRIO to 100 through
/etc/security/limits.conf. It was not defined previously, so I have
defined in the following way.

domain       type    item     value
#@srinivasg  soft    rtprio   100

After adding the above statement, I have restarted the system.

Then, I run my simple thread program. There is no luck. I got the same
error. I have posted the simple thread program in my first email.

What am I missing here? Please advice.

Thanks and Regards,
Srinivas G


 
