From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: value computed is not used ??
Date: Tue, 1 Jun 2004 22:58:14 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16572.64502.651803.95029@cerise.nosuchdomain.co.uk>
References: <20040531193810.GE31833@opaque>
	<Pine.LNX.4.21.0406010333220.1813-100000@hestia>
	<c9hb7s$3o1$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <c9hb7s$3o1$1@sea.gmane.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Charlie Gordon wrote:

> >  char *ptr = NULL;
> this initialization is useless.

Or possibly worse than useless.

Without the initialisation, if you tried to use it before it was
initialised, the compiler may generate a warning. The above
initialisation would eliminate the warning, and instead result in a
segfault (or, on an architecture which doesn't have an MMU, just
incorrect behaviour) at run time.

Responding to warnings by just "shutting the compiler up" is a common
programming flaw.

Probably the most common situation where this is dangerous is "fixing"
int/long mismatches using a type cast. You can get away with this if
sizeof(int) == sizeof(long) (e.g. i386). But on a system where
sizeof(int) != sizeof(long), the typecast may not work (or, at least,
not correctly), and eliminating the warnings will make it harder to
find (and actually fix) the problems.

-- 
Glynn Clements <glynn.clements@virgin.net>
