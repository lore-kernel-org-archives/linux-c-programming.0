From: Karthik Vishwanath <karthik@northstar.dartmouth.edu>
Subject: Re: undefined sqrt()
Date: Thu, 24 Oct 2002 17:50:25 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.SGI.4.05.10210241744210.34469-100000@angstrom.dartmouth.edu>
References: <20021024205042.GA3766@teamfinders.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20021024205042.GA3766@teamfinders.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Theo. Sean Schulze" <tschulze@teamfinders.org>
Cc: linux-c-programming@vger.kernel.org

from the gcc man page: 

"
        ... The linker handles an archive file by scan-
        ning  through  it  for members which define symbols
        that have so far been referenced but  not  defined.
"

The funtion sqrt() is defined in the libm.a and declared in <math.h>. To
use the function, you need the "real code" (which is in libm.a). Thats the
way I think about it. I'll let the gurus on this list clarify, if anything
is misleading/ misrepresented here. 

-K


On Thu, 24 Oct 2002, Theo. Sean Schulze wrote:

> Thanks.  The "-lm" did it.  Why?  I see from the gcc man page that the
> "-l" is a linker option.  Am I right that the linker then searches for
> "libm.a"?  Again, why, if I am right, would it need to after I
> included math.h?  Isn't sqrt() in math.h?
> 
> Thanks,
> Sean
> 
> On Thu, Oct 24, 2002 at 04:17:27PM -0400, Karthik Vishwanath hunted and pecked out:
> > Try:
> > 
> > gcc -Wall -lm -o glide glide.c
> > 
> > -K
> > 

