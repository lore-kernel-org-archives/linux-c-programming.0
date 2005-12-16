From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: C coding convention
Date: Fri, 16 Dec 2005 10:59:17 +0000
Message-ID: <17314.40453.638378.708678@cerise.gclements.plus.com>
References: <1134699163.5461.19.camel@silver.hq.ntsp.nec.co.jp>
	<Pine.LNX.4.63.0512152115310.26086@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0512152115310.26086@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: "Joel M. Pareja" <jpareja@ntsp.nec.co.jp>, C programming list <linux-c-programming@vger.kernel.org>


Robert P. J. Day wrote:

> > I just would like to hear ideas about a convention that my boss is
> > insisting on being implemented which I personally disagree.
> >
> > Putting opening/closing brackets for case statements:
> >
> >   switch (type)
> >   {
> >     case 1:
> > =>  {
> >       /* do something */
> >       break;
> > =>  }
> >
> >     ....
> >
> >     default:
> >     {
> >       /* do something */
> >       break;
> >     }
> >   }
> >
> 
> it's a bad idea since it just wastes screen space -- chewing up an
> entire line for a single brace.  bad boss.  no biscuit.

It has the advantage of forcing a separate variable scope for each
case. That could conceivably prevent bugs if you're using the C99
feature of declaring variables in the middle of a block, e.g.:

  switch (type)
  {
    case 1:
      int i = 0;
      /* do something */
      break;

    ....

    default:
      int j = 1;
      foo(i); /* oops; meant "j", but the compiler won't complain
		 because "i" is in scope here */
      break;
  }

-- 
Glynn Clements <glynn@gclements.plus.com>
