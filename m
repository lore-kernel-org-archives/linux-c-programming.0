From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: curious about whether i can count on certain features of C
Date: Sun, 29 May 2005 15:31:04 -0400 (EDT)
Message-ID: <Pine.LNX.4.61.0505291517130.31836@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: C programming list <linux-c-programming@vger.kernel.org>


[newbie alert! :-)]

  i just inherited a sizable C-based project and, perusing the code,
i've come across a number of in-house defined constructs that would
seem to already be supported in standard (C99?) C, and i'm wondering
if there's a reason the previous developer felt he needed to define
these features himself.

  first, there's the definition of "offsetof":

#ifndef offsetof
# define offsetof(type, field) \
    ( (char *) &( ((type *) 0)[0].field ) - (char *) &( ((type *) 0)[0] ) )
#endif

  using any modern definition of C, can i safely assume that this
function/macro is just part of the language (stddef.h)?  and, at the
very least, is there a reason it's defined in such an obscure way
rather than just

  #define offsetof(type,memb) ((size_t)&((type *)0) -> memb)   ???

that first definition might be technically correct but i'm really
trying to simplify things and i don't see any obvious need to keep
that local definition around.

  next, booleans.  based on my copy of "harbison and steele" (5th
ed.), can i reasonably assume the existence of a boolean data type
(stdbool.h)?  i don't have much interest in supporting legacy
compilers, and booleans appear to be part of the C99 definition, so
i'd be really tempted to ditch the following enum type i found:

    enum TCS_bool_Type {
        TCS_bool_FALSE = 0, /**< false/no state */
        TCS_bool_TRUE /**< true/yes state */
    } GCC_PACKED;                       /* enum TCS_bool_Type */

  next, there are a number of typedefs for fixed-width data types:

    typedef signed char TCS_int8_t; /**< signed 8-bit integer */
    typedef unsigned char TCS_u_int8_t; /**< unsigned 8-bit integer */
    typedef signed short TCS_int16_t; /**< signed 16-bit integer */
    typedef unsigned short TCS_u_int16_t; /**< unsigned 16-bit integer */
    typedef signed int TCS_int32_t; /**< signed 32-bit integer */
    typedef unsigned int TCS_u_int32_t; /**< unsigned 32-bit integer */
    typedef TCS_int8_t TCS_tiny_t; /**< signed tiny integer */
    typedef TCS_u_int8_t TCS_u_tiny_t; /**< unsigned tiny integer

is there any compelling reason why i can't just use the types defined
in /usr/include/stdint.h?  that is, int8_t, uint32_t, and so on?  is
there any rationale for someone wanting to do this themselves, apart
from perhaps legacy compiler support?

  i'll probably have a couple more questions after more perusal.
thanks for any advice.

rday

