From: Elias Athanasopoulos <elathan@phys.uoa.gr>
Subject: mixing C/C++
Date: Sat, 8 Nov 2003 11:30:29 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20031108093029.GB802@velka.phys.uoa.gr>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello!

I want to create Ruby bindings for a C++ project, so my first
step is to call C++ code from C, since Ruby has a plain C API.

Consider I have a Foo class which its implementation is compiled
in a shared lib (libtest.so). I have a second wrapper lib:

#include "libtest.h"

extern "C" class Foo *  wrap_foo_ctor() { return new Foo(); }
extern "C" void wrap_foo_set_food(Foo *f, int i) { f->set_food(i); }
extern "C" int  wrap_foo_hello(Foo *f) { return f->hello();  }

Using the above my C program is:

#include <stdio.h>
#include <stdlib.h>

int main(void)
{
  struct Foo *m = (struct Foo*) wrap_foo_ctor();

  wrap_foo_set_food(m, 10);
  wrap_foo_hello(m);

  free(m);

  return 1;
}

And:

elathan@velka:~/src/bindings> gcc foo.c -Wall  -ltest -lwrap -o foo -L/home/elathan/src/bindings
foo.c: In function `main':
foo.c:6: warning: implicit declaration of function `wrap_foo_ctor'
foo.c:8: warning: implicit declaration of function `wrap_foo_set_food'
foo.c:9: warning: implicit declaration of function `wrap_foo_hello'
elathan@velka:~/src/bindings> ./foo
10


My main question is how to silent the implicit declaration warning in
gcc, which is, of course, correct. I want everything to compile with -Wall. 
Is there a warkaround? 

I tried to create a C header file, but I don't know how to make a C prototype
of:

 class Foo *  wrap_foo_ctor() { return new Foo(); }

Or silent the 'icompatible pointer type' warning in declarations, such as:

 int  wrap_foo_hello(Foo *f) { return f->hello();  }

TIA,
-- 
University of Athens			I bet the human brain 
Physics Department				is a kludge --Marvin Minsky 

	
