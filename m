From: Per Jessen <per@computer.org>
Subject: Re: Remove x number of decimals from a float value
Date: Tue, 11 Jul 2006 21:08:06 +0200
Message-ID: <44B3F716.4040703@computer.org>
References: <Pine.LNX.4.64.0607111209430.16861@ns.isi.ulatina.ac.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0607111209430.16861@ns.isi.ulatina.ac.cr>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Fabio Miranda Hamburger wrote:
> Hello,
> 
> I am trying to implement a 100% math function ( avoid handle the float 
> as a char array), that remove x number of decimals from the right to the 
> float point.
> 
> Example:
> Given x= 12345.6789 I call the function with (x,2) and the returned 
> number is: x= 12345.67, for (x,4) returned value is x=12345
> 
> I was trying to implement this function using datatype casting, abs() 
> and other functions from math.h library.

How about :


double f( double x, int n )
{
         return ( n>0 ? f( x*10,n-1 )/10 : floor(x) );
}

Oops, 'n' is number of decimals you want to keep, not throw away.


/Per Jessen, Zurich
