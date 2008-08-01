From: Federico Tula Rovaletti <fedetula@gmail.com>
Subject: function read() isn't quick enough for reading in ttyS*
Date: Fri, 01 Aug 2008 20:13:11 -0300
Message-ID: <48939887.9030303@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=/P93XX1WuNmvsVPJchEs4WDBXsYamsgDvyLRJ/0X82U=;
        b=u2WKqJgyLHvDNda4YvIfKNtrUwO5FgybMJyPJ8uryNcjkjsyNmXvitlAd0iGdvNvxT
         mMjR0zNpi9TIs1+73r8KA9criTxmFB1/2R6HrXAgs36GEkp+3kCW0VkhJDh1d2xIB1VP
         Cy1GL+39ityDUaJeKEnZvE57Y1NHWjS50+LbI=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi all! I'm a novice in Linux

In a program I'm writing in c, when I use the read() function for
reading a byte in the serial port with a configuration: 115200 bps,
8N2

takes from 2ms to 6ms (aleatory, even if read up to 10 bytes takes the
same time), which is  too long.
(ioctl(fd, FIONREAD, &bytes)  last the same)

This is the time is suppose to last:
8 bits: data
2 bits: stop
1 bit: start
time = ((8+2+1)bits/115200bps) = 0.095ms,

then when I read the byte with the function inb_p() takes ~ 0.1ms
which is perfect, what I'm needing for my project.

The problem I'm having is that I use signals (with fcntl(fd, F_SETFL,
O_ASYNC) ) but this signals last the same time in occur that the
read() (unacceptable) so I guess that this is a problem of the driver
that is to slow.

So the question is, is there any way to improve the performance of the
driver, or how can I have a faster response with read()? (doing inb_p
is very nasty). Do I'm doing something wrong?

Thanks in advance!, I expect as soon as possible any answer

PD: sorry for my bad English,

