From: Marius Nita <marius@cs.pdx.edu>
Subject: Re: [jason@txt.com: Re: Problem with "chars"]
Date: Thu, 18 Jul 2002 02:18:46 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020718021846.A3853@cs.pdx.edu>
References: <75B979779CA1D311808400508B6F40FF05B9BE62@zes06exm01.madrid.ecid.cig.mot.com> <20020718122502.A20298@neutrino.particles.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020718122502.A20298@neutrino.particles.org>; from eathan@otenet.gr on Thu, Jul 18, 2002 at 12:25:02PM +0300
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Thu, Jul 18, 2002 at 12:25:02PM +0300, Elias Athanasopoulos wrote:
> On Thu, Jul 18, 2002 at 09:11:33AM +0200, Alvarez Alberto-AALVARB1 wrote:
> > 	% g++ probo3.c
> > 	probo3.c: In function `int main()':
> > 	probo3.c:7: ANSI C++ forbids implicit conversion from `void *' in assignment
> > 
> > 	while my program is this:
> > 
> > 		#include <stdio.h>
> > 		#include <stdlib.h>
> > 	
> > 		int main()
> > 		{
> > 		  char *aux;
> > 		  aux=calloc(2, sizeof(char));
> > 		}
> > 
> > 	?Does anyone know the reason for this behaviour? I've always thought that C++ and C were almost the same at this kind of stuff.
> 
> No they are not. C permits implicit conversion from void *, C++ forbids 
> it.

Besides, why would you want to use malloc and calloc in c++ programs?
There's a reson that "new" exists. :)

> All we said in this thread is relative to C programmingm *only*.
> 
> Elias
> 
> -- 
> http://gnewtellium.sourceforge.net			MP3 is not a crime.	
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
