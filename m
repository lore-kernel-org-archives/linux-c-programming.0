From: Glynn Clements <glynn@gclements.plus.com>
Subject: RE: Unable set the priority for a pthread through pthread_setschedparam
Date: Wed, 4 Feb 2009 23:07:35 +0000
Message-ID: <18826.8119.705709.48276@cerise.gclements.plus.com>
References: <F5BA82141F7AA94885B9643C77EEA5F2103C73@mail.esntechnologies.co.in>
	<18824.62496.424541.675373@cerise.gclements.plus.com>
	<F5BA82141F7AA94885B9643C77EEA5F2103CF8@mail.esntechnologies.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <F5BA82141F7AA94885B9643C77EEA5F2103CF8@mail.esntechnologies.co.in>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Srinivas G." <srinivasg@esntechnologies.co.in>
Cc: linux-c-programming@vger.kernel.org, Manish Katiyar <mkatiyar@gmail.com>


Srinivas G. wrote:

> > Yes, subject to certain restrictions, which are detailed in the
> > sched_setscheduler(2) manpage.
> > 
> > In particular, a non-privileged process cannot set the real-time
> > priority higher than its RLIMIT_RTPRIO setting. You can change this
> > with an "rtprio" entry in /etc/security/limits.conf (settings are
> > applied on login, so changes won't affect existing login sessions).
> > 
> > Privilege is determined by the CAP_SYS_NICE capability.
> 
> Thanks Glynn.
> 
> I have tried to set the RLIMIT_RTPRIO to 100 through
> /etc/security/limits.conf. It was not defined previously, so I have
> defined in the following way.
> 
> domain       type    item     value
> #@srinivasg  soft    rtprio   100

First, as Ben says, you must uncomment the line. Second, you may also
need to set the hard limit. You can use "ulimit -a" (or -aH) to check
the actual limits.

-- 
Glynn Clements <glynn@gclements.plus.com>
