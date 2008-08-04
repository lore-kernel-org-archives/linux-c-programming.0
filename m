From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: function read() isn't quick enough for reading in ttyS*
Date: Mon, 4 Aug 2008 18:35:08 +0100
Message-ID: <18583.15820.985684.17049@cerise.gclements.plus.com>
References: <48939887.9030303@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <48939887.9030303@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Federico Tula Rovaletti <fedetula@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Federico Tula Rovaletti wrote:

> In a program I'm writing in c, when I use the read() function for
> reading a byte in the serial port with a configuration: 115200 bps,
> 8N2
> 
> takes from 2ms to 6ms (aleatory, even if read up to 10 bytes takes the
> same time), which is  too long.
> (ioctl(fd, FIONREAD, &bytes)  last the same)
> 
> This is the time is suppose to last:
> 8 bits: data
> 2 bits: stop
> 1 bit: start
> time = ((8+2+1)bits/115200bps) = 0.095ms,
> 
> then when I read the byte with the function inb_p() takes ~ 0.1ms
> which is perfect, what I'm needing for my project.
> 
> The problem I'm having is that I use signals (with fcntl(fd, F_SETFL,
> O_ASYNC) ) but this signals last the same time in occur that the
> read() (unacceptable) so I guess that this is a problem of the driver
> that is to slow.
> 
> So the question is, is there any way to improve the performance of the
> driver, or how can I have a faster response with read()? (doing inb_p
> is very nasty). Do I'm doing something wrong?

Are you using real-time scheduling?

Getting such low latency in user space is tricky, but not impossible. 
You might want to look at JACK (www.jackaudio.org) for clues; they
have similar issues

-- 
Glynn Clements <glynn@gclements.plus.com>
