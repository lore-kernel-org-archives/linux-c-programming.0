From: Glynn Clements <glynn@gclements.plus.com>
Subject: RE: Serial Port (RS-232)
Date: Wed, 28 Jan 2009 00:56:46 +0000
Message-ID: <18815.44366.593591.776560@cerise.gclements.plus.com>
References: <001701c98098$33a5ad90$9af108b0$@com.mx>
	<200901271913.39399.m.iatrou@freemail.gr>
	<002001c980a5$53e31540$fba93fc0$@com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <002001c980a5$53e31540$fba93fc0$@com.mx>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jaime Garcia <jgarcia@vali.com.mx>
Cc: linux-c-programming@vger.kernel.org


Jaime Garcia wrote:

> > > I am pretty new to Linux programming, I want to start doing something
> > > useful, so I was thinking to start programming the serial port (RS-232)
> > > of my box, so I can read and write data from it, can someone of you give
> > > some feedback about how to start this?
> > 
> > The keyword you are looking for is ``ioctl''.
> 
> Right now I opened man ioctl(2) to start looking for directions on
> this, I appreciate so much your tip, thanks a lot! =-)

You probably don't need to use ioctl() unless you need to treat the
serial port as a general-purpose I/O port (e.g. manually setting the
control lines).

If you just want to talk to another serial device, open()ing one of
the /dev/ttyS* devices and using tcsetattr/tcgetattr will normally
suffice.

If you do need to use ioctl(), the ioctl(2) manpage won't help much,
as ioctl() is a generic interface to device-specific functionality. 
The tty_ioctl(4) manpage has details related to TTY (serial) ioctl()
commands.

-- 
Glynn Clements <glynn@gclements.plus.com>
