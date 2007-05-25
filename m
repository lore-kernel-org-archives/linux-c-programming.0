From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: Function pointers to inline functions
Date: Fri, 25 May 2007 11:32:10 +0530
Message-ID: <46567BE2.4010401@gmail.com>
References: <4613DBC2.8060708@gmail.com> <17939.60731.269679.612012@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17939.60731.269679.612012@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

Glynn Clements wrote:
>      run-time callable version of the function.  This switch does not
>      affect `extern inline' functions.

What would be the purpose of "extern inline"?

I mean, inlining is done by the compiler, and extern is only useful to=20
tell the linker to resolve references to a variable or function that is=
=20
initially defined in another object file.

I tried putting an inline function *definition* in lib.cpp:

inline int foo ( void ) { return 2 ; }

and a *declaration* to that function qualified by extern inline in main=
=2Ecpp:

# include <cstdio>
extern inline int foo ( void ) ;
int main ( void )
{
         printf ( "%d\n", foo () ) ;
}

The session transcript:

$ g++ -c main.cpp lib.cpp
main.cpp:3: warning: inline function =91int foo()=92 used but never def=
ined
$ g++ -o main main.o lib.o
main.o: In function `main':
main.cpp:(.text+0x12): undefined reference to `foo()'
collect2: ld returned 1 exit status
$

So extern for inline functions does not work as for normal functions --=
=20
so what is the use of extern inline?

Shriramana Sharma.

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
