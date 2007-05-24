From: Shriramana Sharma <samjnaa@gmail.com>
Subject: operator != not automatically defined when operator == is defined
Date: Thu, 24 May 2007 18:32:55 +0530
Message-ID: <46558CFF.1010606@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Observe:

class MyClass
{
public :
     MyClass ( int x ) : i ( x ) {}
     bool operator =3D=3D ( const MyClass & other )
         { return i =3D=3D other . i ; }
private :
     int i ;
} ;
int main ( void )
{
     MyClass a ( 1 ), b ( 2 ) ;
     if ( a !=3D b ) {}
}

Trying to compile this gives:

operator-notequal.cpp:14: error: no match for =91operator!=3D=92 in =91=
a !=3D b=92

Now there need conceivably be no definition for operator !=3D other tha=
n=20
the not-ted value of what operator =3D=3D gives, so why does gcc want m=
e to=20
define operator !=3D separately?

Similarly even if I define only operator !=3D, gcc will tell me to=20
separately define operator =3D=3D if I want to use that.

=46or the pairs:

=3D=3D and !=3D
 > and <=3D
< and >=3D

it is mathematically illogical to have any definition for each operator=
=20
in the pair which does not output same as the not-ted output of the=20
other operator in the pair, but gcc will not allow me to use an operato=
r=20
unless it has been explicitly defined even if its logical negative=20
operator has been defined. I believe this is a defect in gcc.

Your comments?

Shriramana Sharma.

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
