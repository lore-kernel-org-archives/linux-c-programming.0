From: "Jason P. Winters" <jason@txt.com>
Subject: Re: [jason@txt.com: Re: Problem with "chars"]
Date: Wed, 17 Jul 2002 10:55:52 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200207171755.g6HHtsF0004688@grinch.txt.com>
References: <20020717205559.J1163@neutrino.particles.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020717205559.J1163@neutrino.particles.org> from "Elias Athanasopoulos" at Jul 17, 2002 08:55:59 PM
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Elias Athanasopoulos <eathan@otenet.gr>
Cc: xlp <xlp@emtel.net.co>, linux-c-programming@vger.kernel.org, jason@txt.com

 
> On Wed, Jul 17, 2002 at 09:33:16AM -0500, xlp wrote:
> > char *foo()
> > {
> > 	char *retbar;
> > 	retbar = (char *)malloc(20);
> 
> Although it's tend to be an aesthitic issue, it is a *good* habit to not
> cast malloc().  

Huh?  I mean, excuse me?  Where do you find a reference to _not_ casting
the output of malloc()?   Malloc returns a (void *) reference, you -need-
to cast it to the type you're assigning it as.

If you don't cast it, you get a warning message:

tst.c: In function `foo':
tst.c:17: warning: assignment makes pointer from integer without a cast


So, do we ignore the message from the compiler? 

Now, *That's* a bad habit to get into...

Ciao!

Jason
-- 
|UUCP  jason@txt.com                        Who wills, Can.
|VOICE (408) 243-3425                         Who tries, Does.
|LOCAL Hey, Jason!                              Who loves, Lives.          o_.
|Disclaimer:  Not me! I didn't do *THAT!*                                 <|
|Local Disclaimer:  I'm not here!                   A. McCaffrey           4
