From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Returning pointer to array of structures
Date: Tue, 29 Apr 2003 21:57:40 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16046.59204.841537.123906@cerise.nosuchdomain.co.uk>
References: <20030429083122.GA22282@gre.ac.uk>
	<20030429121125.GA24600@nevernight.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030429121125.GA24600@nevernight.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jason Cooper <jcooper@nevernight.net>
Cc: linux-c-programming@vger.kernel.org


Jason Cooper wrote:

> 1.) Your pointer *mePtr is being passed as an argument.

Just to be picky: "mePtr" is a pointer; "*mePtr" is what mePtr points
to, i.e. a structure; it's equivalent to mePtr[0].

> It does not
> need to be returned.  Your local function will modify the memory space
> that *mePtr points to.  

This is correct.

> 2.) mePtr[i] doesn't make sense.

Sure it does; it's the i-th element of the array to which mePtr
points.

> It's equivalent to adding the size of
> struct menuentry to the address mePtr contains ( if i=1, eg).

Yes; this is just array access. BTW, the following are all equivalent:

	mePtr[i]
	*(mePtr + i)
	*(i + mePtr)
	i[mePtr]

However, using the last form isn't recommended if you want other
people to understand your code.

> Not to
> mention that it was never declared as an array in the first place.

It was declared as:

	menuentry *mePtr = malloc( n * sizeof (*mePtr) ); /* Gets size of array */

IOW, it points to an array of n menuentry structures.

In C, arrays are passed by reference; IOW, wherever you treat an array
as a value, the value is actually the pointer to the first element. 
So, array accesses (array[index]) actually operate upon pointers
rather than arrays.

The only place where an array is actually treated as an array (rather
than a pointer) is when passed to sizeof.

> I
> think you may be confusing char */array ([1] increments one byte) with
> pointers of different types.

No; mePtr[i] is correct.

> 3.) With malloc, it should probably be 
> 
> menuentry *mePtr;
> mePtr = malloc(n * sizeof(struct menuentry));
> ...
> free(mePtr);
> return...

The argument to sizeof can be either a type or a value. As the type of
"*mePtr" is "menuentry", and "menuentry" is just an alias (typedef)
for "struct menuentry", all of the following are equivalent:

	sizeof(*mePtr)
	sizeof(menuentry)
	sizeof(struct menuentry)

> 4.) Consider this (without malloc/free)):
> 
> int main(yada yada) {
>    menuentry me[MAXENTRIES];

This requires that the number of entries is known at compile time. If
the number of entries isn't known until run time, the memory has to be
allocated dynamically, e.g. with malloc().

> Like I said above, I haven't been doing this too long, so I may be
> wrong.  I don't mean to sound harsh, but it look as though you could use
> a crash course in pointers, arrays, and malloc/free.

He isn't the only one ;)

> Don't take it the
> wrong way, I just learned it the hard way a month ago myself.

I've been doing C for ~15 years, so I think I have the pointer/array
issues figured out by now. But I had been (intermittently) using
assembly language for ~10 years before learning C, and that helps.

-- 
Glynn Clements <glynn.clements@virgin.net>
