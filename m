From: James Stevenson <james@stev.org>
Subject: Re: mixing C/C++
Date: Sat, 8 Nov 2003 13:36:55 +0000 (GMT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0311081335520.29371-100000@god.stev.org>
References: <20031108093029.GB802@velka.phys.uoa.gr>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20031108093029.GB802@velka.phys.uoa.gr>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Elias Athanasopoulos <elathan@phys.uoa.gr>
Cc: linux-c-programming@vger.kernel.org


Hi

this is because you program doesnt know what the functions
are called so you need to add protypes.

Either create a  header and put a prototype of the
function name in there and include the header file

or

add the prototypes to the top of the C file.

	James

On Sat, 8 Nov 2003, Elias Athanasopoulos wrote:

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
> elathan@velka:~/src/bindings> gcc foo.c -Wall  -ltest -lwrap -o foo -L/home/elathan/src/bindings
> foo.c: In function `main':
> foo.c:6: warning: implicit declaration of function `wrap_foo_ctor'
> foo.c:8: warning: implicit declaration of function `wrap_foo_set_food'
> foo.c:9: warning: implicit declaration of function `wrap_foo_hello'
> elathan@velka:~/src/bindings> ./foo
> 10
> 
> 
> My main question is how to silent the implicit declaration warning in
> gcc, which is, of course, correct. I want everything to compile with -Wall. 
> Is there a warkaround? 
> 
> I tried to create a C header file, but I don't know how to make a C prototype
> of:
> 
>  class Foo *  wrap_foo_ctor() { return new Foo(); }
> 
> Or silent the 'icompatible pointer type' warning in declarations, such as:
> 
>  int  wrap_foo_hello(Foo *f) { return f->hello();  }
> 
> TIA,
> 

