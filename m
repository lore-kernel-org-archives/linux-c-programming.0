From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Errors with ->*
Date: Tue, 2 Aug 2011 21:52:31 +0100
Message-ID: <20024.25487.797217.424707@cerise.gclements.plus.com>
References: <4E382646.7060903@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4E382646.7060903@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Shriramana Sharma wrote:

> I'm trying to understand the use of ->* but in compiling the attached=
=20
> program which I thought was straightforward I am getting the followin=
g=20
> errors:
>=20
> foo.cpp: In constructor =E2=80=98mystruct::mystruct()=E2=80=99:
> foo.cpp:9:12: error: invalid conversion from =E2=80=98int*=E2=80=99 t=
o =E2=80=98int=E2=80=99
> foo.cpp: In function =E2=80=98int main()=E2=80=99:
> foo.cpp:21:7: error: =E2=80=98xptr=E2=80=99 was not declared in this =
scope
> foo.cpp:22:7: error: =E2=80=98yptr=E2=80=99 was not declared in this =
scope
>=20
> Please help.
>=20
> --=20
> Shriramana Sharma
> struct mystruct=20
> {
> public:
> 	int x, y ;
> 	int * xptr, yptr ;

If these are supposed to have pointer-to-member type, the correct
syntax is:

	int mystruct::* xptr, mystruct::* yptr;

> 	mystruct ()=20
> 	{=20
> 		xptr =3D & x ;=20
> 		yptr =3D & y ;=20
> 	}

There's no point in using pointer-to-member instance variables like
this. They're normally used when you need to identify a specific field
within a class (rather than an instance). If you want to point to a
specific member of a specific instance; you would just use plain
pointers.

> 	a .* xptr =3D 3 ;
> 	a .* yptr =3D 4 ;
>=20
> 	aptr ->* xptr =3D 5 ;
> 	aptr ->* yptr =3D 6 ;

xptr and yptr are members of mystruct, so you need e.g.:

    aptr ->* aptr->xptr =3D 5 ;
    aptr ->* aptr->yptr =3D 6 ;

    a .* a.xptr =3D 3 ;
    a .* a.yptr =3D 4 ;

The whole point about pointer-to-member is that the value is the same
for all instances of the class, so you could just do:

	int main ( void )
	{
	    int mystruct::* xptr =3D &mystruct::x;
	    int mystruct::* yptr =3D &mystruct::y;
	    mystruct a, b;
	    mystruct *aptr =3D &a;
=09
	    a .* xptr =3D 1 ;=20
	    a .* yptr =3D 2 ;
=09
	    b .* xptr =3D 1 ;=20
	    b .* yptr =3D 2 ;
=09
	    aptr ->* xptr =3D 1 ;=20
	    aptr ->* yptr =3D 2 ;
	}

In any case, given that this isn't specific to Linux, and has nothing
to do with C, there are better places for asking such questions than
the linux-c-programming list (e.g. the comp.lang.c++ newsgroup).

--=20
Glynn Clements <glynn@gclements.plus.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
