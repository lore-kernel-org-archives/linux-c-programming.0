From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Double values - what precision do I use for fprintf?
Date: Tue, 17 Jan 2006 05:37:58 +0000
Message-ID: <17356.33462.836921.456340@cerise.gclements.plus.com>
References: <200601121800.19678.samjnaa@gmail.com>
	<6a00c8d50601121051n691ee179kef3298829025e973@mail.gmail.com>
	<012101c617be$5b7afe10$8e01a8c0@Nate>
	<17352.15389.697568.176591@cerise.gclements.plus.com>
	<007201c618a2$7233be00$8e01a8c0@Nate>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <007201c618a2$7233be00$8e01a8c0@Nate>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nate Jenkins <nate@uniwest.com>
Cc: linux-c-programming@vger.kernel.org


Nate Jenkins wrote:

> >> If it is a 64-bit-floating-point data type, then isn't one supposed to 
> >> use
> >> the "long" modifier, i.e. "%.52f" -> "%.52lf"?  Or is that not portable?
> >
> > You cannot pass a float to printf(); a float will automatically be cast to
> > double.
> >
> > More generally, a float argument will be cast to double if the
> > function doesn't have a prototype, or if the prototype doesn't specify
> > a type for the argument (i.e. for a variadic function). Similarly,
> > char and short values are automatically converted to int in such
> > circumstances.
> 
> So for a short example:
> (this should compile but with a few casting warnings)

Regarding the lack of trailing garbage: the default precision for "%f"
is 6 decimal places, i.e. "%.6f". If you use e.g. "%.50f", you will
get:

	3.14159274101257324218750000000000000000000000000000 

in all three cases. Everything after the 6th decimal place is garbage
due to the value having been truncated to float precision in the first
place. It doesn't matter whether the conversion from float to double
is done by copying fNum to dNum or by passing fNum to printf().

> Are my comment assumptions wrong?  I have been using "%lf" for years... 
> Could the old compiler I use be made to consider "%lf" the same as "%f" ?

Technically, "%lf" is undefined for printf() etc (although it is
meaningful for sscanf() etc). In practice, most implementations simply
ignore the "l", so "%lf" and "%f" are equivalent.

-- 
Glynn Clements <glynn@gclements.plus.com>
