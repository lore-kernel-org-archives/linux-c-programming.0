From: Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
Subject: Re: The stickybit!!
Date: Fri, 17 Dec 2004 16:08:20 +0530
Message-ID: <1103279900.3797.13.camel@myLinux>
References: <1103265276.6880.8.camel@myLinux>
	 <20041217093402.GW16958@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041217093402.GW16958@lug-owl.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: Linux C Programming <linux-c-programming@vger.kernel.org>

On Fri, 2004-12-17 at 15:04, Jan-Benedict Glaw wrote:
> On Fri, 2004-12-17 12:04:36 +0530, Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
> wrote in message <1103265276.6880.8.camel@myLinux>:
> > Hi,
> > 	Though it is known that stickybit is obsolete, im just curious to see
> > the effect of setting a sticky bit on an executable file.
> 
> It isn't obsolete. It's a rarely used feature that's actually quite
> important. Most of the time, you can try to work around it, but the
> sticky bit will most probably just stay as it is.
> 
> > 	Is there a way to findout the data if residing in swap area after the
> > process is terminated, using a C program??
> 
> Not (easily), at last. You can try to open the swap area(s) with
> O_DIRECT and prepare a copy of it. However, you don't know which pages
> were owned by the terminated process formerly so you only can step
> through all the bytes and hope to find something useful...
Im not able to get that part completely. Can a bit more explanation be
given!!

> MfG, JBG
-- 
With regards,

Jagadeesh Bhaskar P

