From: Ducrot Bruno <poup@poupinou.org>
Subject: Re: TRUE FALSE
Date: Fri, 28 Jun 2002 14:20:41 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020628122041.GA6112@poup.poupinou.org>
References: <200206230221.g5N2L8x28617@fsn3.frontstreetnetworks.com> <15637.14929.975497.394653@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <15637.14929.975497.394653@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn.clements@virgin.net>
Cc: Gerald Waugh <gwaugh@frontstreetnetworks.com>, linux-c-programming@vger.kernel.org

On Sun, Jun 23, 2002 at 04:02:41AM +0100, Glynn Clements wrote:
> 
> Gerald Waugh wrote:
> 
> > Oh, I know this is dumb
> > But where is TRUE and FALSE defined
> 
> They aren't defined in any standard header; if you want them to be
> defined, you have to define them yourself.

Right, but wrong in some sense.  ANSI C99 define the type 'bool' in stdbool.h

FALSE and TRUE didn't exist in any standard, though.  You have to use
actually 'true' and 'false' instead if you want to use stdbool.h.


-- 
Ducrot Bruno
http://www.poupinou.org        Page profaissionelle
http://toto.tu-me-saoules.com  Haume page
