From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Question on SIGSEGV / Stack growth
Date: Wed, 1 Mar 2006 16:37:19 +0000
Message-ID: <17413.52671.115426.263908@cerise.gclements.plus.com>
References: <3100473D52017B48B9068E079BE2A6E664C821@ZMY16EXM67.ds.mot.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3100473D52017B48B9068E079BE2A6E664C821@ZMY16EXM67.ds.mot.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gvks Satish-A14577 <satish.k@motorola.com>
Cc: linux-c-programming@vger.kernel.org


Gvks Satish-A14577 wrote:

> I have a question regarding SIGSEGV in the context of process stack
> growth. I have the 
> following piece of code.
>  
> #include<stdio.h>
> main()
> {
>     char *ptr;
>     char i=10;
>     int j;
>     ptr = &i;
>     for(j=0; j<3000; j++)
>         printf("%d -- %d\n",j, *(ptr+j));
> }
>  
> I was expecting that the program will get a SIGSEGV immediately after
> the first iteration of the for loop, since that
> address doesn't belong to the process address space.

It almost certainly does belong to the process' address space. Exactly
what is at that address is undefined, but it's unlikely that it's
actually invalid.

> But it didn't
> happen. Then I thought that the stack is allocated 
> in terms of pages and hence thought that I'll get SIGSEGV after a PAGE
> size. Even that didn't happen.
>  
> The program got SIGSEGV at different values of j on different OS. On
> linux it occured at 1896. 
>  
> I looked at the getrlimit value of stack size. Even that didn't match
> with the value where I got SIGSEGV.
>  
> Any idea what's happening ?

The stack grows downward, but your loop is moving upward. The value of
j when the segfault occurs will depend upon the position of i within
main()'s stack frame, and how much stack was used prior to main()
being entered.

-- 
Glynn Clements <glynn@gclements.plus.com>
