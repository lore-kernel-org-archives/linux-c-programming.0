From: Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
Subject: Re: usage of WIN_SMART
Date: Thu, 25 Nov 2004 09:57:03 +0530
Message-ID: <1101356823.3795.9.camel@myLinux>
References: <1101293397.3787.34.camel@myLinux>
	 <20041124121036.GQ2067@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041124121036.GQ2067@lug-owl.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: Linux C Programming <linux-c-programming@vger.kernel.org>

I meant how to use WIN_SMART in the code? Not its uses or advantages!!

Can someone help me with that??

On Wed, 2004-11-24 at 17:40, Jan-Benedict Glaw wrote:
> On Wed, 2004-11-24 16:19:57 +0530, Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
> wrote in message <1101293397.3787.34.camel@myLinux>:
> > Can someone help me with an explanation for the usage of WIN_SMART
> > directive declared in hdreg.h in ioctl() function?
> 
> Just look at some users of WIN_SMART. Found these with Google:
> 
> Function ataReadSmartValues() in
> http://cvs.sourceforge.net/viewcvs.py/smartmontools/sm5/atacmds.c?rev=1.2
> 
> Function smart_read_values() in
> http://www.linux-ide.org/smart/ide-smart.c
> 
> There are other examples, too.  Of course, you can only use code out of
> these if your software is going to be available under GNU GPL ...
> 
> MfG, JBG
-- 
Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>

