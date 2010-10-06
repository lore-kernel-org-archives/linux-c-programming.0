From: Nanakos Chrysostomos <nanakos@wired-net.gr>
Subject: Re: printf and long double [SOLVED]
Date: Wed, 6 Oct 2010 23:18:22 +0300
Message-ID: <20101006201821.GA2872@dinofilaria.home>
References: <20101003225652.GA3618@dinofilaria.home>
 <19625.11998.318578.160832@cerise.gclements.plus.com>
 <4CA9C086.1050401@wired-net.gr>
 <201010041503.27721.cristeab@gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201010041503.27721.cristeab@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bogdan Cristea <cristeab@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Problem Solved:

#include <stdio.h>
#include <math.h>

int main(void)
{
		_Decimal128 a = log(8.25123456);

		printf("%.62Lf\n",(long double)a);



		return 0;
}

Thanks for your replies.

On Mon, Oct 04, 2010 at 03:03:27PM +0300, Bogdan Cristea wrote:
> On Monday 04 October 2010 14:54:46 you wrote:
> > I wish I could get 24 decimal digits precision with the current long 
> > double (80-bit). I can't get more than 15 digits even in a simple division.
> > I think that the extended-precision can't give more than 19 decimal 
> > digits of precision (log(10,2^64)=19.2). The quadruple precision can 
> > give at most 34 decimal digits (log(10,2^113)=34).
> > 
> > Please consider the example below:
> > --------------------------------------------------
> > long double a = 1.0L/7.0L;
> > printf("%Lf\n",a);
> > --------------------------------------------------
> > 
> > Can't get more than 15 digits precision....-:(
> > Is this a compiler problem or libc's problem? In x86_64 machines the 
> > long double values supposed to give at least 106-bit precision even when 
> > implemented in software. Is gcc compliant with the quadruple notation?
> 
> Have you tried to specify manually the number of digits after the decimal 
> point ?
> 
> 	long double a = 1.0L/7.0L;
> 	printf("%'.100Lf\n",a);
> 
> On a 64 bits machine the output is:
> 
> 0.1428571428571428571409210675491330277964152628555893898010253906250000000000000000000000000000000000
> 
> regards
> Bogdan
