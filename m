From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: no see copy-constructor in output of nm
Date: Wed, 11 Jul 2007 16:18:16 +0100
Message-ID: <18068.62648.338531.678125@cerise.gclements.plus.com>
References: <4693B441.6070203@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4693B441.6070203@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> class Integer
> {
> public :
> 	Integer ( int i ) : i_ ( i ) {}
> private :
> 	int i_ ;
> } ;
> int main ( void )
> {
> 	Integer a ( 1 ) ;
> 	Integer c ( a ) ;
> }
> 
> I do: g++ -c and then run nm -C on the object file. I get only:
> 
> 00000000 W Integer::Integer(int)
>           U __gxx_personality_v0
> 00000000 T main
> 
> Why do I not see the signature of the copy constructor 
> Integer::Integer(const Integer&) in the symbols list even though it is 
> automatically created?

Because it's inlined. The default copy constructor just copies the raw
data.

> Also, why do I not see i_, a and c and the name of the class Integer 
> itself? Are they not also symbols?

a and c are automatic variables, which are created on the stack
whenever the function is called and destroyed when it returns. They
don't exist within the executable.

i_ is a structure field; it doesn't have an existence separate from
the object to which it belongs.

-- 
Glynn Clements <glynn@gclements.plus.com>
