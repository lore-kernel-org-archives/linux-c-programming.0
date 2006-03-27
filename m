From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Integer arithmetic vs double precision arithmetic
Date: Mon, 27 Mar 2006 18:13:00 +0100
Message-ID: <17448.7452.936006.434903@cerise.gclements.plus.com>
References: <200603262044.37068.samjnaa@gmail.com>
	<200603270505.42464.samjnaa@gmail.com>
	<17447.14781.949111.245955@cerise.gclements.plus.com>
	<200603271402.08010.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200603271402.08010.samjnaa@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> > E.g. The Unix API uses either seconds since midnight UTC, Jan 1st 1970
> > (time(), typically 32 bits) or seconds and microseconds since that
> > time (gettimeofday(), typically 32 bits for each component), while
> > Java uses milliseconds since that date (64 bits).
> 
> Oh! I did not know that Java can return system time to millisecond
> precision. 

To be precise, it returns the time at millisecond *granularity*; the
precision is limited by the OS.

> Is there a C or C++ function that can do that?

gettimeofday() returns the current time at microsecond granularity.

-- 
Glynn Clements <glynn@gclements.plus.com>
