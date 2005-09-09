From: _z33 <timid.Gentoo@gmail.com>
Subject: Re: typecasting - explain
Date: Fri, 09 Sep 2005 15:34:59 +0530
Message-ID: <dfrmoh$qqb$1@sea.gmane.org>
References: <dfrckc$ts5$1@sea.gmane.org> <1126251195.4506.81.camel@kaushal> <dfri89$cse$2@sea.gmane.org> <dfrkke$k2t$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <dfrkke$k2t$1@sea.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Jarmo wrote:
> 
> Functions are only "jump" labels. Thou you cant expect a program to work 
> if you cross typecast functions with different argument (or return) 
> values. This because the function expects arguments to be in "right" 
> register or stack position. And caller expects return values to be in 
> right register.
> 
> // Jarmo

excerpt from a discussion here @

...
   ANSI Classic section 3.3.4, page 47 lines 4 to 5:  "A pointer to a
function of one type may be converted to a pointer to a function of another
type and back again; the result shall compare equal to the original 
pointer."
...


   Seems to confuse me a lot. I didn't understand the ABC's of the 
quoted discussion; nevertheless, this line there in the discussion, 
still stings me :(
   What does it mean?

   First of all, why should be function pointers be typecasted to 
something else?

_z33
-- 
I love TUX; well... that's an understatement :)

