From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: array size 1 ?
Date: Wed, 21 Jul 2004 04:48:20 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16637.59268.855189.354687@cerise.nosuchdomain.co.uk>
References: <002601c46e79$3da5f100$d3113b80@Viper>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <002601c46e79$3da5f100$d3113b80@Viper>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Anshuman S. Rawat" <asr@cs.columbia.edu>
Cc: linux-c-programming@vger.kernel.org


Anshuman S. Rawat wrote:

> What does an array of size 1 mean? or maybe I might be putting it wrong, so
> here's the declaration -
> 
> struct option_state {
>     int refcnt;
>     int universe_count;
>     int site_universe;
>     int site_code_min;
>     VOIDPTR universes[1];
> };
> 
> (code from ISC DHCP sources includes/dhcpd.h)
> 
> What does universes[1] mean here?

It means an array of size one.

However, an array of size one at the end of a structure is often a
clue that the structure is intended to be a "header" for a larger
block of data, where the rest of the block is an array whose size
isn't fixed at compile time.

Given the names of the fields, I would guess that the universe_count
field holds the actual number of elements in the array.

C doesn't support variable-sized arrays directly (actually, C99
supports variable-sized arrays, but C89 doesn't). However, you can do
something like:

	struct option_state *p;
	int i;

	p = malloc(sizeof(struct option_state) + (count-1) * sizeof(VOIDPTR));
	...
	p->universe_count = count;
	...
	for (i = 0; i < count; i++)
		p->universes[i] = ...;

Also, gcc supports zero-length arrays for exactly this purpose. The
"Zero Length" node in the gcc Info file (under "C Extensions") says:

	Zero-length arrays are allowed in GNU C.  They are very useful as the
	last element of a structure which is really a header for a
	variable-length object:

	     struct line {
	       int length;
	       char contents[0];
	     };

	     struct line *thisline = (struct line *)
	       malloc (sizeof (struct line) + this_length);
	     thisline->length = this_length;

In practice, it's probably better to just use an array of length one
(which will work with all compilers) and just subtract one when
computing the size.

-- 
Glynn Clements <glynn.clements@virgin.net>
