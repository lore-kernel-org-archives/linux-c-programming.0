From: Lorenzo Beretta <lory.fulgi@infinito.it>
Subject: Re: pass a local variable to a function
Date: Wed, 25 Mar 2009 18:17:41 +0100
Message-ID: <gqdovn$pku$1@ger.gmane.org>
References: <56b13acf0903250921w1934942bma7280055c97a9db3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <56b13acf0903250921w1934942bma7280055c97a9db3@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-c-programming@vger.kernel.org

=E6=98=8E=E4=BA=AE ha scritto:
> Hi guys,
>=20
> This is my first email in this list, any help is much appreciated.
> As I know, it's not allowed to pass a local variable to a function,
> because the stack where local variable resides will be reused by othe=
r
> functions.
> eg:
>      1  #include <stdio.h>
>      2
>      3  char *fetch();
>      4
>      5  int main(int argc, char *argv[]){
>      6          char *string;
>      7          string =3D fetch();
>      8          printf("%s\n", string);
>      9          exit(0);
>     10  }
>     11
>     12  char *fetch(){
>     13          char string[10];
>     14          scanf("%s", string);
>     15          return string;
>     16  }
>=20
> When the application is executed, after input "a", it will produce
> unknown characters, like "8=C5=A0=C3=A8=C2=BF=C3=B4=C3=BFO". Which is=
 like what I expect
>=20
> However, if I change line 13 to:
>     13           char string[1024];
>=20
> When I type "a", it echos "a", which is out of my expectation
>=20
> Why does it behave like this?
>=20
> Thanks in advance,
> longapple
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

Try something like this
------
void p(int n){
	int onstack;
	printf("%p\n", &onstack);
	if(n>0) p(n-1);
}

int main(){
	p(5);
	return 0;
}
------

It should (system dependant) print a sequence of decreasing hex numbers=
;
that's because each time you call a function on your computer, the loca=
l=20
stack grows downwards.

When you scanf() into a character array, it writes into the first=20
characters of your array, that is string[0], then string[1], and so on:=
=20
notice that the address of string[1] is GREATER than the address of=20
string[0]...

Summing up there are two cases (assume that X stands for "any value"):

1) string[10]
=3D=3D> { X, X, X, X, X, X, X, X, '\0', 'a' }
2) string[1024]
=3D=3D> { X, X, X, (long sequence of garbage)..., '\0', a' }

When you call printf(), the printf function overwrites some bytes for=20
its own stack variables: if it takes more than 10 bytes (eg 42), the=20
small array will be completely overwritten, while with the big array it=
=20
will only overwrite string[1023...980] (which was garbage anyway!),=20
leaving string[0...979] intact.

I hope that was helpful; try gooling "buffer overflow" for more info


lb

--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
