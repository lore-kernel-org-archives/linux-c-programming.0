From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: How does malloc tell the kernel to allocate more memory?
Date: Sun, 8 Dec 2002 21:20:52 +0000
Sender: linux-newbie-owner@vger.kernel.org
Message-ID: <15859.47028.420364.128585@cerise.nosuchdomain.co.uk>
References: <000301c29eea$3107dd10$032a1c43@joe>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-newbie-owner@vger.kernel.org>
In-Reply-To: <000301c29eea$3107dd10$032a1c43@joe>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Joseph D. Wagner" <wagnerjd@prodigy.net>
Cc: Linux C Programming <linux-c-programming@vger.kernel.org>, Linux Newbie <linux-newbie@vger.kernel.org>


Joseph D. Wagner wrote:

> I'm trying to write a tracer on memory allocation, and I'm having a little
> trouble figuring this out.
> 
> At some point, malloc has to call the kernel to tell it to allocate more
> memory for this user process, right?  I can't figure out which function
> malloc calls, or where in the code (line number) it's called.

malloc can use either sbrk/brk or (anonymous) mmap to obtain more
memory from the kernel.

> I'm looking at glib-2.3.1 to try and find my answers.  After all, that's
> where malloc is defined, right?

It's in glibc (GNU libc), not glib (the GNOME utility library).

-- 
Glynn Clements <glynn.clements@virgin.net>
-
To unsubscribe from this list: send the line "unsubscribe linux-newbie" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at http://www.linux-learn.org/faqs
