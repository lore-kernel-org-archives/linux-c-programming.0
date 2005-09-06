From: nhorman@tuxdriver.com
Subject: Re: weird structure definition in header file
Date: Tue, 6 Sep 2005 15:56:07 -0400
Message-ID: <20050906195607.GB10879@hmsreliant.homelinux.net>
References: <Pine.LNX.4.63.0509061510210.24485@vericenter> <20050906192324.GA10879@hmsreliant.homelinux.net> <Pine.LNX.4.63.0509061526130.24776@vericenter> <Pine.LNX.4.63.0509061538530.24984@vericenter>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.63.0509061538530.24984@vericenter>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>

On Tue, Sep 06, 2005 at 03:45:01PM -0400, Robert P. J. Day wrote:
> On Tue, 6 Sep 2005, Robert P. J. Day wrote:
> 
> > On Tue, 6 Sep 2005, nhorman@tuxdriver.com wrote:
> >
> > > On Tue, Sep 06, 2005 at 03:13:48PM -0400, Robert P. J. Day wrote:
> > > >
> > > >   i'm looking at some legacy code and, in a header file, i find the
> > > > following (paraphrased for brevity):
> > > >
> > > > typedef struct {
> > > > 	... stuff ...
> > > > } Widgets ;
> > > >
> > > > extern Widgets Widget ;
> > > >
> > > >
> > > >   huh?  i can see why a header file would want to define a structure
> > > > but i'm confused why the *header* file would then refer to an external
> > > > object of that type.  that's a new one on me -- typically, i'd expect
> > > > a *source* file to define such a thing and other *source* files to
> > > > contain the "extern" declaration.
> > > >
> > > >   is this some subtle programming cleverness of which i am unaware?
> > > > thanks.
> > > >
> > > This is done quite frequently when a data structure needs to be
> > > referenced from multiple locations.  They're not necessicarily
> > > consecutive like that, but its rather a common practice to extern a
> > > instance of a type in a header file.  The kernel source tree does
> > > this very frequently, check include/net/ipv4 for lots of examples.
> 
> um, still a couple questions on this.  first, in terms of examples,
> there *is* no include/net/ipv4 directory in the kernel source tree
> anymore, it's just net/ipv4.  and there's only a single header file in
> there, which has no example of such a practise.  were you thinking of
> a different directory?  (i'm in the 2.6.12.5 source tree.)
> 
I think you have a bad kernel tree:
http://www.kernel.org/git/?p=linux/kernel/git/torvalds/linux-2.6.git;a=tree
There is pretty clearly an include subdirectory there.

> also, i'm assuming that some source file must eventually include an
> actual definition of a "Widget" for the purposes of linking, as in:
> 
>   #include "widgets.h"
>   ...
>   Widgets Widget ;
> 
> however, given the inclusion of the header file, doesn't this give me
> both a referencing declaration and a defining declaration of that
> object in the same file?  is there no problem with that?  i was under
> the impression that common practise was to have a single defining
> declaration and all the *remaining* be referencing declarations.
> 
No.  You've got a defining declaration (the typedef struct {...} widgets;) and a
declaration which specifically defines an instance of the type widgets (named
widget) as being instatiated externally to the scope of this file.  Theres
nothing wrong with doing that.  Its exactly the same as placing an extern
directive in each C file that includes the header.  Its not at all problematic
(or sleazy :) ).
Neil

> rday
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
/***************************************************
 *Neil Horman
 *Software Engineer
 *gpg keyid: 1024D / 0x92A74FA1 - http://pgp.mit.edu
 ***************************************************/
