From: Scott <drmemory@3rivers.net>
Subject: Re: Double values - what precision do I use for fprintf?
Date: Thu, 12 Jan 2006 14:57:29 -0700
Message-ID: <20060112215728.GB1339@drmemory.local>
References: <200601121800.19678.samjnaa@gmail.com> <6a00c8d50601121051n691ee179kef3298829025e973@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6a00c8d50601121051n691ee179kef3298829025e973@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Thu, Jan 12, 2006 at 07:51:08PM +0100, Steve Graegert wrote:
> 
> Double precision numbering format is standardized by IEEE 754 with an
> 8 byte encoding.  1 bit is used for the sign, 11 bits for the exponent
> and the remaining 52 bits are used for the precision, which means
> precision "ends" at %.52f.
> 
> 	\Steve
> 
> Steve Graegert <graegerts@gmail.com>

Ummm, I'm no expert and in fact completely out of my element here, but
how would 52 bits yield 52 decimal numerals following the decimal
point? Wouldn't it be true that 52 bits could represent at most an
integer of 2^52 (4503599627370496)? So I am at a loss as to how such a
format could accurately represent more than 16 significant decimal
digits....

Scott Swanson

