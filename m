From: Micha Feigin <michf@post.tau.ac.il>
Subject: Re: Newbie question on malloc()
Date: Fri, 4 Jun 2004 02:44:57 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040603234457.GK2562@luna.mooo.com>
References: <002d01c44897$78ae58d0$de01a8c0@qnessmphibiki> <1086196092.29970.2.camel@localhost> <16574.4399.288522.256729@cerise.nosuchdomain.co.uk> <20040602183734.GU20632@lug-owl.de> <20040603013427.GD2562@luna.mooo.com> <20040603194251.GY20632@lug-owl.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040603194251.GY20632@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming <linux-c-programming@vger.kernel.org>

On Thu, Jun 03, 2004 at 09:42:51PM +0200, Jan-Benedict Glaw wrote:
> On Thu, 2004-06-03 04:34:27 +0300, Micha Feigin <michf@post.tau.ac.il>
> wrote in message <20040603013427.GD2562@luna.mooo.com>:
> > On Wed, Jun 02, 2004 at 08:37:34PM +0200, Jan-Benedict Glaw wrote:
> > > Well, that all depends on the definition of "OS". Any recent 32+ bit
> > > operating system with virtual memory capabilities and multi-processing
> > > will reclaim malloc()ed RAM upon process termination.
> > 
> > It has nothing to do with virtual memory. In any multi-processing OS
> > (any modern one probably) memory allocations are done by the kernel
> > since the kernel is the one managing the system's memory.
> > 
> > If the kernel doesn't have a bug, this memory is released on process
> > exit (unless it is still used by another process such as with fork with
> > virtual memory where it is marked copy on write).
> 
> Read again. There ARE (or at least: were) operating systems that
> intentionally did *not* implicitely free memory. If an application
> missed to free all allocated memory, it's lost. Forever.
> 

Single process operating systems could get away with doing that. Multi
process operating systems (and most modern ones are) can't afford that
luxury as it will allow one misbehaving process to kill the system
(maybe win 3 could get away with that as it was a cooperative multi
tasking system as opposed to a properly scheduled one and dynamic memory
there was a very sick thing using handles)

Maybe some special purpose embedded systems will do that to reduce
overhead but they will be hard to find probably.

> But modern OSes (those with at least have the capabilities mentioned
> above) will automatically reclaim all of a exit'ed process' memory.
> 
> MfG, JBG
> 
> -- 
>    Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
>    "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
>     fuer einen Freien Staat voll Freier B?rger" | im Internet! |   im Irak!
>    ret = do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA));


