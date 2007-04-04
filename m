From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Function pointers to inline functions
Date: Wed, 04 Apr 2007 22:39:22 +0530
Message-ID: <4613DBC2.8060708@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060109050908030000040400"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.
--------------060109050908030000040400
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello.

As per my understanding, an inline function is replaced in place by the 
compiler with the body of the function, so it does not have a separate 
location in memory in contrast with a regular function. This being so, 
how is it possible to extract a pointer to an inline function and 
effectively use it?

See the attached two examples. They work and though it's a good thing 
for my project that I can extract a pointer to an inline function I do 
not understand how it is possible.

Please explain. Thank you.

Shriramana Sharma.

--------------060109050908030000040400
Content-Type: text/x-c++src;
 name="function-pointers-1.cpp"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="function-pointers-1.cpp"

#include "stdio.h"

inline void square ( int a ) { printf ( "The square of %d is %d\n", a, a * a ) ; }
inline void cube ( int a ) { printf ( "The cube of %d is %d\n", a, a * a * a ) ; }
inline void fourthpower ( int a ) { printf ( "The fourth power of %d is %d\n", a, a * a * a * a ) ; }

void ( * functionpointers [ 3 ] ) ( int ) ;
/*
the above line declares an array called functionpointers that has three ( 3 ) elements which are all pointers ( * ) to functions which take a single integer as parameter ( int ) and return nothing ( void ) and do not modify the contents of the class in anyway ( const )
*/

void executefunction ( int functionnumber, int inputforfunction )
{
	if ( functionnumber < 0 || functionnumber > 2 ) return ;
	( * functionpointers [ functionnumber ] ) ( inputforfunction ) ;
	// this line calls the function which is pointed ( * ) to by the functionnumber-th element of the functionpointers array which is a member of the object pointed to by the current object pointer ( this ) and passes the function the value of the variable inputforfunction as a parameter
}

int main ( void )
{
	functionpointers [ 0 ] = & square ;
	functionpointers [ 1 ] = & cube ;
	functionpointers [ 2 ] = & fourthpower ;
	
	int count ;
	for ( count = 0; count < 3; count ++ )
		executefunction ( count, 2 ) ;
}

--------------060109050908030000040400
Content-Type: text/x-c++src;
 name="function-pointers-2.cpp"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="function-pointers-2.cpp"

#include "stdio.h"

inline int square ( int a ) { return a * a ; }
inline int cube ( int a ) { return a * a * a ; }
inline int fourthpower ( int a ) { return a * a * a * a ; }
inline int squarepluscube ( int a ) { return square ( a ) + cube ( a ) ; }
inline int squarepluscubeplusfourthpower ( int a ) { return squarepluscube ( a ) + fourthpower ( a ) ; }

int ( * functionpointers [ 5 ] ) ( int ) ;
/*
the above line declares an array called functionpointers that has three ( 3 ) elements which are all pointers ( * ) to functions which take a single integer as parameter ( int ) and return nothing ( void ) and do not modify the contents of the class in anyway ( const )
*/

void executefunction ( int functionnumber, int inputforfunction )
{
	printf ( "%d\n", ( * functionpointers [ functionnumber ] ) ( inputforfunction ) ) ;
	// this line calls the function which is pointed ( * ) to by the functionnumber-th element of the functionpointers array which is a member of the object pointed to by the current object pointer ( this ) and passes the function the value of the variable inputforfunction as a parameter
}

int main ( void )
{
	functionpointers [ 0 ] = & square ;
	functionpointers [ 1 ] = & cube ;
	functionpointers [ 2 ] = & fourthpower ;
	functionpointers [ 3 ] = & squarepluscube ;
	functionpointers [ 4 ] = & squarepluscubeplusfourthpower ;
	
	int count ;
	for ( count = 0; count < 5; count ++ )
		executefunction ( count, 2 ) ;
}

--------------060109050908030000040400--


