From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Pointer Woes: Pointer to a Pointer
Date: Tue, 18 Nov 2003 21:42:33 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16314.37449.524090.19414@cerise.nosuchdomain.co.uk>
References: <200311181430.15586.theman@josephdwagner.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200311181430.15586.theman@josephdwagner.info>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Joseph D. Wagner" <theman@josephdwagner.info>
Cc: linux-c-programming@vger.kernel.org


Joseph D. Wagner wrote:

> valgrind (a.k.a. memcheck) says that the single line inside the 'for' loop 
> below is the cause of my problems, saying things like 'uninitialized 
> memory' and 'invalid write'.  However, I can't figure out where I went 
> wrong in the line within my for loop.  I'd appreciate an extra/fresh set of 
> eyes.
> 
> Is the problem in the single line inside the 'for' loop below, or is the 
> problem somewhere back in my realloc statements?

Given that you are using 1-based indexing, are you remembering to add
1 to the number of elements when you (re)allocate the arrays
(frag_log.block_order_log, block_order_log.block_id and all of the
individual block_id arrays)?

-- 
Glynn Clements <glynn.clements@virgin.net>
