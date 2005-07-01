From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Problem with pointer to external function
Date: Fri, 1 Jul 2005 13:17:26 +0200
Message-ID: <6a00c8d505070104172be85b4c@mail.gmail.com>
References: <20050701103026.GA2965@paktahn.black.cat>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050701103026.GA2965@paktahn.black.cat>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "leslie.polzer@gmx.net" <leslie.polzer@gmx.net>
Cc: linux-c-programming@vger.kernel.org

On 7/1/05, leslie.polzer@gmx.net <leslie.polzer@gmx.net> wrote:
> Hello list,

Hi Leslie

> why do it get the segfault below? What's wrong?

See below...
 
> 
> [sky@paktahn ~/code/cbtest]% cat main.c
> #include <stdio.h>
> 
> typedef void (*callback)();
> 
> extern callback cb;
> 
> int
> main (int argc, char** argv)
> {
>         cb();
> 
>         return(0);
> }
> 

Your code can be corrected easily,  Can you see the difference between
the following two typedefs and their usage?  Both versions work as
expected:

#include <stdio.h>

typedef void callback();
typedef void (*callback2)();

extern callback cb;
extern callback cb2;

int main (int argc, char** argv)
{
	cb();
	(*cb2)();

	return(0);
}

You can simplify your code like this:

extern void cb();
void (*callback)() = cb;

Remember: function names are pointers.  That's why the following two
assignments are equally legal and do the same thing:

int myfunc(int a, int b) { return a + b; }

/* pointer to a function that takes two arguments */
int (*p)(int a, int b) = NULL;
p = myfunc;  /* p points to myfunc now */
p = &myfunc; /* this way is recommended */

I usally encourage people not to combine typdefs and function pointers
because they are often misleading and reduce readability of code.  C
has everything on board to implement and use callbacks without the
need to define new types.

Kind Regards

    \Steve

--

Steve Graegert <graegerts@gmail.com> || <http://www.technologies.de/~sg/>
Independent Software Consultant {C/C++ && Java && .NET}
Mobile: +49 (176)  21 24 88 69
Office: +49 (9131) 71 26 40 9
