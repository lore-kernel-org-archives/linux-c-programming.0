From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: What is the use of extern inline?
Date: Mon, 4 Jun 2007 08:01:27 +0100
Message-ID: <18019.47303.745646.965225@cerise.gclements.plus.com>
References: <465BA2CE.9060609@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <465BA2CE.9060609@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> In man:gcc under -fkeep-inline-functions I first came across the usag=
e=20
> of "extern inline". For normal functions, extern declares that the=20
> function exists elsewhere. But this does not seem to work for inline=20
> functions:
>=20
> lib.cpp:

Note that way in which "inline" is handled differs between C and C++.

> ---------------------------------------
> inline int foo ( void ) { return 2 ; }
> ---------------------------------------
>=20
> main.cpp:
> ---------------------------------------
> # include <cstdio>
> extern inline int foo ( void ) ;
> int main ( void ) {
> 	printf ( "%d\n", foo () ) ;
> }
> ---------------------------------------
>=20
> $ g++ -c main.cpp lib.cpp
> main.cpp:3: warning: inline function =1B-F=A1int foo()=A2 used but ne=
ver defined=1B-A
> $ g++ -o main main.o lib.o
> main.o: In function `main':
> main.cpp:(.text+0x12): undefined reference to `foo()'
> collect2: ld returned 1 exit status
> $
>=20
> nm on lib.o returned absolutely nothing! Apparently code for an inlin=
e=20
> function is not produced if it is never called.

True for C++, not for C.

> If it is called, and it=20
> is not labeled static inline, then it is both inlined and compiled=20
> separately. Strange, but ok.
>=20
> So I tried adding a dummy function to lib.cpp calling foo() just to m=
ake=20
> it get compiled. Then compiling main.cpp gave the same warning as abo=
ve,=20
> but linking and execution went on ok.
>=20
> But I discovered that I don't need to have the inline keyword in the=20
> declaration of foo() in main.cpp. In fact, removing the inline keywor=
d=20
> allows compilation without warning.
>=20
> So what is the *unique* use of extern inline? I mean, where we cannot=
 do=20
> without it?

"extern inline" is meaningless. You can only inline functions which
occur in the current translation unit.

--=20
Glynn Clements <glynn@gclements.plus.com>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
