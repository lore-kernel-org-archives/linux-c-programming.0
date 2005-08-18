From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: any compelling reasons to use "offsetof"?
Date: Thu, 18 Aug 2005 10:21:50 -0400 (EDT)
Message-ID: <Pine.LNX.4.63.0508181019570.10814@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: C programming list <linux-c-programming@vger.kernel.org>


  in a legacy project i just inherited, i did a quick recursive grep
and noticed a number of invocations of "offsetof".  from experience,
i've concluded that the majority of these calls are because of sloppy
programming or laziness or just plain doing something incredibly hacky
that could be done in a more straightforward way.

  are there any really compelling reasons to need to know the offset
of a structure field?  just curious.

rday
