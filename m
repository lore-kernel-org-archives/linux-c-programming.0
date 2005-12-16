From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: C coding convention
Date: Thu, 15 Dec 2005 21:16:44 -0500 (EST)
Message-ID: <Pine.LNX.4.63.0512152115310.26086@localhost.localdomain>
References: <1134699163.5461.19.camel@silver.hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1134699163.5461.19.camel@silver.hq.ntsp.nec.co.jp>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Joel M. Pareja" <jpareja@ntsp.nec.co.jp>
Cc: C programming list <linux-c-programming@vger.kernel.org>

On Fri, 16 Dec 2005, Joel M. Pareja wrote:

> Hi!
>
> I just would like to hear ideas about a convention that my boss is
> insisting on being implemented which I personally disagree.
>
> Putting opening/closing brackets for case statements:
>
>   switch (type)
>   {
>     case 1:
> =>  {
>       /* do something */
>       break;
> =>  }
>
>     ....
>
>     default:
>     {
>       /* do something */
>       break;
>     }
>   }
>

it's a bad idea since it just wastes screen space -- chewing up an
entire line for a single brace.  bad boss.  no biscuit.

rday
