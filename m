From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Remove x number of decimals from a float value
Date: Tue, 11 Jul 2006 21:58:54 +0100
Message-ID: <17588.4366.644741.791294@cerise.gclements.plus.com>
References: <Pine.LNX.4.64.0607111209430.16861@ns.isi.ulatina.ac.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0607111209430.16861@ns.isi.ulatina.ac.cr>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabio Miranda Hamburger <fabmirha@ulatina.ac.cr>
Cc: linux-c-programming@vger.kernel.org


Fabio Miranda Hamburger wrote:

> I am trying to implement a 100% math function ( avoid handle the float as 
> a char array), that remove x number of decimals from the right to the 
> float point.

That is a meaningless specification.

> Example:
> Given x= 12345.6789 I call the function with (x,2) and the returned number 
> is: x= 12345.67, for (x,4) returned value is x=12345

So presumably if x = 12345.67890000, f(x,2) would be 12345.678900 and
f(x,4) would be 12345.6789.

But all of those numbers are the same.

Also, bear in mind that you cannot exactly represent 0.1 (or, more
generally, 10^(-n) for any n >= 1) in floating-point.

E.g. storing 12345.6789 as a single-precision value will result in:

	12345.67871093750000000000000000000000000000000000000000...

while a double-precision value will give:

	12345.67890000000079453457146883010864257812500000000000...

Per's suggestion of *keeping* a given number of decimal places is
feasible.

-- 
Glynn Clements <glynn@gclements.plus.com>
