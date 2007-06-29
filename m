From: Shriramana Sharma <samjnaa@gmail.com>
Subject: no number->string conversion in stdc++?
Date: Fri, 29 Jun 2007 05:34:06 +0530
Message-ID: <46844C76.6060208@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Hello.

I learnt today to my dismay that there is in fact no number to string 
conversion function in the standard C++ library? I can't do simple 
natural things like:

std :: string a ( 2 ) ;
std :: string b ( 2.5 ) ;

without errors at compilation talking about "no matching function for call".

I find it difficult to believe that no-one thought this was necessary 
enough to be included in the C++ standard basic_string class.

The three ways out of this problem I got to know:

1. stringstream from std, resulting in somewhat unweildy operations
2. lexical_cast from boost, resulting in dependency on huge boost lib
3. QString from Qt, resulting in depdency on huge Qt lib

Of course stdc++ is also a huge lib, but thought I can expect stdc++ to 
be there on more machines than boost or Qt.

So shall I go with std::string and std::stringstream, std::string and 
boost::lexical_cast or simply Qt's QString? QString seems most 
appealing, but I would listen to your better judgment.

Shriramana Sharma.

