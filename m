From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: weird structure definition in header file
Date: Wed, 7 Sep 2005 02:17:54 +0100
Message-ID: <17182.16322.491753.986518@cerise.gclements.plus.com>
References: <Pine.LNX.4.63.0509061510210.24485@vericenter>
	<20050906192324.GA10879@hmsreliant.homelinux.net>
	<Pine.LNX.4.63.0509061526130.24776@vericenter>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0509061526130.24776@vericenter>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: nhorman@tuxdriver.com, C programming list <linux-c-programming@vger.kernel.org>


Robert P. J. Day wrote:

> > >   i'm looking at some legacy code and, in a header file, i find the
> > > following (paraphrased for brevity):
> > >
> > > typedef struct {
> > > 	... stuff ...
> > > } Widgets ;
> > >
> > > extern Widgets Widget ;
> > >
> > >
> > >   huh?  i can see why a header file would want to define a structure
> > > but i'm confused why the *header* file would then refer to an external
> > > object of that type.  that's a new one on me -- typically, i'd expect
> > > a *source* file to define such a thing and other *source* files to
> > > contain the "extern" declaration.
> > >
> > >   is this some subtle programming cleverness of which i am unaware?
> > > thanks.
> > 
> > This is done quite frequently when a data structure needs to be
> > referenced from multiple locations.  They're not necessicarily
> > consecutive like that, but its rather a common practice to extern a
> > instance of a type in a header file.  The kernel source tree does
> > this very frequently, check include/net/ipv4 for lots of examples.
> 
> ok, so what it represents is just a shortcut so that each source file
> doesn't have to have its own extern, it just comes along with the
> header file.

Yep.

> all right, i guess i can live with that although it strikes me as
> just a little bit sleazy. oh, well.

Huh? That's what header files are for. Or do you have stuff like:

	extern int strcmp(const char *s1, const char *s2);

at the top of all of your source files?

-- 
Glynn Clements <glynn@gclements.plus.com>
