From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: what is the current status of "stdint.h"?
Date: Fri, 23 Dec 2005 06:27:03 -0500 (EST)
Message-ID: <Pine.LNX.4.63.0512230621170.4326@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: C programming list <linux-c-programming@vger.kernel.org>


  (perhaps a bit off-topic, a combination of a C and gcc and glibc
question.)

  perusing the GCC manual, i notice that a freestanding C99
implementation is supposed to include both <stdbool.h> and <stdint.h>.
i notice that the most recent version of gcc *does* include stdbool.h,
but doesn't include stdint.h, which matches what you read here:

http://gcc.gnu.org/c99status.html

  *howeever*, on my linux system (FC4), the package glibc-headers
*does* include /usr/include/stdint.h, which certainly seems to match
what i imagine stdint.h should eventually contain.

  is the plan for stdint.h to evetually be moved out of glibc-headers
and into gcc to conform with the official definition of C99?  or is
that glibc-headers file "/usr/include/stdint.h" unrelated to the
eventual C99 support for stdint.h?  or what?

rday
