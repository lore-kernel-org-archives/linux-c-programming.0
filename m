From: "John T. Williams" <jtwilliams@vt.edu>
Subject: stdio
Date: Wed, 18 Jun 2003 05:58:42 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <011801c33580$48425aa0$e764a8c0@fesnel.noip.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

I am trying to figure out how to cause a character to be printed to a
specific place on the terminal

what I'm actually trying to accomplish is to make a progress bar

example:

Progress [*****                           ]  25%

and I want it to fill up the box with stars as my program progresses, but I
can't figure out how to just get c to write a single '*'  to anywhere other
then the end of the streak
I tried lseek and got no good results.

I'd really like any advice anyone has on this.

