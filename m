From: chuckw@ieee.org
Subject: Re: Sound Programming and Signals
Date: Thu, 13 Jun 2002 21:25:42 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020613212542.A24845@whatever.local>
References: <20020613154108.A26285@atl.lmco.com> <15625.4880.647809.617013@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <15625.4880.647809.617013@cerise.nosuchdomain.co.uk>; from glynn.clements@virgin.net on Thu, Jun 13, 2002 at 10:48:00PM +0100
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Thu, Jun 13, 2002 at 10:48:00PM +0100, Glynn Clements wrote:
> 
> Chuck Winters wrote:
> 
> > I am trying to write a program which get a SIGIO signal from a
> > sound device, and then selects on the fd to decide if the device
> > can accept write, read, exception data.  The problem is that
> > it doesn't seem like the device every raises a SIGIO signal.  If
> > I do a kill -SIGIO <test_pid>, my handler runs.  Anyone have any ideas?
> 
> 1. Did you set the O_ASYNC flag on the descriptor, either in the call
> to open(), or with a subsequent call to fcntl(fd, F_SETFL, O_ASYNC)?
I used fcntl(fd, F_SETFL, f_flags|F_ASYNC)
after I used the F_SETOWN fcntl.  
> 
> 2. Did you set the target process ID with fcntl(fd, F_SETOWN, pid)?
> 
> If you have done both of these, but you still don't receive SIGIO,
> then I would suspect that it's a limitation of the sound card driver.
That really sucks then.  I thought all the drivers would support that.

Thanks
Chuck
