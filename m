From: "redsprite" <redsprite@myway.com>
Subject: SIGIO interrupts poll
Date: Tue,  3 Feb 2004 11:59:40 -0500 (EST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040203165940.CE70839A1@mprdmxin.myway.com>
Reply-To: redsprite@myway.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


I'm working on a large software project and two of the developers have coded each other into a corner.

Specifically, one thread catches SIGIO to read from a hardware device over the serial port. A second thread uses poll() to read from some sockets to other computers.

Independently they work, but when put together the thread that catches SIGIO is preventing the socket-reading thread from getting any of its data.

Is there a way to have the SIGIO handler re-throw the signal so the thread using poll() can catch it?

Andrea

_______________________________________________
No banners. No pop-ups. No kidding.
Introducing My Way - http://www.myway.com
