From: "J." <j.reynders@xs4all.nl>
Subject: Re: convert time to UTC, THNKX ... solved ...
Date: Mon, 6 Oct 2003 23:02:52 +0200 (CEST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0310062300390.29925-100000@hestia>
References: <20031003222830.GA6059@lsd.di.uminho.pt>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20031003222830.GA6059@lsd.di.uminho.pt>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Fri, 3 Oct 2003, Luciano Miguel Ferreira Rocha wrote:

> On Wed, Oct 01, 2003 at 09:40:44PM +0200, J. wrote:
> >  if(strptime(tstr, "%a %b %d %T %Ey", &timestruct) == 0)
>                                   ^^^^
> You should use %Y, %y or %EY. For %Ey, the number is an offset from %EC,
> that in my current locale is 1900.
> 
> So the year is ending up in 3903, beyond the 32/31 bit limit for the
> number of seconds from Jan 1 1970.
> 
> Regards,
> Luciano Rocha

Ah great it works ... ! As you suggested. 

Merci

J.

--
AonkyKong

