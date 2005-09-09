From: Steve Graegert <graegerts@gmail.com>
Subject: Re: default function parameters
Date: Fri, 9 Sep 2005 12:20:49 +0200
Message-ID: <6a00c8d505090903206f2506f3@mail.gmail.com>
References: <dfr8v1$kn7$1@sea.gmane.org>
	 <6a00c8d505090823472706ba98@mail.gmail.com>
	 <dfrc52$rro$1@sea.gmane.org>
	 <6a00c8d505090900364f76dcfd@mail.gmail.com>
	 <dfri55$cse$1@sea.gmane.org>
	 <6a00c8d505090902345d74646c@mail.gmail.com>
	 <dfrlh3$mqv$1@sea.gmane.org>
Reply-To: graegerts@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <dfrlh3$mqv$1@sea.gmane.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: _z33 <timid.Gentoo@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On 9/9/05, _z33 <timid.Gentoo@gmail.com> wrote:
> Steve Graegert wrote:
> > I have modified the code to clarify my thoughts:
> >
> >       #include <stdio.h>
> >
> >       /* prototype */
> >       void add(); /* call with arbitrary number of arguments */
> >
> >       void add (int a, int b, int c) {
> >               printf ("inside function: add(%d, %d)\n", a, b);
> >               return;
> >       }
> >
> >       int main (void) {
> >               /* call function add with some parameters */
> >               add(5, 1);
> >               getc(stdin);
> >
> >               return (0);
> >       }
> >
> > Do you see the difference?  No warning is issued, because there is
> > nothing wrong with it (it is not recommended by ANSI C99 but still
> > valid).
> >
> 
>   Inside "main", did you mean to write the function call as " add (5,
> 1, <some number>); ". Cos' when I copy the code, and try to run it, it
> throws me this error message during compilation.
>   - too few arguments to function `add'-

No, the code given is exactly what I wanted to show. (The code you
provided was Windows code and I tested it under Windows without
complaints.)

Unfortunately, under Linux you cannot switch to "traditional" since it
would clash with libc which is an ISO C library.  Under Solaris
(SPARCWorx) you may want to try -traditional and -fd.  As far as I
know only SunOS and HP-UX (besides Windows) come with a native K&R C
compiler.  All others do prototype checking.

> >>  Am I fundamentally going wrong in my understanding of functions?
> >
> >
> > No you're not.  You're just curious :-)
> 
> Thanks!
>
