From: "Jaime Garcia" <jgarcia@vali.com.mx>
Subject: RE: Serial Port (RS-232)
Date: Wed, 28 Jan 2009 09:16:42 -0600
Message-ID: <001501c9815b$6cbb6fc0$46324f40$@com.mx>
References: <001701c98098$33a5ad90$9af108b0$@com.mx>	<200901271913.39399.m.iatrou@freemail.gr>	<002001c980a5$53e31540$fba93fc0$@com.mx> <18815.44366.593591.776560@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <18815.44366.593591.776560@cerise.gclements.plus.com>
Content-Language: es-mx
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi Glynn,
What I want to do is to read from another device that transmit a string of
chars through serial connector, what do you recommend? I would like to know
your approach for this. Thank you in advance for your help.

Best Regards!


> -----Mensaje original-----
> De: Glynn Clements [mailto:glynn@gclements.plus.com]
> Enviado el: Martes, 27 de Enero de 2009 06:57 p.m.
> Para: Jaime Garcia
> CC: linux-c-programming@vger.kernel.org
> Asunto: RE: Serial Port (RS-232)
> 
> 
> Jaime Garcia wrote:
> 
> > > > I am pretty new to Linux programming, I want to start doing
> something
> > > > useful, so I was thinking to start programming the serial port
> (RS-232)
> > > > of my box, so I can read and write data from it, can someone of
> you give
> > > > some feedback about how to start this?
> > >
> > > The keyword you are looking for is ``ioctl''.
> >
> > Right now I opened man ioctl(2) to start looking for directions on
> > this, I appreciate so much your tip, thanks a lot! =-)
> 
> You probably don't need to use ioctl() unless you need to treat the
> serial port as a general-purpose I/O port (e.g. manually setting the
> control lines).
> 
> If you just want to talk to another serial device, open()ing one of
> the /dev/ttyS* devices and using tcsetattr/tcgetattr will normally
> suffice.
> 
> If you do need to use ioctl(), the ioctl(2) manpage won't help much,
> as ioctl() is a generic interface to device-specific functionality.
> The tty_ioctl(4) manpage has details related to TTY (serial) ioctl()
> commands.
> 
> --
> Glynn Clements <glynn@gclements.plus.com>

