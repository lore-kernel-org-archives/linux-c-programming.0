From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: pass a local variable to a function
Date: Thu, 26 Mar 2009 08:42:53 +0000
Message-ID: <18891.16397.441242.529444@cerise.gclements.plus.com>
References: <56b13acf0903250921w1934942bma7280055c97a9db3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <56b13acf0903250921w1934942bma7280055c97a9db3@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?ISO-2022-JP?B?GyRCTEBOPBsoQg==?= <longapple@gmail.com>
Cc: linux-c-programming@vger.kernel.org


=E6=98=8E=E4=BA=AE wrote:

> This is my first email in this list, any help is much appreciated.
> As I know, it's not allowed to pass a local variable to a function,
> because the stack where local variable resides will be reused by othe=
r
> functions.

It's perfectly acceptable to pass a local variable to or from a
function. It's also acceptable to pass the address of a local variable
to a function.

What isn't acceptable is returning the address of a local variable
from a function, as the variable will cease to exist once the function
returns.

> eg:
> =C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0 #include <stdio.h>
> =C2=A0=C2=A0=C2=A0=C2=A0 2
> =C2=A0=C2=A0=C2=A0=C2=A0 3=C2=A0 char *fetch();
> =C2=A0=C2=A0=C2=A0=C2=A0 4
> =C2=A0=C2=A0=C2=A0=C2=A0 5=C2=A0 int main(int argc, char *argv[]){
> =C2=A0=C2=A0=C2=A0=C2=A0 6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 char *string;
> =C2=A0=C2=A0=C2=A0=C2=A0 7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 string =3D fetch();
> =C2=A0=C2=A0=C2=A0=C2=A0 8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 printf("%s\n", string);
> =C2=A0=C2=A0=C2=A0=C2=A0 9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 exit(0);
> =C2=A0=C2=A0=C2=A0 10=C2=A0 }
> =C2=A0=C2=A0=C2=A0 11
> =C2=A0=C2=A0=C2=A0 12=C2=A0 char *fetch(){
> =C2=A0=C2=A0=C2=A0 13=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 char string[10];
> =C2=A0=C2=A0=C2=A0 14 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 scanf("%s", string);
> =C2=A0=C2=A0=C2=A0 15 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return string;

This returns the address of the local variable "string", which isn't
valid.

> =C2=A0=C2=A0=C2=A0 16=C2=A0 }
>=20
> When the application is executed, after input "a", it will produce
> unknown characters, like "8=EF=BF=BD=C3=A8=C2=BF=C3=B4=C3=BFO". Which=
 is like what I expect
>=20
> However, if I change line 13 to:
> =C2=A0=C2=A0=C2=A0 13=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 char string[1024];
>=20
> When I type "a", it echos "a", which is out of my expectation
>=20
> Why does it behave like this?

Making the array larger means that the start address is further down
the stack (most common architectures use a descending stack). The
printf() call is presumably using less than 1K of stack, so it doesn't
overwrite the variable.

This won't work if the platform uses an ascending stack, or if it
returns unused stack memory to the OS, or if printf() uses more than
1K for local variables (directly or indirectly), or if the
architecture handles signals, interrupts, etc using the same stack as
the main thread. There are other possible reasons why it may fail.

If you want to understand the internals of program execution, learn
assembly language and examine the disassembled code.

--=20
Glynn Clements <glynn@gclements.plus.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
