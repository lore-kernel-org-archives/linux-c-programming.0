From: "Jamie Risk" <jamie_risk@yahoo.ca>
Subject: Re: integrating c code and c++ code
Date: Thu, 2 Jan 2003 11:24:21 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <av1p1u$aog$1@main.gmane.org>
References: <004601c2acf2$a442cea0$70ab88c1@ieeta.pt> <15883.27533.81795.913324@cerise.nosuchdomain.co.uk>
Reply-To: "Jamie Risk" <jamie_risk@yahoo.ca>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

It's also useful to surround your c code with "extern c { ... code ... }"
when compiling c files with a cpp compiler. Doing so will avoid confusion
when calling C routines compiled by a cpp compiler from C routines compiled
by a C compiler (name mangling issues).
More useful still try:

#ifdef __c_plus_plus /* Check this macro defnition, it's a close variant of
this */
extern c
{
#endif
int myfunc(int a);

int myfunc(int a)
{
  ...
}

#ifdef __c_plus_plus
}
#endif




"Glynn Clements" <glynn.clements@virgin.net> wrote in message
news:15883.27533.81795.913324@cerise.nosuchdomain.co.uk...
>
> qhwang wrote:
>
> > Does anyone have experience of integrating c code together with c++
code? I
> > know it may be unusual but I need to do it.
>
> It isn't at all unusual to integrate C++ with C. However, calling C
> from C++ is a lot easier than calling C++ from C.
>
> > The case is, I need to integrate
> > some well defined c++ wavelet classes into my c application, but I don't
> > have enough time to rewrite the wavelet classes in plain c. So how can I
do
> > it? Any help or further pointer will be greatly appreciated. Many
thanks.
>
> You can't call C++ methods from C, only plain functions. If you want
> to call methods, you must write wrapper functions; such functions must
> use C linkage.
>
> A simple example is attached.
>
> --
> Glynn Clements <glynn.clements@virgin.net>
>
>


----------------------------------------------------------------------------
----


> /* private.h */
>
> class foo
> {
> public:
> void bar(void);
> };
>
>


----------------------------------------------------------------------------
----


> /* public.h */
>
> #ifdef __cplusplus
> extern "C" {
> #endif
>
> extern void *new_foo(void);
> extern void foo_bar(void *);
>
> #ifdef __cplusplus
> }
> #endif
>
>


----------------------------------------------------------------------------
----


> /* foo.cpp */
>
> #include <iostream.h>
> #include "private.h"
> #include "public.h"
>
> void foo::bar(void)
> {
> cout << "hello, world" << endl;
> }
>
> void foo_bar(void *f)
> {
> ((foo *) f)->bar();
> }
>
> void *new_foo(void)
> {
> return (void *) new foo;
> }
>
>


----------------------------------------------------------------------------
----


> /* main.c */
>
> #include "public.h"
>
> int main(void)
> {
> void *f = new_foo();
> foo_bar(f);
> return 0;
> }
>
>




