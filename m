From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: exploitable function
Date: Wed, 26 Jun 2002 20:26:03 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15642.5451.365778.941333@cerise.nosuchdomain.co.uk>
References: <20020625160221.A489@nietzsche>
	<20020626004345.B2816@neutrino.particles.org>
	<20020625163329.C27404@nietzsche>
	<20020626164110.B1131@neutrino.particles.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020626164110.B1131@neutrino.particles.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Elias Athanasopoulos wrote:

> > by the way, where can i find a exploitable function and try to
> > code epxloit proof for education and practice?
> 
> strcpy() is the number-one danger.

But note that strncpy() isn't much better, for two reasons:

1. If the source is longer than the size of the buffer, there won't be
a terminating NUL in the result.

2. If a string is too long, simply truncating it to a fixed length is
seldom the correct response, and may have security implications. It's
usually preferable to treat this situation as a fatal error, and
terminate the program.

-- 
Glynn Clements <glynn.clements@virgin.net>
