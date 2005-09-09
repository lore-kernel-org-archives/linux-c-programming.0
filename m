From: Steve Graegert <graegerts@gmail.com>
Subject: Re: default function parameters
Date: Fri, 9 Sep 2005 11:42:06 +0200
Message-ID: <6a00c8d505090902423829d051@mail.gmail.com>
References: <dfr8v1$kn7$1@sea.gmane.org>
	 <6a00c8d505090823472706ba98@mail.gmail.com>
	 <dfrc52$rro$1@sea.gmane.org>
	 <6a00c8d505090900364f76dcfd@mail.gmail.com>
	 <dfri55$cse$1@sea.gmane.org> <dfrkb4$j56$1@sea.gmane.org>
Reply-To: graegerts@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <dfrkb4$j56$1@sea.gmane.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jarmo <SVisor@lycos.com>
Cc: linux-c-programming@vger.kernel.org

On 9/9/05, Jarmo <SVisor@lycos.com> wrote:
> There is a diff in how C and C++ sees this.
> 
> For C add( ) is an function taking undefined argument(s), so you can
> send it whatever you want. C++ on other hand will see add( ) as add(
> void ), and would complain. To say that add( ) would be equal to add(
> int(s) ) is bogus thou.

Exactly.  A point I have missed to mention.  Thanks.

> Thou *I think* even the C compiler should have given a
> warning. (Note -Wall does not turn on all warnings, just almost all).

try -ansi combined with -pedantic.

> >> Unless you're writing a compiler this does not matter.  Even if an int
> >> argument in implicitly used it has no meaning to the programmer. Since
> >> void is a well defined type, although an incomplete one, I have
> >> doubts that int is used internally.  I simply can't see the rationale
> >> behind that (but I'd be happy to be enlightened).  Could you please
> >> try to transport your collegue's argumentation?
> >
> > Here is what he sent me -
> >
> >     #include <stdio.h>
> >
> >     void add ()
> >     {
> >          printf ("inside function: add. \n");
> >
> >          return;
> >     }
> >
> >     int main (void)
> >     {
> >         /* call function add with some parameters */
> >         add (5, 1);
> >
> >         system ("PAUSE");
> >
> >         return (0);
> >     }
> >
> >   How can this work, if not specifying any argument, is equivalent to
> > specifying as void?
> >   However, one thing I was able observe was that it accepts any kind of
> > arguments, and also any number of arguments, as against his theory of
> > only accepting "int" types.
> >   I even tried compiling with "-Wall" option to see if any warnings are
> > being thrown by the compiler, but found to my disappointment that there
> > was none.
> >   Am I fundamentally going wrong in my understanding of functions?
> >
> > _z33
>
