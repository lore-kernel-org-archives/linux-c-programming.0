From: Shriramana Sharma <samjnaa@gmail.com>
Subject: enum types and casting
Date: Sun, 29 Apr 2007 11:10:26 +0530
Message-ID: <46342FCA.1090400@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Hello. Just now I learnt that enums can be very usefully used as types, 
and was experimenting some with it. The following questions arose.

1. Are enums allowed as types only in C++ and not in C? gcc rejects 
using an enum as a type whereas g++ accepts it.

2.

Consider:

enum BODY { SUN, MOON, STAR } ;
enum PLANET { EARTH, VENUS, MARS, PLUTO } ;

int main ( void )
{
	BODY body ;
	// body = 1 ;         // gives error
	// body = EARTH ;     // gives error
	body = (BODY) 1 ;     // does not give error. expected.
	body = (BODY) EARTH ; // does not give error. expected.
	body = 3 ;            // does not give error. unexpected.
	body = (BODY) PLUTO ; // does not give error. unexpected.
}

When the target enum of the cast contains no name that has the same 
integer value as the value being casted, how does g++ accept the cast? 
Is this expected behaviour or a bug?

Thanks as always.

Shriramana Sharma.

P.S: Oops, silly me, Pluto isn't a planet any more...

