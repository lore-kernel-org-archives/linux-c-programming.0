From: Boris Bezlaj <boris@bandit.kista.gajba.net>
Subject: Re: How does malloc tell the kernel to allocate more memory?
Date: Sun, 8 Dec 2002 20:29:14 +0100
Sender: linux-newbie-owner@vger.kernel.org
Message-ID: <20021208192914.GA4262@bandit.kista.gajba.net>
References: <000301c29eea$3107dd10$032a1c43@joe>
Mime-Version: 1.0
Return-path: <linux-newbie-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000301c29eea$3107dd10$032a1c43@joe>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Joseph D. Wagner" <wagnerjd@prodigy.net>
Cc: Linux C Programming <linux-c-programming@vger.kernel.org>, Linux Newbie <linux-newbie@vger.kernel.org>

On Sun, Dec 08, 2002 at 12:46:57PM -0600, Joseph D. Wagner wrote:
> I'm trying to write a tracer on memory allocation, and I'm having a little
> trouble figuring this out.

You sure this has not been done before?
> 
> At some point, malloc has to call the kernel to tell it to allocate more
> memory for this user process, right?  I can't figure out which function
> malloc calls, or where in the code (line number) it's called.

I dont know much about memory management, but there is some documentation
at lkdp.tk  ..you might want to check it out, although AFAIK it's not finished yet..

-- 

With best regards,

		Boris B.
-
To unsubscribe from this list: send the line "unsubscribe linux-newbie" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at http://www.linux-learn.org/faqs
