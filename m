From: "Srinivas G." <srinivasg@esntechnologies.co.in>
Subject: RE: Unable set the priority for a pthread through pthread_setschedparam
Date: Thu, 5 Feb 2009 09:36:06 +0530
Message-ID: <F5BA82141F7AA94885B9643C77EEA5F2103D80@mail.esntechnologies.co.in>
References: <F5BA82141F7AA94885B9643C77EEA5F2103C73@mail.esntechnologies.co.in><18824.62496.424541.675373@cerise.gclements.plus.com><F5BA82141F7AA94885B9643C77EEA5F2103CF8@mail.esntechnologies.co.in> <18826.8119.705709.48276@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <18826.8119.705709.48276@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org, Manish Katiyar <mkatiyar@gmail.com>, "Nutan C." <nutanc@esntechnologies.co.in>

Glynn wrote:

> > domain       type    item     value
> > #@srinivasg  soft    rtprio   100
> 
> First, as Ben says, you must uncomment the line. Second, you may also
> need to set the hard limit. You can use "ulimit -a" (or -aH) to check
> the actual limits.

Thanks Glynn.

I am able to run the programs as a normal user after setting the soft as
well as hard values in /etc/security/limits.conf values. However,
without setting the hard limit, I am not able to run the programs. So,
by setting the soft and hard values to 100, I am able to run.

domain       type    item     value
@srinivasg  	 soft    rtprio   100
@srinivasg   hard    rtprio   100

Thanks for the right information.

With Regards,
Srinivas G
