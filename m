From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: [jason@txt.com: Re: Problem with "chars"]
Date: Wed, 17 Jul 2002 19:07:17 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15669.45653.26064.996776@cerise.nosuchdomain.co.uk>
References: <20020717205559.J1163@neutrino.particles.org>
	<200207171755.g6HHtsF0004688@grinch.txt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200207171755.g6HHtsF0004688@grinch.txt.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Jason P. Winters" <jason@txt.com>
Cc: Elias Athanasopoulos <eathan@otenet.gr>, xlp <xlp@emtel.net.co>, linux-c-programming@vger.kernel.org


Jason P. Winters wrote:

> > > char *foo()
> > > {
> > > 	char *retbar;
> > > 	retbar = (char *)malloc(20);
> > 
> > Although it's tend to be an aesthitic issue, it is a *good* habit to not
> > cast malloc().  
> 
> Huh?  I mean, excuse me?  Where do you find a reference to _not_ casting
> the output of malloc()?   Malloc returns a (void *) reference, you -need-
> to cast it to the type you're assigning it as.

No. Implicit casts to and from "void *" result in neither an error nor
a warning.

> If you don't cast it, you get a warning message:
> 
> tst.c: In function `foo':
> tst.c:17: warning: assignment makes pointer from integer without a cast

Which should provide a clue that you forgot the prototype, which is
normally obtained using:

	#include <stdlib.h>

An implicit cast between an *integer* (undeclared functions are
assumed to return "int") and any pointer *will* generate a warning
(unless the integer is a literal zero).

This is exactly *why* you *shouldn't cast* the result of malloc(),
because it will hide this problem.

> So, do we ignore the message from the compiler? 

No. You fix the problem about which it's warning (the lack of a
protoype), rather than simply making the warning go away without
actually fixing the problem.

On an ILP32 (int/long/pointer == 32 bits) architecture (e.g. x86), you
will get away with it. On an LP64 (long/pointer == 64 bits, int
implicitly 32 bits) architecture, the compiler will generate code on
the basis that malloc() returns 32 bits of data. But it will actually
return 64 bits (a pointer), resulting in undefined behaviour.

-- 
Glynn Clements <glynn.clements@virgin.net>
