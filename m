From: "Jaime Garcia" <jgarcia@vali.com.mx>
Subject: RE: Serial Port (RS-232)
Date: Wed, 28 Jan 2009 18:14:01 -0600
Message-ID: <005401c981a6$7cd4b9c0$767e2d40$@com.mx>
References: <001701c98098$33a5ad90$9af108b0$@com.mx>	<200901271913.39399.m.iatrou@freemail.gr>	<002001c980a5$53e31540$fba93fc0$@com.mx>	<18815.44366.593591.776560@cerise.gclements.plus.com>	<001501c9815b$6cbb6fc0$46324f40$@com.mx> <18816.37793.803089.202815@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <18816.37793.803089.202815@cerise.gclements.plus.com>
Content-Language: es-mx
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Glynn Clements' <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

I'll give a try to this, thank you so much for the reply Glynn!

Regards!

> 
> Jaime Garcia wrote:
> 
> > What I want to do is to read from another device that transmit a
> string of
> > chars through serial connector, what do you recommend? I would like
> to know
> > your approach for this. Thank you in advance for your help.
> 
> First, open() the device.
> 
> Then configure the line settings with e.g.:
> 
> 	struct termios t;
> 	tcgetattr(fd, &t);
> 	t.c_lflag &= ~ICANON;
> 	tcsetattr(fd, TCSANOW, &t);
> 
> The ICANON flag controls the use of "canonical mode" (line buffering,
> processing of control codes, etc). For a device other than a terminal,
> you would normally disable this flag. Exactly how the line is
> configured depends upon the device; see the termios(3) manpage for a
> list of settings.
> 
> Finally, just read() data.
> 
> --
> Glynn Clements <glynn@gclements.plus.com>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-
> programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

