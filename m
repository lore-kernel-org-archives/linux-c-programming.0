From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Re: Howto print off_t
Date: Fri, 28 Jun 2002 07:00:18 +0200 (CEST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0206280655150.4995-100000@talentix.dwd.de>
References: <15643.33068.680130.50185@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <15643.33068.680130.50185@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org


On Thu, 27 Jun 2002, Glynn Clements wrote:

>
> Holger Kiehl wrote:
>
> > > > One could code this as follows:
> > > >
> > > >     if (sizeof(off_t) == 4)
> > > >        printf("%ld\n", off_t_var);
> > > >     else
> > > >        printf("%lld\n", off_t_var);
> > >
> > > It's probably better to use the preprocessor, i.e.
> > >
> > > 	#if sizeof(off_t) == 4
> > >
> > Does the sizeof operator work in the preprocessor? I tried this but it
> > does not seem to work for me.
>
> No, sorry; I'd forgotten about the "types" exception for #if.
>
> The argument to #if is a "constant expression", with the same
> definition as in C itself (i.e. what can occur on the RHS of a static
> initialiser), *EXCEPT* that it can't use "sizeof", a cast, or an enum
> constant, but can use "defined()".
>
> If you're using autoconf, you can use AC_CHECK_SIZEOF, e.g.
>
> 	AC_CHECK_SIZEOF(off_t)
>
> will define SIZEOF_OFF_T to the appropriate value, so you can then
> use e.g.
>
> 	#include <config.h>
> 	...
> 	#if SIZEOF_OFF_T == 4
> 	...
>
I already had plans to use autoconf to do the configuration, so this
will be one more reason for using it.

Many thanks for the help!

Holger

