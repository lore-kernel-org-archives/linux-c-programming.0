From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: using compile-time "assertions"
Date: Sun, 5 Jun 2005 16:36:34 -0400 (EDT)
Message-ID: <Pine.LNX.4.61.0506051632530.5573@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: C programming list <linux-c-programming@vger.kernel.org>


  another question (one of undoubtedly many) regarding the code i
inherited.  in this code, there is liberal use of the following macro:

#define INVARIANT(e) \
  do { \
    struct whatever { char static_assertion[(e) ? 1 : -1]; }; \
    } while (0)

which i recognize as a *compile-time* assertion/invariant.  is this a
common construct?  just curious.  or is there a more popular variant
of this sort of thing?  i recognize its value but, geez, there's
hundreds of these things in the code. :-P

rday
