From: Heinrich du Toit <hdutoit@tlabs.ac.za>
Subject: Re: How does malloc tell the kernel to allocate more memory?
Date: Mon, 09 Dec 2002 08:55:27 +0200
Sender: linux-newbie-owner@vger.kernel.org
Message-ID: <3DF43E5F.8050707@tlabs.ac.za>
References: <000301c29eea$3107dd10$032a1c43@joe>
Reply-To: hdutoit@tlabs.ac.za
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-newbie-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: "Joseph D. Wagner" <wagnerjd@prodigy.net>
Cc: Linux C Programming <linux-c-programming@vger.kernel.org>, Linux Newbie <linux-newbie@vger.kernel.org>

Joseph D. Wagner wrote:

>I'm trying to write a tracer on memory allocation, and I'm having a little
>trouble figuring this out.
>
>At some point, malloc has to call the kernel to tell it to allocate more
>memory for this user process, right?  I can't figure out which function
>malloc calls, or where in the code (line number) it's called.
>
>I'm looking at glib-2.3.1 to try and find my answers.  After all, that's
>where malloc is defined, right?
>
>TIA.
>
>Joseph Wagner
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  
>
I don't have the answer. But look at something that already does this.
electric-fence detects illegal memory access (great for debugging)
ccmalloc is also a memory debugging library. It detects memory leaks and 
stuff like that.

Maybe after you checked this out you can rather work on improving these 
library's or extending them to do exactly what you want rather than 
reinventing the weel :-)

Good luck
-Heinrich

-
To unsubscribe from this list: send the line "unsubscribe linux-newbie" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at http://www.linux-learn.org/faqs
