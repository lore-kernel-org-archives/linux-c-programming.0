From: Elias Athanasopoulos <eathan@otenet.gr>
Subject: Re: [jason@txt.com: Re: Problem with "chars"]
Date: Wed, 17 Jul 2002 21:16:39 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020717211639.L1163@neutrino.particles.org>
References: <20020717205559.J1163@neutrino.particles.org> <200207171755.g6HHtsF0004688@grinch.txt.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200207171755.g6HHtsF0004688@grinch.txt.com>; from jason@txt.com on Wed, Jul 17, 2002 at 10:55:52AM -0700
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Cc: xlp <xlp@emtel.net.co>, linux-c-programming@vger.kernel.org, jason@txt.com

On Wed, Jul 17, 2002 at 10:55:52AM -0700, Jason P. Winters wrote:
> Huh?  I mean, excuse me?  Where do you find a reference to _not_ casting
> the output of malloc()?   Malloc returns a (void *) reference, you -need-
> to cast it to the type you're assigning it as.
> 
> If you don't cast it, you get a warning message:
> 
> tst.c: In function `foo':
> tst.c:17: warning: assignment makes pointer from integer without a cast
> 
> 
> So, do we ignore the message from the compiler? 
> 
> Now, *That's* a bad habit to get into...

Pls, include stdlib.h and you'll be happy.

The C standard (call it C99, but this comes from the earlier days) states
that void * is implicitly casted to everything is on the other side.

By explicitly casting malloc() you don't get the warning you wrote, but
the correct way to vanish the warning is to include stdlib.h.

Elias

-- 
http://gnewtellium.sourceforge.net			MP3 is not a crime.	
