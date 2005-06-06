From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: using compile-time "assertions"
Date: Mon, 6 Jun 2005 17:01:14 -0400 (EDT)
Message-ID: <Pine.LNX.4.61.0506061655420.2617@localhost.localdomain>
References: <Pine.LNX.4.61.0506051632530.5573@localhost.localdomain>
 <17059.41502.432000.929857@gargle.gargle.HOWL>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17059.41502.432000.929857@gargle.gargle.HOWL>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn@gclements.plus.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>

On Mon, 6 Jun 2005, Glynn Clements wrote:

>
> Robert P. J. Day wrote:
>
> >   another question (one of undoubtedly many) regarding the code i
> > inherited.  in this code, there is liberal use of the following macro:
> >
> > #define INVARIANT(e) \
> >   do { \
> >     struct whatever { char static_assertion[(e) ? 1 : -1]; }; \
> >     } while (0)
> >
> > which i recognize as a *compile-time* assertion/invariant.  is this a
> > common construct?  just curious.  or is there a more popular variant
> > of this sort of thing?  i recognize its value but, geez, there's
> > hundreds of these things in the code. :-P
>
> I've never seen that one before. It's more common to just use e.g.:
>
> 	#if !expression
> 	#error expression
> 	#endif

i'll admit that your alternative is the more obvious one for
compile-time checks, but i have to admit that INVARIANT macro is
growing on me since it's used literally *hundreds* of times in this
code base, and it fits conveniently on a single line and is eminently
readable.

admittedly, what you get if the invariant is violated is a pretty
generic error message:

  invar.c: In function `main':
  invar.c:15: error: size of array `static_assertion' is negative

but given that these are compile-time messages, one would think that
you'd be checking things that should *rarely* be false, and a file
name and line number are more than enough output.

i think i like this macro after all.

rday
