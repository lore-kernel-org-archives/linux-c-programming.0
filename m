From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: operator for automatic type conversion not allowed as non-member
Date: Mon, 16 Jul 2007 16:54:51 +0100
Message-ID: <18075.38091.44611.315224@cerise.gclements.plus.com>
References: <469B0A95.4040108@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <469B0A95.4040108@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> In my program, I would like QString-s (from Qt) to be automatically=20
> converted to std::string-s. The Qt people could have done this by=20
> providing an operator std::string () inside class QString but they=20
> didn't so I tried to do this using a global operator.
>=20
> operator std::string (const QString & qs) { return qs.toStdString() ;=
 }
>=20
> but I got:
>=20
> error: =1B-F=A1operator std::string(const QString&)=A2 must be a nons=
tatic member =1B-A
> function
>=20
> Whereas if I try:
>=20
> const QString operator+ (const std::string & ss, const QString & qs) =
{
> 	return QString::fromStdString(ss) + qs ;
> }
>=20
> it works. So what is special about operator othertype that it is not=20
> allowed to be a non-member?

My guess is that the decision to add this rule was to prevent the
type-matching rules from becoming any more complex than they already
are.

Type conversion and assignment aren't like normal operators, as they
can be invoked implicitly. Also, as overloaded functions are selected
based upon the argument types, the interaction between type conversion
and overloading can have non-obvious results.

By requiring type conversion operators, constructors and assignment
operators to be implemented as members, the behaviour of calling a
method with arguments of pre-defined types is determined by the class
alone.

If any of those operators could be defined outside of the class, the
behaviour would depend upon the presence or absence of such
definitions. This could result in the class being implemented
differently in different translation units, depending upon which other
header files were included.

> Similarly operator=3D is not allowed to be a non-member. So I cannot =
do:
>=20
> const std::string & operator=3D ( std::string & ss, const QString & q=
s ) {
> 	ss =3D qs.toStdString() ;
> 	return ss ;
> }
>=20
> which is actually meaningful. Of course, since QString has toStdStrin=
g,=20
> I can always use that wherever I need to get a std::string from QStri=
ng,=20
> but operator overloading is a matter of convenience and I would like =
to=20
> know if there is a strong reason that I cannot use operator othertype=
=20
> and operator=3D as a non-member.
>=20
> It would enable me to define convenience=20
> operators between objects of third-party (which includes the standard=
=20
> library for me) types.

Designing a language isn't just about whether or not a feature can be
implemented, but also about whether it is a good idea.

Many people (including myself) consider that the existence of implicit
operators in C++ is a mistake, resulting in code which can be very
hard to understand for anyone other than the author (or even for the
author, once some time has elapsed since the code was written).

Ensuring that you understand the evaluation of a particular expression
requires exhaustive knowledge of any implicit operators which could be
invoked.

This is helped by the fact that such operators must appear somewhere
in the definition of the relevant class (although, in the case of a
conversion operator, it may be in a superclass; assignment operators
aren't inherited).

If such operators could be defined as global functions, you would have
to hunt through all of the header files which are included in a
translation unit to find any such operators (or to ensure that they
didn't exist).

--=20
Glynn Clements <glynn@gclements.plus.com>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
