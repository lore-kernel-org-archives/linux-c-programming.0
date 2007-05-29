From: Shriramana Sharma <samjnaa@gmail.com>
Subject: What is the use of extern inline?
Date: Tue, 29 May 2007 09:19:34 +0530
Message-ID: <465BA2CE.9060609@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

In man:gcc under -fkeep-inline-functions I first came across the usage=20
of "extern inline". For normal functions, extern declares that the=20
function exists elsewhere. But this does not seem to work for inline=20
functions:

lib.cpp:
---------------------------------------
inline int foo ( void ) { return 2 ; }
---------------------------------------

main.cpp:
---------------------------------------
# include <cstdio>
extern inline int foo ( void ) ;
int main ( void ) {
	printf ( "%d\n", foo () ) ;
}
---------------------------------------

$ g++ -c main.cpp lib.cpp
main.cpp:3: warning: inline function =E2=80=98int foo()=E2=80=99 used b=
ut never defined
$ g++ -o main main.o lib.o
main.o: In function `main':
main.cpp:(.text+0x12): undefined reference to `foo()'
collect2: ld returned 1 exit status
$

nm on lib.o returned absolutely nothing! Apparently code for an inline=20
function is not produced if it is never called. If it is called, and it=
=20
is not labeled static inline, then it is both inlined and compiled=20
separately. Strange, but ok.

So I tried adding a dummy function to lib.cpp calling foo() just to mak=
e=20
it get compiled. Then compiling main.cpp gave the same warning as above=
,=20
but linking and execution went on ok.

But I discovered that I don't need to have the inline keyword in the=20
declaration of foo() in main.cpp. In fact, removing the inline keyword=20
allows compilation without warning.

So what is the *unique* use of extern inline? I mean, where we cannot d=
o=20
without it?

Shriramana Sharma.

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
