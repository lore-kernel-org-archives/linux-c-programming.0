From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: why right-to-left evaluation in printf argument list?
Date: Fri, 25 May 2007 23:54:23 +0100
Message-ID: <18007.26911.40764.322915@cerise.gclements.plus.com>
References: <46551469.4080103@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <46551469.4080103@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <jamadagni@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> For you people this is probably old hat but none of my book sources 
> explain the C / C++ idiosyncrasy of evaluating arguments of printf (and 
> maybe other functions too, I don't know) from right-to-left. For 
> instance, the following code:
> 
> # include <stdio.h>
> void main ( void )
> {
> 	int i = 0 ;
> 	printf ( "%d %d\n", i ++, i ++ ) ;
> }
> 
> prints out:
> 
> 1 0
> 
> instead of:
> 
> 0 1
> 
> as expected. I remember having heard of this years ago and got around to 
> testing it today, but I don't get the logic behind this behaviour. Is 
> there one? If yes, what is it?

Function calls (for all functions, not just variadic functions such as
printf) are typically implemented by evaluating arguments
right-to-left, pushing each value onto the stack as it is calculated,
then calling the function's start address with a CALL/JSR/BL/etc
instruction (which saves the current PC/IP somewhere then jumps to the
specified address).

The result is that the function's arguments are stored at increasing
addresses when read left-to-right.

This allows for variadic functions, where the function knows where to
find the first argument, but has to determine for itself how many
arguments are present.

Note that this evaluation order isn't dictated by any standard; it's
an implementation detail. If you use side-effects in the arguments to
a function call such that the values depend upon the evaluation order,
the result is implementation-dependent.

-- 
Glynn Clements <glynn@gclements.plus.com>
