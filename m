From: Shriramana Sharma <samjnaa@gmail.com>
Subject: operator for automatic type conversion not allowed as non-member
Date: Mon, 16 Jul 2007 11:35:09 +0530
Message-ID: <469B0A95.4040108@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

In my program, I would like QString-s (from Qt) to be automatically=20
converted to std::string-s. The Qt people could have done this by=20
providing an operator std::string () inside class QString but they=20
didn't so I tried to do this using a global operator.

operator std::string (const QString & qs) { return qs.toStdString() ; }

but I got:

error: =E2=80=98operator std::string(const QString&)=E2=80=99 must be a=
 nonstatic member=20
function

Whereas if I try:

const QString operator+ (const std::string & ss, const QString & qs) {
	return QString::fromStdString(ss) + qs ;
}

it works. So what is special about operator othertype that it is not=20
allowed to be a non-member?

Similarly operator=3D is not allowed to be a non-member. So I cannot do=
:

const std::string & operator=3D ( std::string & ss, const QString & qs =
) {
	ss =3D qs.toStdString() ;
	return ss ;
}

which is actually meaningful. Of course, since QString has toStdString,=
=20
I can always use that wherever I need to get a std::string from QString=
,=20
but operator overloading is a matter of convenience and I would like to=
=20
know if there is a strong reason that I cannot use operator othertype=20
and operator=3D as a non-member. It would enable me to define convenien=
ce=20
operators between objects of third-party (which includes the standard=20
library for me) types.

Shriramana Sharma.

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
