From: =?ISO-8859-1?Q?Dar=EDo_Mariani?= <dmarian@fi.uba.ar>
Subject: Re: function pointers in C++
Date: Mon, 15 Mar 2004 11:56:57 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <4055C439.4040504@fi.uba.ar>
References: <1079342899.405577335bb24@webmail.uoa.gr> <4055BFC8.4040609@fi.uba.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4055BFC8.4040609@fi.uba.ar>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: 
Cc: linux-c-programming@vger.kernel.org

Some time ago I made a small library to tackle this problem, it's in

http://sourceforge.net/projects/cppcback/

Also there is an implementation of a similar mechanism in the libraries=
=20
found in http://www.boost.org.



Dar=EDo Mariani wrote:
> Probably what you need is the "pointer to member". It's described in
> chapter 15, section 5 in "The C++ Programming Language", from Stroust=
rup.
>=20
> elathan@phys.uoa.gr wrote:
>=20
>> Hello! =20
>> Suppose I have: =20
>> class Foo { public:     Foo();     ~Foo();     int bar(int); }; =20
>> Now, why I can't do this: =20
>> Foo *f =3D new Foo(); taz(f->bar); =20
>> Where taz()'s protype is: =20
>> void taz(int (*f)(int)); =20
>> In plain C, I can do: =20
>> int f(int) { ... } taz(f); =20
>> without a problem. Is there a way to accomplish such a thing (i.e. t=
o=20
>> pass the pointer of a C++ class's member function to another functio=
n=20
>> that expects a pointer to function as an argument)? =20
>> Regards, --=20
>> -
>> To unsubscribe from this list: send the line "unsubscribe=20
>> linux-c-programming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>=20
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe=20
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
