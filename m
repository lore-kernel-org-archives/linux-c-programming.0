From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: type qualifiers on function return types?
Date: Thu, 8 Dec 2005 07:32:38 -0500 (EST)
Message-ID: <Pine.LNX.4.63.0512080728490.10304@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: C programming list <linux-c-programming@vger.kernel.org>


  i was just handed a pile of source code that, upon first build,
complains thusly:

header.h:20: warning: type qualifiers ignored on function return type
header.h:22: warning: type qualifiers ignored on function return type

  at those lines, we read:

  typedef struct blah {
    volatile void           (**start_address)(void);    <--
    volatile char*          stack;
    volatile void           (**manual_start_address)(void); <--
    ...

which seems to explain the warnings since i never thought you could
add type qualifiers to function return types.  or is there something
incredibly clever happening here that i've never seen before?  just
wondering why someone would have coded it that way in the first place.

thanks.

rday
