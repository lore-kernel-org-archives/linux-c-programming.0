From: "Michael H. Warfield" <mhw@wittsend.com>
Subject: Re: TRUE FALSE
Date: Sat, 22 Jun 2002 22:52:16 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020623025216.GA4974@alcove.wittsend.com>
References: <200206230221.g5N2L8x28617@fsn3.frontstreetnetworks.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200206230221.g5N2L8x28617@fsn3.frontstreetnetworks.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gerald Waugh <gwaugh@frontstreetnetworks.com>
Cc: linux-c-programming@vger.kernel.org

On Sat, Jun 22, 2002 at 10:21:16PM -0400, Gerald Waugh wrote:
> Oh, I know this is dumb
> But where is TRUE and FALSE defined
> I tried several 'h' files
> TIA

	Man, these things are defined all over the place.

	I LOVE this pair though:

mm.h:#define FALSE 0
mm.h:#define TRUE !FALSE

	Cool...  <mm.h> defines FALSE to be zero and TRUE to be not FALSE.
Someone had a poetic sense in writing it that way...

	:-)

	Now...  As to what include file you should include to get the
definitions (which I'm assuming is what you really wanted to know
rather than what you asked), I don't know.  Depends on the application.
It's defined in some X11 header files and some SQL header files.  Depends
on what you are doing...

> -- 
> Gerald Waugh 
> http://frontstreetnetworks.com  SOHO Networks & Web Site Hosting
> Front Street Networks LLC     voice +1 203 785 0699 * fax +1 203 785 1787
> 229 Front Street, Ste. #C, New Haven CT 06513-3203 

	Mike
-- 
 Michael H. Warfield    |  (770) 985-6132   |  mhw@WittsEnd.com
  /\/\|=mhw=|\/\/       |  (678) 463-0932   |  http://www.wittsend.com/mhw/
  NIC whois:  MHW9      |  An optimist believes we live in the best of all
 PGP Key: 0xDF1DD471    |  possible worlds.  A pessimist is sure of it!
