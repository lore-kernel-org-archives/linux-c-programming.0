From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Integer arithmetic vs double precision arithmetic
Date: Sun, 26 Mar 2006 22:03:02 +0100
Message-ID: <17447.390.978690.438069@cerise.gclements.plus.com>
References: <200603262044.37068.samjnaa@gmail.com>
	<6a00c8d50603260812q1ebddc26uae1c9b70bbe0d46e@mail.gmail.com>
	<200603262154.28395.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200603262154.28395.samjnaa@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> > Why do you consider doubles to store time values?
> 
> Oh, I need to use fractional days (in Julian Day Numbers) for astronomical 
> calculations.

So store time in seconds or milliseconds and divide by 86400 or
86400000 to get days. If 32 bits isn't enough, use "long long".

Floating-point is meant for the situation where you want a constant
relative error rather than a constant absolute error. For timescales,
a constant absolute error is usually more useful.

-- 
Glynn Clements <glynn@gclements.plus.com>
