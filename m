From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Stupid Question.
Date: Thu, 13 May 2004 19:27:15 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16547.48643.913168.610550@cerise.nosuchdomain.co.uk>
References: <1084387986.15249.25.camel@scotus.fesnel.no-ip.org>
	<6.0.1.1.0.20040512125919.02e8cec0@no.incoming.mail>
	<20040513143852.GE1912@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040513143852.GE1912@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Linux-C-Programming (E-mail)" <linux-c-programming@vger.kernel.org>


Jan-Benedict Glaw wrote:

> Static automatic variables (those that are within functions) do have a
> different semantic: their contents is preserved during multiple function
> calls.

"Static automatic variables" is a self-contradiction. "Static local
variables" (as opposed to "automatic local variables") would be more
accurate.

Local variables (those whose scope is limited to the block in which
they are declared) are automatic (stored on the stack) by default. The
"static" keyword makes them static (stored in the data segment).

This overloading of the "static" keyword is a common source of
confusion. They really should have added another keyword, IMHO. [And
dispensed with the (entirely redundant) "automatic" keyword, which
I've never actually seen used in nearly 20 years of C programming.]

And the distinction between automatic and static local variables is
somewhat deeper than the fact that the value is preserved across
calls. It's highly significant when dealing with reentrancy (e.g. 
recursive functions, multi-threaded code).

For instance, an automatic variable has a separate instance for each
call, while a static variable only has a single instance. OTOH, you
can legitimately return or store a pointer to a static variable and
reference it from outside of the function, whereas an automatic
variable ceases to exist once the function returns.

-- 
Glynn Clements <glynn.clements@virgin.net>
