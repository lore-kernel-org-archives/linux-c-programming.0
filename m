From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: no number->string conversion in stdc++?
Date: Sun, 1 Jul 2007 02:02:46 +0100
Message-ID: <18054.64822.186915.859684@cerise.gclements.plus.com>
References: <46844C76.6060208@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <46844C76.6060208@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> I learnt today to my dismay that there is in fact no number to string 
> conversion function in the standard C++ library? I can't do simple 
> natural things like:
> 
> std :: string a ( 2 ) ;
> std :: string b ( 2.5 ) ;

These conversions are neither simple nor natural.

Look at the printf() documentation, and note how much of it applies to
formatting numeric values. Base, precision, field width, leading
zeroes/spaces, exponential notation. And that's aside from locale
issues (e.g. decimal separator), which aren't described there.

> The three ways out of this problem I got to know:
> 
> 1. stringstream from std, resulting in somewhat unweildy operations
> 2. lexical_cast from boost, resulting in dependency on huge boost lib
> 3. QString from Qt, resulting in depdency on huge Qt lib
> 
> Of course stdc++ is also a huge lib, but thought I can expect stdc++ to 
> be there on more machines than boost or Qt.
> 
> So shall I go with std::string and std::stringstream, std::string and 
> boost::lexical_cast or simply Qt's QString? QString seems most 
> appealing, but I would listen to your better judgment.

If the std::ostream formatting operators are sufficient, then use
std::ostringstream, otherwise write your own.

Don't use substantial external libraries just for a few utility
functions.

-- 
Glynn Clements <glynn@gclements.plus.com>
