From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Integer arithmetic vs double precision arithmetic
Date: Mon, 27 Mar 2006 02:02:53 +0100
Message-ID: <17447.14781.949111.245955@cerise.gclements.plus.com>
References: <200603262044.37068.samjnaa@gmail.com>
	<200603262154.28395.samjnaa@gmail.com>
	<17447.390.978690.438069@cerise.gclements.plus.com>
	<200603270505.42464.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200603270505.42464.samjnaa@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> > Floating-point is meant for the situation where you want a constant
> > relative error rather than a constant absolute error. For timescales,
> > a constant absolute error is usually more useful.
> 
> Could you clarify that a bit? How do you mean "constant relative error" as 
> against "constant absolute error"?

Absolute error is the difference between the actual value and the
recorded value. Relative error is the absolute error divided by the
actual value.

E.g. suppose that you store a time as an integral number of seconds. 
The absolute error is half a second. If the actual time is 10 seconds,
the relative error is 0.05 (5%); if the actual time is 31536000
seconds (365 days), the relative error is approximately 1.6E-08.

OTOH, if you stored the number of seconds as a floating-point value,
the relative error will always be around 1.2E-07 (single precision) or
2.2E-16 (double precision). The absolute error will vary according to
the value stored, e.g. for single precision, for an actual value of
around 1 second, the absolute error will be around 12us, while for an
actual value of around a year, the absolute error will be around 3.8
seconds.

In general, if you are dealing with values of a fixed magnitude, an
integer type will give better precision than a floating-point type of
the same size, because the floating point type uses some of the bits
to store the exponent. If you fix the exponent (i.e. use a common
scale factor), you can use all 32 or 64 bits to store the mantissa.

For measuring absolute time (i.e. time since "year zero", as opposed
to time intervals), you usually want values which are accurate to
within some fixed interval (e.g. 1s, 1ms, 1us etc), rather than values
which are highly accurate close to the beginning of the timescale but
which get less accurate as time goes on.

E.g. The Unix API uses either seconds since midnight UTC, Jan 1st 1970
(time(), typically 32 bits) or seconds and microseconds since that
time (gettimeofday(), typically 32 bits for each component), while
Java uses milliseconds since that date (64 bits).

-- 
Glynn Clements <glynn@gclements.plus.com>
