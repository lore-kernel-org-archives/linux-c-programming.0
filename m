From: Per Jessen <per@computer.org>
Subject: Re: boosting priority of threads & processes
Date: Wed, 19 Dec 2007 12:53:12 +0100
Message-ID: <47690628.3070407@computer.org>
References: <1198062445.2788.9.camel@root>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1198062445.2788.9.camel@root>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

vibi wrote:
> hello,
> 	is there any way to boost the priority of threads & processes other
> than using nice value.
> 

See man sched_setparam.


/Per Jessen
