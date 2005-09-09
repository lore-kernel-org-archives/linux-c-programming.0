From: _z33 <timid.Gentoo@gmail.com>
Subject: Re: default function parameters
Date: Fri, 09 Sep 2005 15:14:00 +0530
Message-ID: <dfrlh3$mqv$1@sea.gmane.org>
References: <dfr8v1$kn7$1@sea.gmane.org>	 <6a00c8d505090823472706ba98@mail.gmail.com>	 <dfrc52$rro$1@sea.gmane.org>	 <6a00c8d505090900364f76dcfd@mail.gmail.com>	 <dfri55$cse$1@sea.gmane.org> <6a00c8d505090902345d74646c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d505090902345d74646c@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Steve Graegert wrote:
> I have modified the code to clarify my thoughts:
> 
> 	#include <stdio.h>
> 
> 	/* prototype */
> 	void add(); /* call with arbitrary number of arguments */
> 
> 	void add (int a, int b, int c) {
> 		printf ("inside function: add(%d, %d)\n", a, b);
> 		return;
> 	}
> 
> 	int main (void) {
> 		/* call function add with some parameters */
> 		add(5, 1);
> 		getc(stdin);
> 
> 		return (0);
> 	}
> 
> Do you see the difference?  No warning is issued, because there is
> nothing wrong with it (it is not recommended by ANSI C99 but still
> valid).
> 

   Inside "main", did you mean to write the function call as " add (5, 
1, <some number>); ". Cos' when I copy the code, and try to run it, it 
throws me this error message during compilation.
   - too few arguments to function `add'-

>>  Am I fundamentally going wrong in my understanding of functions?
> 
> 
> No you're not.  You're just curious :-)

Thanks!


_z33
-- 
I love TUX; well... that's an understatement :)

