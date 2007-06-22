From: Shriramana Sharma <samjnaa@gmail.com>
Subject: need non-classwide sticky variable for a member function of a class
Date: Fri, 22 Jun 2007 13:28:55 +0530
Message-ID: <467B813F.4060408@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020403080607000601090405"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

This is a multi-part message in MIME format.
--------------020403080607000601090405
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello.

Definition of the problem :

* I have a class representing a time object with a property 
startingPoint accessed by the member function startingPoint().

* I do not want to calculate the value of the property for each class 
instance at the time of creation of the instance, since that calculation 
is computationally intensive.

* Only if someone asks for the value I want to calculate it.

* Once calculated, I want to store it to be returned directly from 
storage if it is asked for again.

* Different instances of the class of course have different 
startingPoint values. So it will require that there is a separate store 
variable for the startingPoint property of each instance.

I first thought I could use a static variable inside the function 
startingPoint() which would act as the store. But the compiler outputs 
only one block of machine code for the function, which means there is 
actually only one static store created. This means that there are no 
separate stores for each class instance.

Of course the workaround is obvious -- declare a private variable 
directly as a member of the class instead of a static variable in the 
member function.

What I really want to ask is, aren't the two meanings of the keyword 
static mixed up here?

When a class has a static member, it means that that member belongs to 
the whole class. Different instances of a class can use this to pass 
information amongst themselves, for example.

But here there is a variable which is a static "member" of a non-static 
member function of a class, and it is also acting as a classwide object.

To my mind, there are three meanings to the keyword static:

1. local visibility (vars and funcs)
2. classwide commonness (vars and funcs)
3. sticky nature (vars only) to hold values between function calls

Here the second and third meanings are mixed up -- that makes the static 
keyword quite ambiguous, don't you think?

Your comments invited.

Shriramana Sharma.

--------------020403080607000601090405
Content-Type: text/x-c++src;
 name="class-function-static-var.cpp"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="class-function-static-var.cpp"

# include <iostream>
using namespace std ;

class Number
{
public :
	Number ( int i ) : i_ ( i ) {}
	int value ( void ) { return i_ ; }
	int previous ( void ) ;

private :
	int i_ ;
} ;

int Number :: previous ( void )
{
	static int previousValue ;
	static bool calculated = false ;

	if ( not calculated )
	{
		cout << "Not calculated.\nCalculating...\n" ;
		previousValue = i_ - 1 ;
		calculated = true ;
		cout << "Returning calculated value.\n" ;
		return previousValue ;
	}
	// else
	cout << "Already calculated.\nNot calculating again.\n" ;
	cout << "Returning previously calculated value.\n" ;
	return previousValue ;
}

int main ( void )
{
	Number a ( 100 ) ;

	cout << "a :\n" ;
	cout << a . value () ;

	cout << "\na.previous :\n" ;
	cout << a . previous () ;

	cout << "\nAgain a.previous :\n" ;
	cout << a . previous () ;

	Number b ( 200 ) ;

	cout << "\nb :\n" ;
	cout << b . value () ;

	cout << "\nb.previous :\n" ;
	cout << b . previous () ;

	cout << "\nAgain b.previous :\n" ;
	cout << b . previous () ;

	cout << "\n" ;
}

--------------020403080607000601090405--

