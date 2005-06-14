From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: union versus bit manipulation
Date: Tue, 14 Jun 2005 09:07:46 -0400 (EDT)
Message-ID: <Pine.LNX.4.61.0506140858190.18849@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: C programming list <linux-c-programming@vger.kernel.org>


  looking for advice on the following issue.  some code i've inherited
defines an unsigned 16-bit value that's meant to be interpreted in the
following way in terms of the internal bit structure:

  1-bit		class
  2-bit		type
  13-bit	value

however, in addition to needing to access the individual components of
this object, the code (sadly) also needs to treat the whole thing as
an unsigned 16-bit value to use as a key into a larger data structure.

  at the moment, defining the whole thing as an unsigned 16-bit object
and using bit operations works fine, but i was considering redefining
the type to use a union thusly:

union thing {
        uint16_t thingval ;
        struct S {
                unsigned val    : 13 ;
                unsigned type   : 2 ;
                unsigned class  : 1 ;
        } s ;
} ;


  the major problems i see are that 1) i'd obviously need to guarantee
that the fields in the struct are packed to make sure they still
correspond to the appropriate 16-bit value, and 2) i need to make it
portable across different endian architectures (i'm compiling the code
on am x86 for a Power PC board).

  given the cautions associated with structure packing and alignment,
as well as endianness, is it even worth the trouble to think of
something like this?  or should i just leave the object as a uint16_t
and stick with the bit operations?

rday

p.s.  i can guarantee that i'll be using gcc to compile, which has
some support for forcing packing, but i'm not sure at this point it's
worth the trouble.  thoughts?
