From: "C-16 " <pmr17184@students.fct.unl.pt>
Subject: Re: #include problem
Date: Fri, 15 Oct 2004 18:29:56 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200410151729.i9FHTu0h027788@students.fct.unl.pt>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

> On Friday 15 October 2004 11:48 am, C-16 wrote:
> > Howdy,
> > i have a file main.c in my program that needs to include four headers
> > aaa.h , bbb.h ,ccc.h and ddd.h . Each one of these headers need to
> > include another header xxx.h . With this implementation i get a
> > "redefinition" compilation error. How can i solve this problem ? Thanks
> > in advance.
> > -
> > To unsubscribe from this list: send the line "unsubscribe
> > linux-c-programming" in the body of a message to
majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> You want to use whats called header guards.
> 
> -----------------aaa.h----------
> 
> #ifndef AAA_H
> #define AAA_H
> 
> #include "xxx.h"
> 
> ...some code
> 
> #endif
> ----------------end aaa.h---------
> ----------------xxx.h--------------
> 
> #ifndef XXX_H
> #define XXX_H
> 
> .....some code
> 
> #endif
> ----------------end xxx.h----------
> 
> Notice that the endif must be the very last line of the file or you
defeat the 
> whole purpose of header guards. Others may or may not actually call them 
> header guards, but thats the phrase I was taught. Its good practice to 
> *always* use these in your header files. It solves many simple double 
> inclusion and inclusion loop problems.
> 
> ----------------------------------------
> EB
> 
> > All is fine except that I can reliably "oops" it simply by trying to
read
> > from /proc/apm (e.g. cat /proc/apm).
> > oops output and ksymoops-2.3.4 output is attached.
> > Is there anything else I can contribute?
> 
> The latitude and longtitude of the bios writers current position, and
> a ballistic missile.
> 
> 		--Alan Cox 2000-12-08 
> 
It worked !! :) thanks a lot

"Exploration is knowledge"
