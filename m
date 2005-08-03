From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: relationship between standard C and gcc compiler suite?
Date: Wed, 3 Aug 2005 09:47:48 -0400 (EDT)
Message-ID: <Pine.LNX.4.63.0508030942160.7360@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: C programming list <linux-c-programming@vger.kernel.org>


  according to my 5th ed. of H&S, C99 introduced the unsigned integer
type "_Bool" and refers to the corresponding header file stdbool.h.
but on my linux system, that header file is not in the standard
/usr/include directory, where i would have expected it.

  rather, it's included with gcc-4.0.1, and it's in this directory:

/usr/lib/gcc/i386-redhat-linux/4.0.1/include

i'm sure the end result is the same in that i can just

  #include <stdbool.h>

 but is there some kind of overall rationale as to what "standard"
header files would actually be supplied by gcc itself?  just trying to
figure out the pattern here.  obviously, this question generalizes to
more than just asking about the boolean file.

rday
