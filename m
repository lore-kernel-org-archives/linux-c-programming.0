From: "Tosoni" <jp.tosoni@acksys.fr>
Subject: RE: Accessing USB thermometer sensor
Date: Mon, 23 Jun 2008 09:20:27 +0200
Message-ID: <003301c8d501$9cf1e040$2e01a8c0@acksys.local>
References: <8b08c39f01286180748bbc0eeddc56cb.squirrel@webmail.vp44.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-serial-owner@vger.kernel.org>
In-Reply-To: <8b08c39f01286180748bbc0eeddc56cb.squirrel@webmail.vp44.net>
Sender: linux-serial-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jhammond@external.fwmail.org, linux-usb@vger.kernel.org, linux-serial@vger.kernel.org, linux-c-programming@vger.kernel.org

> the right direction to be able to read the temperature from command
> line?
> Josh
>
Reading a serial device from the commannd line is not easy.
First because each command you type closes the port after running and so it
flushes buffers.

I would suggest using shell parenthesis to group the commands
Use stty to set the port to raw mode etc.
Use 'echo' and 'dd' which is like 'cat' but much more configurable for
buffer sizes
something like:
( stty 9600 raw; echo 'request'; dd bs=1 count=10 >response.out)
</dev/serialusb >&0

