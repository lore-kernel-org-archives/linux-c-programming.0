From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: SIGIO interrupts poll
Date: Tue, 3 Feb 2004 22:47:06 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16416.9450.454219.655277@cerise.nosuchdomain.co.uk>
References: <20040203165940.CE70839A1@mprdmxin.myway.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040203165940.CE70839A1@mprdmxin.myway.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: redsprite@myway.com
Cc: linux-c-programming@vger.kernel.org


redsprite wrote:

> I'm working on a large software project and two of the developers have
> coded each other into a corner.
> 
> Specifically, one thread catches SIGIO to read from a hardware device
> over the serial port. A second thread uses poll() to read from some
> sockets to other computers.
> 
> Independently they work, but when put together the thread that catches
> SIGIO is preventing the socket-reading thread from getting any of its
> data.
> 
> Is there a way to have the SIGIO handler re-throw the signal so the
> thread using poll() can catch it?

If you don't need the siginfo_t, you can use pthread_kill() to send a
signal to a specific thread.

-- 
Glynn Clements <glynn.clements@virgin.net>
