From: "Stalin Kenny" <stalinlinux@gmail.com>
Subject: Re: function read() isn't quick enough for reading in ttyS*
Date: Mon, 4 Aug 2008 00:44:13 -0500
Message-ID: <8cef9d540808032244s50e2317aka5fc8acdf1974dbe@mail.gmail.com>
References: <48939887.9030303@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=wYmLtaaUw2qvZ/FKXhfDg3FEhywClYB/swMIPeCm0qg=;
        b=DKK15SSN9lBAMgqa/WQWw/aTuhlmlC+kb2YPvfNpqnqbXE2wHijuRxWFDSorXN66sz
         0mncJhrP41am/B0dYkGgzLKGi7wSgYy88aXjrIe+8fQYoUcaSIgZCyf6elBxWatMCOuz
         uSuyuTRkIsn6je/WMbazbmF0YekDv7Xo/lJp8=
In-Reply-To: <48939887.9030303@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Federico Tula Rovaletti <fedetula@gmail.com>
Cc: linux-c-programming@vger.kernel.org

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

I guess the context switch that is taking place when you issue ioctl
is contributing to the extra time that you are noticing.

Stalin
