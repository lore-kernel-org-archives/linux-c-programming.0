From: Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
Subject: RE: help for using setjmp and longjmp functions
Date: Mon, 20 Dec 2004 13:24:54 +0530
Message-ID: <1103529293.4005.5.camel@myLinux>
References: <50C05B7AA7D6924FB5E384EF14BC647B495EE4@inba1mx2.corp.emc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <50C05B7AA7D6924FB5E384EF14BC647B495EE4@inba1mx2.corp.emc.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Honnavalli_Sreevathsa@emc.com
Cc: Linux C Programming <linux-c-programming@vger.kernel.org>

Yes I got it.....Thanks
On Mon, 2004-12-20 at 13:15, Honnavalli_Sreevathsa@emc.com wrote:
> Try this modified code. Hope its self explanatory. (This program does not
> demonstrate the best usage of setjmp/longjmp anyway. But ok for
> understanding the usage)
> 
> 
> #include <setjmp.h>
> jmp_buf jmpbuffer;
> 
> void bar(void)
> {
>         sleep(1);
>         printf("inside bar\n");
>         longjmp(jmpbuffer, 1);
> }
> 
> void foo(void)
> {
>         printf("before calling bar()\n");
>         bar();
>         printf("after calling bar()\n");
> }
> 
> int
> main(void)
> {
>         printf("before calling foo()\n");
>         if(setjmp(jmpbuffer))
>         {
>                 printf("returned back from longjmp\n");
>                 goto done;
>         }
>         foo();
> 
> done:
>         printf("after foo()\n");
>         printf("\n-------------------------------------\n");
> 
>         return 0;
> }
> 
> 
> 
> 
> 
> > -----Original Message-----
> > From: linux-c-programming-owner@vger.kernel.org 
> > [mailto:linux-c-programming-owner@vger.kernel.org] On Behalf 
> > Of Jagadeesh Bhaskar P
> > Sent: Monday, December 20, 2004 12:38 PM
> > To: Linux C Programming
> > Subject: help for using setjmp and longjmp functions
> > 
> > Hi,
> > 	I tried writing a simple program to findout usage of setjmp and
> > longjmp() functions. The program ran in an infinite loop showing some
> > warnings. What is the problem? Can someone help me depicting the
> > behaviour of the setjmp and longjmp functions
> > 
> > /******** beginning of code *************/
> > 
> > #include <setjmp.h>
> > jmp_buf jmpbuffer;
> > 
> > void bar(void)
> > {
> > 	printf("inside bar\n");
> > 	longjmp(jmpbuffer, 1);
> > }
> > 
> > void foo(void)
> > {
> > 	printf("before calling bar()\n");
> > 	bar();
> > 	printf("after calling bar()\n");
> > }
> > int
> > main(void)
> > {
> > 	printf("before calling foo()\n");
> > 	if(setjmp(jmpbuffer)!=0)
> > 		perror("error setting");
> > 	foo();
> > 	printf("after foo()\n");
> > 
> > 	return 0;
> > }
> > /**************** end of code ***********/
> > 
> > Hoping for help
> > 
> > TIA..
> > 
> > -- 
> > With regards,
> > 
> > Jagadeesh Bhaskar P
> > 
> > -
> > To unsubscribe from this list: send the line "unsubscribe 
> > linux-c-programming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > 
-- 
Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>

