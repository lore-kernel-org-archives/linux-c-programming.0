From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: can't initialize a constant using another constant?
Date: Wed, 27 Feb 2008 11:43:44 +0000
Message-ID: <18373.19696.942794.821373@cerise.gclements.plus.com>
References: <47C422E6.8050702@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <47C422E6.8050702@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> Quite some time since I wrote. I hope you are all keeping well. :)
> 
> A strange thing I ran across this evening. I was not allowed to do:
> 
> const double lunarSynodicMonth = 29.53059 ;
> const double daysLunarPhaseAngleTakesPerDegree = lunarSynodicMonth / 360.0 ;
> 
> I got the following error:
> 
> wdf-karanas.c:17: error: initializer element is not constant
> make: *** [wdf-karanas.o] Error 1
> 
> I would be grateful if anyone could shed some light. TIA.

In C, "const" is only relevant to pointer targets. Adding the "const"
modifier to a variable has no effect.

You need to change lunarSynodicMonth to a macro (#define) if you want
to be able to use it in an initialiser.

-- 
Glynn Clements <glynn@gclements.plus.com>
