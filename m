From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: [jason@txt.com: Re: Problem with "chars"]
Date: Wed, 17 Jul 2002 19:54:13 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15669.48469.154653.841599@cerise.nosuchdomain.co.uk>
References: <20020717205559.J1163@neutrino.particles.org>
	<200207171755.g6HHtsF0004688@grinch.txt.com>
	<15669.45653.26064.996776@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <15669.45653.26064.996776@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Jason P. Winters" <jason@txt.com>, Elias Athanasopoulos <eathan@otenet.gr>, xlp <xlp@emtel.net.co>, linux-c-programming@vger.kernel.org


Glynn Clements wrote:

> > If you don't cast it, you get a warning message:
> > 
> > tst.c: In function `foo':
> > tst.c:17: warning: assignment makes pointer from integer without a cast
> 
> Which should provide a clue that you forgot the prototype, which is
> normally obtained using:
> 
> 	#include <stdlib.h>
> 
> An implicit cast between an *integer* (undeclared functions are
> assumed to return "int") and any pointer *will* generate a warning
> (unless the integer is a literal zero).
> 
> This is exactly *why* you *shouldn't cast* the result of malloc(),
> because it will hide this problem.

In retrospect, it's worth mentioning that a more reliable approach is,
where possible, to explictly enable warnings for undeclared functions. 
For gcc, this is controlled by the options:

`-Wimplicit-int'
     Warn when a declaration does not specify a type.

`-Wimplicit-function-declaration'
`-Werror-implicit-function-declaration'
     Give a warning (or error) whenever a function is used before being
     declared.

`-Wimplicit'
     Same as `-Wimplicit-int' and `-Wimplicit-function-'
     `declaration'.

[Note that -Wimplicit is enabled by -Wall.]

While the "don't cast return types" rule is still useful (it shouldn't
normally be necessary to cast return types, and may hide problems), it
won't catch other cases (e.g. if the return value was assigned to an
"int" variable, no warning would be generated, regardless of what the
function actually returned).

-- 
Glynn Clements <glynn.clements@virgin.net>
