From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: enum types and casting
Date: Thu, 17 May 2007 00:07:58 +0530
Message-ID: <464B4F86.80709@gmail.com>
References: <46342FCA.1090400@gmail.com> <6a00c8d50705040518o2712d37cw8db39d80a20f3b4e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50705040518o2712d37cw8db39d80a20f3b4e@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Steve Graegert <graegerts@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

Steve Graegert wrote:

> To convert an integral type to an enumeration, use the following semantic:
> 
> enum TEST { zero = 0, one, two };
> int i1 = 2;
> test t1 = static_cast<TEST> (i1); // t1 == two

Steve,

I tried this as follows:

enum BODY { SUN, MOON, STAR } ;
enum PLANET { EARTH, VENUS, MARS, PLUTO } ;
int main ( void )
{
  BODY body ;
  body = static_cast < BODY > ( 3 ) ; // does not give error.
  body = static_cast < BODY > ( PLUTO ) ; // does not give error.
}

but it still does not throw an error even though the enum being casted 
*to* does not contain an identifier equivalent to the value actually 
being casted, whether a primitive integer or an identifier belonging to 
another enum.

Don't you think this is a GCC bug?

Shriramana.

