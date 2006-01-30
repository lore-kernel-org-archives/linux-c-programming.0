From: James Colannino <james@colannino.org>
Subject: Re: Debugging
Date: Mon, 30 Jan 2006 11:13:25 -0800
Message-ID: <43DE6555.7010806@colannino.org>
References: <43DC5EFA.7010001@colannino.org> <20060129105131.6813f695.leslie.polzer@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20060129105131.6813f695.leslie.polzer@gmx.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Patrick Leslie Polzer wrote:

>First, define "does not function properly".  Does it dump code, is there a
>logic error?
>  
>

Sorry; I should have explained myself more clearly.  It's a logic error 
(I think.)  What's weird is that I ran strace to compare the various 
system calls used with the un-optimized version vs. the optimized 
version, and they were both the same up to the point where the optimized 
one failed.  Of course that isn't a reflection of the actual machine 
code, so I guess that wouldn't necessarily help me out too much.

>Then go about finding the offending line(s) of code.
>Watch out for obscure tricks, side-effects, wild pointers and illegal casts.
>Compile with -Wall and, to enforce your discipline, treat every warning as
>-Werror.
>  
>

Without -Wall, I get no errors (I always do my best to get rid of 
warnings.)  I'll try it with -Wall though and see what happens.

James

-- 
My blog: http://www.crazydrclaw.com/
My homepage: http://james.colannino.org/

"If Carpenters made houses the way programmers design programs, the first woodpecker to come along would destroy all of civilization." --Computer Proverb

