From: Sumit Narayan <talk2sumit@gmail.com>
Subject: Re: Unix Time
Date: Mon, 27 Sep 2004 17:33:57 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1458d96104092714337dbd101b@mail.gmail.com>
References: <20040927051048.25873.qmail@web52902.mail.yahoo.com>
	 <20040927105947.64643.qmail@web52904.mail.yahoo.com>
	 <35fb2e59040927045735974a2a@mail.gmail.com>
Reply-To: Sumit Narayan <talk2sumit@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <35fb2e59040927045735974a2a@mail.gmail.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jonathan@jonmasters.org
Cc: szonyi calin <caszonyi@yahoo.com>, Ankit Jain <ankitjain1580@yahoo.com>, linux prg <linux-c-programming@vger.kernel.org>

You can use ctime() for conversion.

#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int main(){
  time_t a;
  printf("%d = ", time(&a));
  printf("%s\n", ctime(&a));
  return 0;
}

Hope this helps.

--Sumit

On Mon, 27 Sep 2004 12:57:42 +0100, Jon Masters <jonmasters@gmail.com> wrote:
> On Mon, 27 Sep 2004 12:59:47 +0200 (CEST), szonyi calin
> <caszonyi@yahoo.com> wrote:
> 
> > to convert a number of secconds in actual time:
> > a minute has 60 seconds
> > an hour has 60 minutes = 3600 seconds
> > a day has 24 hours = 86400 seconds
> 
> ...but don't use this because over the period of seconds since epoch
> (January 1 1970 is when UNIX began counting time) it'll not take in to
> account leap seconds and the like - so you'll cunningly be out of time
> by a little in every calculation.
> 
> No. Use the standard POSIX time functions instead - e.g. localtime()
> to give you the view of time for where you are in the world.
> 
> Cheers,
> 
> Jon.
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
