From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: printf format type, precision...
Date: Sat, 3 Jul 2004 00:11:13 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16613.60305.954551.41720@cerise.nosuchdomain.co.uk>
References: <Pine.LNX.4.21.0407030018090.1619-100000@hestia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0407030018090.1619-100000@hestia>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


J. wrote:

> I am trying to convert an IP address to it's eq. in base10
> [homework]. However the outcome from the formula listed below isn't giving
> me the right results.  Is this because I'm using the wrong precision type
> for the `result' variable ? If that's the case what other precision type
> should I use instead ? Right now I can't see the format tree's trhu the
> precision forrest anmore .. ehum.
> 
> #include <stdio.h>
> 
> int main(void) {
>  int var1 = 192; 
>  int var2 = 168;
>  int var3 = 1;
>  int var4 = 10;
>  long int result = 0;
> 
>  result = var1 * (256 ^ 3) + var2 * (256 ^ 2) * var3 * 256 + var4; 
>  printf("%ld\n", value);
> 
>  return 0;
> }
> 
> Your comments and suggestions will be greatly appreciated..

In C, the ^ operator performs bitwise exclusive-or (XOR), not
exponentiation.

C doesn't have an exponentiation operator, and even if it did, it
wouldn't make sense to use it for powers of two. Use the left shift
operator (<<) instead.

BTW, the result should be unsigned, and displayed with %u, otherwise
addresses where the topmost byte is >= 128 will result in a negative
number.

-- 
Glynn Clements <glynn.clements@virgin.net>
