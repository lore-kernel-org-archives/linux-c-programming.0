From: Gerald Waugh <gwaugh@frontstreetnetworks.com>
Subject: Re: select: Interrupted system call
Date: Sat, 27 Apr 2002 16:37:24 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200204272037.g3RKb1F18623@fsn3.frontstreetnetworks.com>
References: <200204271503.g3RF3lF04667@fsn3.frontstreetnetworks.com> <200204271602.g3RG24F07174@fsn3.frontstreetnetworks.com> <15562.64140.625327.285565@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <15562.64140.625327.285565@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

On Saturday 27 April 2002 03:22 pm, Glynn Clements wrote:
> Gerald Waugh wrote:
> +	#include <errno.h>
>
>            rdsocks = select(hs+1, &socks, (fd_set *) 0,
>             (fd_set *) 0, &timeout);
>
> -          if (rdsocks < 0) {
> +          if (rdsocks < 0 && errno != EINTR) {
>
>                    perror("select");
>                    continue;
>                    //  exit(EXIT_FAILURE);
>            }
>
> > I commented out the exit(EXIT_FAILURE); and added continue;
> > but I still get   " select: Interrupted system call ", it keeps running
> > and managing the connections...
> > Seems like I should be able to find out whats causing it,
> > Interrupted system call   Does not seem to tell me much.
> You should handle this case rather than trying to prevent it.
>
> Prevention is fragile; if the program is subsequently changed to catch
> a new signal (possibly via a library function), the problem will
> re-appear.
>
> Handling this case will ensure that the program is robust. Terminating
> due to transient errors isn't a good idea.

I was testing to see if I could keep it going, I did similar to your 
suggestion:
Only I did  if (rdsocks < 0 && rdsocks != EINTR)  {
And I was still getting  a printout of  " select: Interrupted system call "
Now I'll try 
if (rdsocks < 0 && errno != EINTR) {

I would really like to know why select()
gets that  Interrupted system call


-- 
Gerald Waugh : Registered Linux user # 255245
http://www.frontstreetnetworks.com
Front Street Networks LLC - ph. 203.785.0699
229 Front Street, Ste. #C, New Haven, CT, United States of America
4:32pm up 36 days, 23:59, 3 users, load average: 0.80, 1.14, 1.27
