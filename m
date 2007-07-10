From: Shriramana Sharma <samjnaa@gmail.com>
Subject: no see copy-constructor in output of nm
Date: Tue, 10 Jul 2007 22:00:57 +0530
Message-ID: <4693B441.6070203@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

For the following code:

class Integer
{
public :
	Integer ( int i ) : i_ ( i ) {}
private :
	int i_ ;
} ;
int main ( void )
{
	Integer a ( 1 ) ;
	Integer c ( a ) ;
}

I do: g++ -c and then run nm -C on the object file. I get only:

00000000 W Integer::Integer(int)
          U __gxx_personality_v0
00000000 T main

Why do I not see the signature of the copy constructor 
Integer::Integer(const Integer&) in the symbols list even though it is 
automatically created?

Also, why do I not see i_, a and c and the name of the class Integer 
itself? Are they not also symbols?

Shriramana Sharma.

