From: Shriramana Sharma <samjnaa@gmail.com>
Subject: ambiguous type conversion
Date: Fri, 22 Jun 2007 21:54:56 +0530
Message-ID: <467BF7D8.1020600@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050002090205020700000400"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

This is a multi-part message in MIME format.
--------------050002090205020700000400
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello.

While reading the operator overloading chapter of Thinking in C++ I came 
across the author saying that if there exist two separate definitions 
for type conversion between two user-defined types, one being an 
operator and the other a constructor, the compiler gives an error. But 
when I tried this, I found that the compiler (at least GCC) does not 
raise an error and prefers the constructor to the operator.

Please peruse the attached code. You need to compile with -DALLOWCONS to 
enable the constructor:

g++ -o ambiguous ambiguous-type-conversion.cpp -DALLOWCONS
./ambiguous-type-conversion
g++ -o ambiguous ambiguous-type-conversion.cpp
./ambiguous-type-conversion

You observe that the constructor is used when present, in preference to 
the operator. Is there a reason for this? I mean I would expect at least 
a warning in such a case, like I get when I initialize a variable with 
the extern keyword.

Shriramana Sharma.

P.S: I had to resort to somewhat ugly hacks to actually get the two 
user-defined classes to define the constructor and operator -- the 
example provided in the book is incomplete. One is the forward 
declaration of the second class before the first class. Two is the 
friend declaration of the second class within the first class. Three is 
the definition of the operator of the first class *after* the second class.

--------------050002090205020700000400
Content-Type: text/x-c++src;
 name="ambiguous-type-conversion.cpp"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ambiguous-type-conversion.cpp"

# include <iostream>

class Superinteger ;

class Integer
{
public :
	Integer ( int i ) : i__ ( i ) {}
	operator Superinteger () const ; // converts Integer to Superinteger
	friend class Superinteger ;
private :
	int i__ ;
} ;

class Superinteger
{
public :
	Superinteger ( int i ) : i__ ( i ) {}
# ifdef ALLOWCONS
	Superinteger ( Integer in ) : i__ ( in . i__ ) // converts Integer to Superinteger
		{ std :: cout << "Superinteger's constructor was called.\n" ; }
# endif
private :
	int i__ ;
} ;

Integer :: operator Superinteger () const
{
	std :: cout << "Integer's operator was called.\n" ;
	return Superinteger ( i__ ) ;
}

void autoConvert ( Superinteger si )
{
	std :: cout << "autoConvert ( Superinteger ) was successfully called with an Integer argument.\n" ;
}

int main ( void )
{
	autoConvert ( Integer ( 20 ) ) ;
}

--------------050002090205020700000400--

