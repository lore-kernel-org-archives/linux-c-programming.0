From: Steve Graegert <graegerts@gmail.com>
Subject: Re: default function parameters
Date: Fri, 9 Sep 2005 11:34:23 +0200
Message-ID: <6a00c8d505090902345d74646c@mail.gmail.com>
References: <dfr8v1$kn7$1@sea.gmane.org>
	 <6a00c8d505090823472706ba98@mail.gmail.com>
	 <dfrc52$rro$1@sea.gmane.org>
	 <6a00c8d505090900364f76dcfd@mail.gmail.com>
	 <dfri55$cse$1@sea.gmane.org>
Reply-To: graegerts@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <dfri55$cse$1@sea.gmane.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: _z33 <timid.Gentoo@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On 9/9/05, _z33 <timid.Gentoo@gmail.com> wrote:
> Steve Graegert wrote:
> 
> > Unless you're writing a compiler this does not matter.  Even if an int
> > argument in implicitly used it has no meaning to the programmer.
> > Since void is a well defined type, although an incomplete one, I have
> > doubts that int is used internally.  I simply can't see the rationale
> > behind that (but I'd be happy to be enlightened).  Could you please
> > try to transport your collegue's argumentation?
> 
> Here is what he sent me -
> 
>        #include <stdio.h>
> 
>        void add ()
>        {
>             printf ("inside function: add. \n");
> 
>             return;
>        }
> 
>        int main (void)
>        {
>            /* call function add with some parameters */
>            add (5, 1);
> 
>            system ("PAUSE");
> 
>            return (0);
>        }

add is defined as a function that can take an arbitrary number of
arguments, since no args are defined (not even void).

OK, so what happens here?  Calling add with an arbitrary number of
arguments is fairly legal, but since no prototype is declared and no
arguments are defined for add, the arguments are discarded (i.e.
nothing is pushed on the stack).

I have modified the code to clarify my thoughts:

	#include <stdio.h>

	/* prototype */
	void add(); /* call with arbitrary number of arguments */

	void add (int a, int b, int c) {
		printf ("inside function: add(%d, %d)\n", a, b);
		return;
	}

	int main (void) {
		/* call function add with some parameters */
		add(5, 1);
		getc(stdin);

		return (0);
	}

Do you see the difference?  No warning is issued, because there is
nothing wrong with it (it is not recommended by ANSI C99 but still
valid).

>   How can this work, if not specifying any argument, is equivalent to
> specifying as void?

What we see here is the "old" style of using some kind of variadic
functions.  Specifying void here indicates we do not intend to use the
old style, but ANSI C instead.  The compiler is smart enough and does
not issue a warning.

>   However, one thing I was able observe was that it accepts any kind of
> arguments, and also any number of arguments, as against his theory of
> only accepting "int" types.

As stated above: this is the old pre-ANSI C style and legal.  When no
args are specified or void is given, nothing is pushed on the stack
and no register hold arguments.

>   I even tried compiling with "-Wall" option to see if any warnings are
> being thrown by the compiler, but found to my disappointment that there
> was none.

Because there is nothing wrong with it.

>   Am I fundamentally going wrong in my understanding of functions?

No you're not.  You're just curious :-)

Regards

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultancy {C/C++ && Java && .NET}
Mobile: +49 (176)  21248869
Office: +49 (9131) 7126409
