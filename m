From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: why no preprocessor #warning or #note directives?
Date: Sun, 22 Jan 2006 08:39:08 -0500 (EST)
Message-ID: <Pine.LNX.4.63.0601220835530.4077@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: C programming list <linux-c-programming@vger.kernel.org>


  not a big deal, but i'm curious why C hasn't been extended to
include the gcc extension #warning macro?

  more to the point, why not additional directives like, say, #note or
#info.  there are times (in gcc) when i want some feedback from the
preprocessor as it's running and i'll use #warning.  but i'm not happy
with that since what's happening isn't something that really requires
a "warning", it's just something i wanted to know about.

  was there ever any discussion to add an extra information directive
or two to the preprocessor?  just curious.  it doesn't seem like this
would be a major issue in terms of enhancement.

rday
