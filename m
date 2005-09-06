From: Steve Graegert <graegerts@gmail.com>
Subject: Re: weird structure definition in header file
Date: Tue, 6 Sep 2005 21:57:23 +0200
Message-ID: <6a00c8d505090612573e1492c@mail.gmail.com>
References: <Pine.LNX.4.63.0509061510210.24485@vericenter>
	 <20050906192324.GA10879@hmsreliant.homelinux.net>
Reply-To: graegerts@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050906192324.GA10879@hmsreliant.homelinux.net>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "nhorman@tuxdriver.com" <nhorman@tuxdriver.com>
Cc: "Robert P. J. Day" <rpjday@mindspring.com>, C programming list <linux-c-programming@vger.kernel.org>

On 9/6/05, nhorman@tuxdriver.com <nhorman@tuxdriver.com> wrote:
> On Tue, Sep 06, 2005 at 03:13:48PM -0400, Robert P. J. Day wrote:
> >
> >   i'm looking at some legacy code and, in a header file, i find the
> > following (paraphrased for brevity):
> >
> > typedef struct {
> >       ... stuff ...
> > } Widgets ;
> >
> > extern Widgets Widget ;
> >
> >
> >   huh?  i can see why a header file would want to define a structure
> > but i'm confused why the *header* file would then refer to an external
> > object of that type.  that's a new one on me -- typically, i'd expect
> > a *source* file to define such a thing and other *source* files to
> > contain the "extern" declaration.
> >
> >   is this some subtle programming cleverness of which i am unaware?
> > thanks.
> >
> This is done quite frequently when a data structure needs to be referenced from
> multiple locations.  They're not necessicarily consecutive like that, but its
> rather a common practice to extern a instance of a type in a header file.  The
> kernel source tree does this very frequently, check include/net/ipv4 for lots of
> examples.

That's correct.  It is also used to implement some kind of inheritance
in C as can be seen in the Motif code.  Here, widgets are organized in
a "class hierarchy" and every widget inherits features of it "super
class" by simply defining new "parts" in separate structures that are
combined with the super class' part structure into a record which is
then defined extern for the reasons Neil just mentioned.  This leads
to these weird structure definitions you encountered.
 
Regards

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultancy {C/C++ && Java && .NET}
Mobile: +49 (176)  21248869
Office: +49 (9131) 7126409
