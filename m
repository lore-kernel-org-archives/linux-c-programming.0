From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Howto print off_t
Date: Thu, 27 Jun 2002 22:18:36 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15643.33068.680130.50185@cerise.nosuchdomain.co.uk>
References: <15642.44080.970456.988159@cerise.nosuchdomain.co.uk>
	<Pine.LNX.4.33.0206272049120.31948-100000@talentix.dwd.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0206272049120.31948-100000@talentix.dwd.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: linux-c-programming@vger.kernel.org


Holger Kiehl wrote:

> > > One could code this as follows:
> > >
> > >     if (sizeof(off_t) == 4)
> > >        printf("%ld\n", off_t_var);
> > >     else
> > >        printf("%lld\n", off_t_var);
> >
> > It's probably better to use the preprocessor, i.e.
> >
> > 	#if sizeof(off_t) == 4
> >
> Does the sizeof operator work in the preprocessor? I tried this but it
> does not seem to work for me.

No, sorry; I'd forgotten about the "types" exception for #if.

The argument to #if is a "constant expression", with the same
definition as in C itself (i.e. what can occur on the RHS of a static
initialiser), *EXCEPT* that it can't use "sizeof", a cast, or an enum
constant, but can use "defined()".

If you're using autoconf, you can use AC_CHECK_SIZEOF, e.g.

	AC_CHECK_SIZEOF(off_t)

will define SIZEOF_OFF_T to the appropriate value, so you can then
use e.g.

	#include <config.h>
	...
	#if SIZEOF_OFF_T == 4
	...

> > > But is this portable?
> >
> > No. This should be portable:
> >
> > 	#if sizeof(off_t) == sizeof(int)
> > 		printf("%d\n", off_t_var);
> > 	#elif sizeof(off_t) == sizeof(long)
> > 		printf("%ld\n", off_t_var);
> > 	#else
> > 	#error cannot print off_t
> > 	#endif
> >
> But is not on most 32 bit system, both long and int 4 bytes long, so %d
> will be used, but off_t in that case is mostly of type long?

If int and long are both 32 bits, then they're the same type, so it
doesn't matter whether you use "%d" or "%ld".

> > You could also include tests for specific platforms which support "ll"
> > or "q".
> 
> C99 does have a 64 bit integer type, how does one print it here?

C99 defines "%lld" for the *printf family. But C99 support is far from
widespread. [Aside: a significant number of people are still using
Unices which don't provide the wcs* functions, and they are C89.]

-- 
Glynn Clements <glynn.clements@virgin.net>
