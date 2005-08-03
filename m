From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: the rationale for redefining integral types?
Date: Wed, 3 Aug 2005 07:53:12 -0400 (EDT)
Message-ID: <Pine.LNX.4.63.0508030750250.4376@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: C programming list <linux-c-programming@vger.kernel.org>


  (i apologize if i asked this before once upon a time, i'm sort of
immersed in digging through some legacy code and it's all starting to
merge together.)

  in this legacy code, one of the previous authors took it upon
himself to redefine some of the basic integral types, such as int8,
int16, int32 ... that sort of thing.

  there doesn't appear to be any benefit to these internally redefined
types over the ones in the standard library, so i can't see why it
would have been done.

  is there some reason a programmer might want to do this?

rday

p.s.  and, no, there doesn't appear to be anything subtlely clever
about the redefinitions.  just plain int and unsigned int of length 8
bits, 16 bits, ... etc.
