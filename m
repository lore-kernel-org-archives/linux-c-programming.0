From: Marius Nita <marius@cs.pdx.edu>
Subject: Re: [jason@txt.com: Re: Problem with "chars"]
Date: Wed, 17 Jul 2002 12:30:24 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020717123023.A2248@cs.pdx.edu>
References: <20020717205559.J1163@neutrino.particles.org> <200207171755.g6HHtsF0004688@grinch.txt.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200207171755.g6HHtsF0004688@grinch.txt.com>; from jason@txt.com on Wed, Jul 17, 2002 at 10:55:52AM -0700
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Wed, Jul 17, 2002 at 10:55:52AM -0700, Jason P. Winters wrote:
>  
> > On Wed, Jul 17, 2002 at 09:33:16AM -0500, xlp wrote:
> > > char *foo()
> > > {
> > > 	char *retbar;
> > > 	retbar = (char *)malloc(20);
> > 
> > Although it's tend to be an aesthitic issue, it is a *good* habit to not
> > cast malloc().  
> 
> Huh?  I mean, excuse me?  Where do you find a reference to _not_ casting
> the output of malloc()?   Malloc returns a (void *) reference, you -need-
> to cast it to the type you're assigning it as.

The other folks already answered this, but it's worth pointing out that W
Richard Stevens talks about this in Advanced Programming in the Unix
Environment, and points out that the return of malloc should NOT be casted,
and stdlib.h should be included to avoid warnings..

It seems that this issue has become a religious thing, tho I don't see why. It
is clear that the return of malloc need not (and must not--for correctness) be
casted.

Besides,

  struct Blah *foo = malloc( sizeof(struct Blah) );

looks a lot more readable than

  struct Blah *foo = (struct Blah *)malloc( sizeof(struct Blah) );

> If you don't cast it, you get a warning message:
> 
> tst.c: In function `foo':
> tst.c:17: warning: assignment makes pointer from integer without a cast
> 
> 
> So, do we ignore the message from the compiler? 
> 
> Now, *That's* a bad habit to get into...
> 
> Ciao!
> 
> Jason
> -- 
> |UUCP  jason@txt.com                        Who wills, Can.
> |VOICE (408) 243-3425                         Who tries, Does.
> |LOCAL Hey, Jason!                              Who loves, Lives.          o_.
> |Disclaimer:  Not me! I didn't do *THAT!*                                 <|
> |Local Disclaimer:  I'm not here!                   A. McCaffrey           4
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
