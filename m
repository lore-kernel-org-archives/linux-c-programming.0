From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: printf and long double
Date: Mon, 4 Oct 2010 02:33:18 +0100
Message-ID: <19625.11998.318578.160832@cerise.gclements.plus.com>
References: <20101003225652.GA3618@dinofilaria.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20101003225652.GA3618@dinofilaria.home>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nanakos Chrysostomos <nanakos@wired-net.gr>
Cc: linux-c-programming@vger.kernel.org


Nanakos Chrysostomos wrote:

> I have the above C code snippet. I am trying to get a resonable
> result in a fixed form with printf for a long double value but with
> no luck. What am I doing wrong?

> 	long double c = powl(10.0L,30.0L);
> 
> 	printf("%llf %lle\n",c,c);

> # gcc -DDOUBLE -msse2 -mfpmath=sse -m64 -m128bit-long-double  long.c -lm
> #./a.out
> 
> 1000000000000000000024696061952.000000 1.000000e+30
> 
> The second result is right but how can I get a fixed right result for the first one?
> The fixed precision should be a lot bigger than this according to the IEEE-754 standard.
> I am using a 64-bit machine with Debian Squeeze x86-64 version.

On x86, long double is 80 bits, which is roughly 24 decimal digits.

The -m128bit-long-double flag only changes the alignment, not the
accuracy of the calculations.

The only reason why you're getting different results for %f and %e is
that the default precision of 6 refers to 6 decimal places for %f but
to 6 significant digits for %e.

-- 
Glynn Clements <glynn@gclements.plus.com>
