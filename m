From: "Matthew Studley" <matthew.studley@uwe.ac.uk>
Subject: Re: mixing C/C++
Date: Mon, 10 Nov 2003 15:00:31 -0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <003301c3a79b$643573e0$caba0ba4@uwe.ac.uk>
References: <20031108093029.GB802@velka.phys.uoa.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Elias Athanasopoulos <elathan@phys.uoa.gr>, linux-c-programming@vger.kernel.org

Have you considered using SWIG to automatically generate your wrappers?

... SWIG is a software development tool that connects programs written in C
and C++ with a variety of high-level programming languages. SWIG is
primarily used with common scripting languages such as Perl, Python, Tcl/Tk,
and Ruby...

http://www.swig.org/

May be a useful resource.  I've used it with C and Python.

regards

Matt

----- Original Message -----
From: Elias Athanasopoulos <elathan@phys.uoa.gr>
To: <linux-c-programming@vger.kernel.org>
Sent: Saturday, November 08, 2003 9:30 AM
Subject: mixing C/C++


> Hello!
>
> I want to create Ruby bindings for a C++ project, so my first
> step is to call C++ code from C, since Ruby has a plain C API.
>
> Consider I have a Foo class which its implementation is compiled
> in a shared lib (libtest.so). I have a second wrapper lib:
>
> #include "libtest.h"
>
> extern "C" class Foo *  wrap_foo_ctor() { return new Foo(); }
> extern "C" void wrap_foo_set_food(Foo *f, int i) { f->set_food(i); }
> extern "C" int  wrap_foo_hello(Foo *f) { return f->hello();  }
>
> Using the above my C program is:
>
> #include <stdio.h>
> #include <stdlib.h>
>
> int main(void)
> {
>   struct Foo *m = (struct Foo*) wrap_foo_ctor();
>
>   wrap_foo_set_food(m, 10);
>   wrap_foo_hello(m);
>
>   free(m);
>
>   return 1;
> }
>
> And:
>
> elathan@velka:~/src/bindings> gcc foo.c -Wall  -ltest -lwrap -o
foo -L/home/elathan/src/bindings
> foo.c: In function `main':
> foo.c:6: warning: implicit declaration of function `wrap_foo_ctor'
> foo.c:8: warning: implicit declaration of function `wrap_foo_set_food'
> foo.c:9: warning: implicit declaration of function `wrap_foo_hello'
> elathan@velka:~/src/bindings> ./foo
> 10
>
>
> My main question is how to silent the implicit declaration warning in
> gcc, which is, of course, correct. I want everything to compile
with -Wall.
> Is there a warkaround?
>
> I tried to create a C header file, but I don't know how to make a C
prototype
> of:
>
>  class Foo *  wrap_foo_ctor() { return new Foo(); }
>
> Or silent the 'icompatible pointer type' warning in declarations, such as:
>
>  int  wrap_foo_hello(Foo *f) { return f->hello();  }
>
> TIA,
> --
> University of Athens I bet the human brain
> Physics Department is a kludge --Marvin Minsky
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
> This incoming email to UWE has been independently scanned for viruses and
any virus detected has been removed using McAfee anti-virus software
>
>
>

