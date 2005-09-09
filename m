From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: default function parameters
Date: Fri, 9 Sep 2005 14:00:49 +0100
Message-ID: <17185.34689.658010.292201@cerise.gclements.plus.com>
References: <dfr8v1$kn7$1@sea.gmane.org>
	<6a00c8d505090823472706ba98@mail.gmail.com>
	<dfrc52$rro$1@sea.gmane.org>
	<6a00c8d505090900364f76dcfd@mail.gmail.com>
	<dfri55$cse$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <dfri55$cse$1@sea.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: _z33 <timid.Gentoo@gmail.com>
Cc: linux-c-programming@vger.kernel.org


_z33 wrote:

> > Unless you're writing a compiler this does not matter.  Even if an int
> > argument in implicitly used it has no meaning to the programmer. 
> > Since void is a well defined type, although an incomplete one, I have
> > doubts that int is used internally.  I simply can't see the rationale
> > behind that (but I'd be happy to be enlightened).  Could you please
> > try to transport your collegue's argumentation?
> 
> Here is what he sent me -
> 
> 	#include <stdio.h>
> 	
> 	void add ()
> 	{	
> 	     printf ("inside function: add. \n");
>       	
> 	     return;
> 	}
> 
> 	int main (void)
> 	{
> 	    /* call function add with some parameters */
> 	    add (5, 1);
>      	
> 	    system ("PAUSE");
> 	
> 	    return (0);
> 	}
> 
>    How can this work, if not specifying any argument, is equivalent to 
> specifying as void?

It isn't.

>    However, one thing I was able observe was that it accepts any kind of 
> arguments, and also any number of arguments, as against his theory of 
> only accepting "int" types.
>    I even tried compiling with "-Wall" option to see if any warnings are 
> being thrown by the compiler, but found to my disappointment that there 
> was none.
>    Am I fundamentally going wrong in my understanding of functions?

The original K&R C didn't have function prototypes.

When you call a function, the arguments are first subject to the
default conversions (i.e. arguments smaller than int, or
floating-point arguments smaller than double are expanded to a more
"normal" size).

Then, all of the arguments are pushed onto the stack in right-to-left
order (so the arguments, read left-to-right, are at increasing
locations in memory). The function is called by pushing the return
address onto the stack, then jumping to the function's start address,
usually with a "call" or "jsr" (jump-to-subroutine) instruction.

When the function returns, the stack pointer is returned to its
previous value, effectively removing the arguments from the stack.

From the perspective of the caller, it doesn't matter what arguments
the function is supposed to accept; it just passes whatever you give
it.

From the perspective of the function itself, the caller had better
have pushed all of the necessary arguments onto the stack, otherwise
the argument variables will end up containing whatever data happened
to be on the stack at that point. However, it won't matter if the
caller pushed extra arguments onto the stack.

ANSI C added function prototypes, which allows the compiler to check
that the correct number and types of arguments are passed (or
implicitly cast the arguments to the correct types). It also added the
ellipsis ("...") to bypass the type-checking in the case where a
function can take additional arguments whose number and types aren't
known at compile time.

-- 
Glynn Clements <glynn@gclements.plus.com>
