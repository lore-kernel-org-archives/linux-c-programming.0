From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: using compile-time "assertions"
Date: Mon, 6 Jun 2005 02:08:46 +0100
Message-ID: <17059.41502.432000.929857@gargle.gargle.HOWL>
References: <Pine.LNX.4.61.0506051632530.5573@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0506051632530.5573@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>


Robert P. J. Day wrote:

>   another question (one of undoubtedly many) regarding the code i
> inherited.  in this code, there is liberal use of the following macro:
> 
> #define INVARIANT(e) \
>   do { \
>     struct whatever { char static_assertion[(e) ? 1 : -1]; }; \
>     } while (0)
> 
> which i recognize as a *compile-time* assertion/invariant.  is this a
> common construct?  just curious.  or is there a more popular variant
> of this sort of thing?  i recognize its value but, geez, there's
> hundreds of these things in the code. :-P

I've never seen that one before. It's more common to just use e.g.:

	#if !expression
	#error expression
	#endif

-- 
Glynn Clements <glynn@gclements.plus.com>
