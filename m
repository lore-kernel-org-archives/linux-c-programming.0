From: "Venkatesharao, Lakshmesha" <Lakshmesha_Venkatesharao@Syntelinc.com>
Subject: re: logging console input
Date: Wed, 26 May 2004 02:41:43 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <E84F4156F89E3E4286468CA99DF68E400291623A@Synbomexch3>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Gimpelj <pgimpelj@sympatico.ca>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

I feel you can use dup or dup2.

> -----Original Message-----
> From:	Paul Gimpelj [SMTP:pgimpelj@sympatico.ca]
> Sent:	Tuesday, May 25, 2004 9:38 PM
> To:	linux-c-programming
> Subject:	re: logging console input
> 
> Yes. and no. a fork or Tee would be nice.
> Someone suggested to use script.
> but I would prefer to bounce around consoles and xconsoles.
> and trap and journal all input.
> thanks
> paul
> 
> --------------------------------
> 
> 
> John T. Williams reponds:
> 
> Am I right in saying that what you want is a key logger, which logs
> all key strokes regardless of which terminal they are inputted to.
> 
> In fact a program that sits between the kernels main keyboard buffer
> and user land programs, logging all input before any user land program
> can remove them from the main input buffer?
> 
> 
> On Tue, 2004-05-25 at 09:54, Paul Gimpelj wrote:
> > Well,
> >
> > Say I am typing all day and night into console and want a record of my
> input
> > to review later.
> > in case I forgot what i typed in hours ago.
> >
> > Under windows one hooks into the journaling hook vector. by writing a
> > program in c.
> > This gives the keyboard input so it can be recorded into a file.
> >
> > Is there a simple way to log the keyboard of the console, or does one
> need
> > to write a module
> > to hook the kernel.
> >
> > thanks.
> >
> >
> > Ps.
> > I am using ms mail 6. and wouldn't it be nice if i could just click
> reply
> > and it would send my response
> > to the linux-c........
> >
> > rather than ....
> >
> > or is there a different email browser set up for this mail list?
> >
> 
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
____________________________________________
Confidential:  This electronic message and all contents contain information
from Syntel, Inc. which may be privileged, confidential or otherwise
protected from disclosure. The information is intended to be for the
addressee only. If you are not the addressee, any disclosure, copy,
distribution or use of the contents of this message is prohibited.  If you
have received this electronic message in error, please notify the sender
immediately and destroy the original message and all copies.
