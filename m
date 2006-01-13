From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Double values - what precision do I use for fprintf?
Date: Fri, 13 Jan 2006 06:25:28 +0100
Message-ID: <6a00c8d50601122125x32b9ed4avedadbe701975a13b@mail.gmail.com>
References: <200601121800.19678.samjnaa@gmail.com>
	 <6a00c8d50601121051n691ee179kef3298829025e973@mail.gmail.com>
	 <20060112215728.GB1339@drmemory.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20060112215728.GB1339@drmemory.local>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 1/12/06, Scott <drmemory@3rivers.net> wrote:
> On Thu, Jan 12, 2006 at 07:51:08PM +0100, Steve Graegert wrote:
> >
> > Double precision numbering format is standardized by IEEE 754 with an
> > 8 byte encoding.  1 bit is used for the sign, 11 bits for the exponent
> > and the remaining 52 bits are used for the precision, which means
> > precision "ends" at %.52f.
> >
> >       \Steve
> >
> > Steve Graegert <graegerts@gmail.com>
>
> Ummm, I'm no expert and in fact completely out of my element here, but
> how would 52 bits yield 52 decimal numerals following the decimal
> point? Wouldn't it be true that 52 bits could represent at most an
> integer of 2^52 (4503599627370496)? So I am at a loss as to how such a
> format could accurately represent more than 16 significant decimal
> digits....

You're perfectly right, but that's not what I meant.  I just jumped on
the printf analogy to make clear that it does not _print_ any numbers
(except zero) beyond %.52f.  From this POV printf precision "ends"
there, although we know that such numbers are not accurately displayed
beyond 16 significant digits.

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultant {C/C++ && Java && .NET}
Office: +49 9131 7123988
Mobile: +49 1520 9289212
