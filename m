From: Micha Feigin <michf@post.tau.ac.il>
Subject: Re: value computed is not used ??
Date: Thu, 3 Jun 2004 04:26:47 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040603012647.GB2562@luna.mooo.com>
References: <20040531193810.GE31833@opaque> <Pine.LNX.4.21.0406010333220.1813-100000@hestia> <c9hb7s$3o1$1@sea.gmane.org> <16572.64502.651803.95029@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16572.64502.651803.95029@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Tue, Jun 01, 2004 at 10:58:14PM +0100, Glynn Clements wrote:
> 
> Charlie Gordon wrote:
> 
> > >  char *ptr = NULL;
> > this initialization is useless.
> 
> Or possibly worse than useless.
> 
> Without the initialisation, if you tried to use it before it was
> initialised, the compiler may generate a warning. The above
> initialisation would eliminate the warning, and instead result in a

On the other hand it allows you to check for pointer initialization
later to see if you already put a meaningful value in it, and in big
programs there is more use for that then the chance of a compiler error
by using an uninitialized value (especially since a debugger will catch
that in a second).

> segfault (or, on an architecture which doesn't have an MMU, just
> incorrect behaviour) at run time.
> 

You have much worse head aches on MMU-less systems then accessing a NULL
initialized pointer, from experience ;-) (although it is a method the
kernel uses to generate and exception locking up the system on panic)

On the other hand what are the chances of him running into an mmu-less
system considering its only a few embedded systems that are not using an
MMU these days.

> Responding to warnings by just "shutting the compiler up" is a common
> programming flaw.
> 
> Probably the most common situation where this is dangerous is "fixing"
> int/long mismatches using a type cast. You can get away with this if
> sizeof(int) == sizeof(long) (e.g. i386). But on a system where
> sizeof(int) != sizeof(long), the typecast may not work (or, at least,
> not correctly), and eliminating the warnings will make it harder to
> find (and actually fix) the problems.
> 
> -- 
> Glynn Clements <glynn.clements@virgin.net>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  
>  +++++++++++++++++++++++++++++++++++++++++++
>  This Mail Was Scanned By Mail-seCure System
>  at the Tel-Aviv University CC.
> 
