From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Double values - what precision do I use for fprintf?
Date: Fri, 13 Jan 2006 23:47:41 +0000
Message-ID: <17352.15389.697568.176591@cerise.gclements.plus.com>
References: <200601121800.19678.samjnaa@gmail.com>
	<6a00c8d50601121051n691ee179kef3298829025e973@mail.gmail.com>
	<012101c617be$5b7afe10$8e01a8c0@Nate>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <012101c617be$5b7afe10$8e01a8c0@Nate>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nate Jenkins <nate@uniwest.com>
Cc: linux-c-programming@vger.kernel.org


Nate Jenkins wrote:

> If it is a 64-bit-floating-point data type, then isn't one supposed to use 
> the "long" modifier, i.e. "%.52f" -> "%.52lf"?  Or is that not portable?

You cannot pass a float to printf(); a float will automatically be cast to
double.

More generally, a float argument will be cast to double if the
function doesn't have a prototype, or if the prototype doesn't specify
a type for the argument (i.e. for a variadic function). Similarly,
char and short values are automatically converted to int in such
circumstances.

-- 
Glynn Clements <glynn@gclements.plus.com>
