From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: typecasting - explain
Date: Fri, 9 Sep 2005 14:19:59 +0100
Message-ID: <17185.35839.127116.210984@cerise.gclements.plus.com>
References: <dfrckc$ts5$1@sea.gmane.org>
	<1126251195.4506.81.camel@kaushal>
	<dfri89$cse$2@sea.gmane.org>
	<dfrkke$k2t$1@sea.gmane.org>
	<dfrmoh$qqb$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <dfrmoh$qqb$1@sea.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: _z33 <timid.Gentoo@gmail.com>
Cc: linux-c-programming@vger.kernel.org


_z33 wrote:

> > Functions are only "jump" labels. Thou you cant expect a program to work 
> > if you cross typecast functions with different argument (or return) 
> > values. This because the function expects arguments to be in "right" 
> > register or stack position. And caller expects return values to be in 
> > right register.
> > 
> > // Jarmo
> 
> excerpt from a discussion here @
> 
> ...
>    ANSI Classic section 3.3.4, page 47 lines 4 to 5:  "A pointer to a
> function of one type may be converted to a pointer to a function of another
> type and back again; the result shall compare equal to the original 
> pointer."
> ...
> 
> 
>    Seems to confuse me a lot. I didn't understand the ABC's of the 
> quoted discussion; nevertheless, this line there in the discussion, 
> still stings me :(
>    What does it mean?

All it really means is that all function pointers are the same size
regardless of their type.

>    First of all, why should be function pointers be typecasted to 
> something else?

Storage. You might want to store pointers to different types of
functions in a common variable or structure field.

-- 
Glynn Clements <glynn@gclements.plus.com>
