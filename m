From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Check serial port buffer
Date: Fri, 10 May 2002 11:07:08 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15579.39884.432208.375087@cerise.nosuchdomain.co.uk>
References: <3CC9462B.9050401@xnet.ro>
	<002a01c1f802$21939e30$544615ac@stud.unikarlsruhe.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <002a01c1f802$21939e30$544615ac@stud.unikarlsruhe.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel <uval@rz.uni-karlsruhe.de>
Cc: linux-c-programming@vger.kernel.org


Daniel wrote:

> > Can anyoune tell me how can I check the first byte of the serial port
> > buffer without removing it from the buffer?
> 
> doesn't ungetch() work ?

ungetc() puts the character back in the stdio buffer. It can't put it
back into the underlying OS stream.

-- 
Glynn Clements <glynn.clements@virgin.net>
