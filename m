From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: [jason@txt.com: Re: Problem with "chars"]
Date: Wed, 24 Jul 2002 23:38:01 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15679.11337.893330.249174@cerise.nosuchdomain.co.uk>
References: <go0nha.u6f.ln@thune.mrc-home.org>
	<200207242105.g6OL5i2L021592@grinch.txt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200207242105.g6OL5i2L021592@grinch.txt.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Jason P. Winters wrote:

> > >It seems that this issue has become a religious thing, tho I don't see why. It
> > >is clear that the return of malloc need not (and must not--for correctness) be
> > >casted.
> > 
> > I believe it was necessary for pre or early ANSI C, so a lot of old code
> > written by some pretty smart people used it.
> 
> I beleive that totally.  And when you add in the fact that a lot of people
> move transparently between C and C++, which still requires casting, you can
> see that adding the extra casts is a common and easilly understood thing.

Casting in C++ is anything but easily understood. Primarily due to the
fact that the correspondence between method names and methods is
controlled by an object's type, but also due to the existence of type
conversion methods.

If you get a type mismatch in C++, the *last* thing that you should do
is to simply add a cast to make the warning/error go away without
actually analysing the consequences.

Even in C, casting may affect the code which is generated, e.g. due to
alignment/packing issues, aliasing rules, non-uniform pointer
representation etc.

-- 
Glynn Clements <glynn.clements@virgin.net>
