From: James Stevenson <james@stev.org>
Subject: Re: bitfield array
Date: Tue, 13 Jan 2004 01:02:19 +0000 (GMT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0401130054200.1358-100000@jlap.stev.org>
References: <20040112115643.0000382e.cialdi@firenze.net>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040112115643.0000382e.cialdi@firenze.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Massimiliano Cialdi <cialdi@firenze.net>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>, wwp <subscript@free.fr>


> > IOW, if you use a 1-bit bitfield, it will still be require an amount
> > of memory counted in bytes. That's partly why bitfields are not so
> > used for optimization, 'cause following the compiler you don't gaim
> > memory space not cpu time.
> I work with a (very) limited memory embedded system. I need to save
> memory, no matter in cpu time.


if this is the case you could create a macro / function to access 
the individtual bits.

It is slow but you dont have a problem with that
something like

int grab_bit(u8 *bits, int bit) {
	return ((bits[bit >> 3] & (1 << (bit >> 3) & 255)) >> bit);
}

void set_bit(u8 *bits, int bit) {
	bits[bit >> 3] |= 1 << ((bit >> 3) & 255);
}

I am pritty sure the above is wrong but you should get the rought idea
you have an array of 8bits and you access by dividing by 8 then using the
reminder value as the mask to access the individtual bits.

It should be possible todo it with shifts so you dont loose soo much 
speed. Then just use the functions with a declared array of bits.


	James

