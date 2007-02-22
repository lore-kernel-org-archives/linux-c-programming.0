From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Request help with function pointers
Date: Thu, 22 Feb 2007 09:57:53 +0530
Message-ID: <45DD1BC9.9030902@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040500020202080809000506"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.
--------------040500020202080809000506
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello. I am trying the examples from Bruce Eckel's Thinking in C++ 2nd 
edn and am getting a problem. I have attached the examples I am using 
and the error messages (basically the same kind) which I got. I am 
unable to understand what is wrong when I have followed the book example 
perfectly (AFAIK) except for the variablenames which is immaterial.

Please explain what I did wrong. I am using:

$ g++ -v
Using built-in specs.
Target: i486-linux-gnu
Configured with: ../src/configure -v 
--enable-languages=c,c++,fortran,objc,obj-c++,treelang --prefix=/usr 
--enable-shared --with-system-zlib --libexecdir=/usr/lib 
--without-included-gettext --enable-threads=posix --enable-nls 
--program-suffix=-4.1 --enable-__cxa_atexit --enable-clocale=gnu 
--enable-libstdcxx-debug --enable-mpfr --enable-checking=release 
i486-linux-gnu
Thread model: posix
gcc version 4.1.2 20060928 (prerelease) (Ubuntu 4.1.1-13ubuntu5)

Thank you.

Shriramana Sharma.

--------------040500020202080809000506
Content-Type: text/x-c++src;
 name="function-pointers-1.cpp"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="function-pointers-1.cpp"

#include "stdio.h"

class myclass
{
public :
	void f ( int ) ;
	void g ( int ) ;
	void h ( int ) ;
	void i ( int ) ;
} ;

void myclass :: h ( int a ) { printf ( "%d", a ) ; }

int main ( void )
{
	myclass myclassinstance ;
	myclass * myclassinstancepointer = & myclassinstance ;
	void ( myclass :: * pointertofunction ) ( int ) = & myclass :: h ;
	// this means that pointertofunction is a pointer (*) to a function existing in the scope of myclass (myclass ::)
	// and takes an int as input ( (int) ) and gives void as output ( void )
	( myclassinstance . * pointertofunction ) ( 1 ) ; 
	// calls the function pointed to by pointertofunction and existing as a member of the class myclassinstance with 1 as the parameter
	( myclassinstancepointer -> * pointertofunction ) ( 2 ) ;
	// calls the function pointed to by pointertofunction and existing as a member of the class pointed to by myclassinstancepointer with 2 as the parameter
}

--------------040500020202080809000506
Content-Type: text/plain;
 name="function-pointers-1-error"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="function-pointers-1-error"

samjnaa@chandas:~/bn/learning$ g++ function-pointers-not-working.cpp -o fp
function-pointers-not-working.cpp: In function ���������int main()���������:
function-pointers-not-working.cpp:21: error: expected unqualified-id before ���������*��������� token
function-pointers-not-working.cpp:23: error: expected unqualified-id before ���������*��������� token

--------------040500020202080809000506
Content-Type: text/x-c++src;
 name="function-pointers-2.cpp"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="function-pointers-2.cpp"

#include "stdio.h"

class maths
{
private :
	void square ( int a ) const { printf ( "The square of %d is %d\n", a, a * a ) ; }
	void cube ( int a ) const { printf ( "The cube of %d is %d\n", a, a * a * a ) ; }
	void fourthpower ( int a ) const { printf ( "The fourth power of %d is %d\n", a, a * a * a * a ) ; }
	void ( maths :: * functionpointers [ 3 ] ) ( int ) const ;
	/*
	the above line declares an array called functionpointers that has three ( 3 ) elements which are all pointers ( * ) to functions in the scope of the class maths ( maths :: ) and take a single integer as parameter ( int ) and return nothing ( void ) and do not modify the contents of the class in anyway ( const )
	*/
public :
	maths ()
	{
		functionpointers [ 0 ] = & maths :: square ;
		functionpointers [ 1 ] = & maths :: cube ;
		functionpointers [ 2 ] = & maths :: fourthpower ;
	}
	void executefunction ( int functionnumber, int inputforfunction )
	{
		if ( functionnumber < 0 || functionnumber > 2 ) return ;
		( this -> * functionpointers [ functionnumber ] ) ( inputforfunction ) ;
		// this line calls the function which is pointed ( * ) to by the functionnumber-th element of the functionpointers array which is a member of the object pointed to by the current object pointer ( this ) and passes the function the value of the variable inputforfunction as a parameter
	}
} ;

int main ( void )
{
	maths mathsinstance ;
	for ( int count = 0; count < 3; count ++ )
		mathsinstance . executefunction ( count, 2 ) ;
}

--------------040500020202080809000506
Content-Type: text/plain;
 name="function-pointers-2-error"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="function-pointers-2-error"

samjnaa@chandas:~/bn/learning$ g++ function-pointers-2.cpp -o fp2 -Wall
function-pointers-2.cpp: In member function ���������void maths::executefunction(int, int)���������:
function-pointers-2.cpp:23: error: expected unqualified-id before ���������*��������� token

--------------040500020202080809000506--


