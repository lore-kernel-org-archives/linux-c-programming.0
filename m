From: Massimiliano Cialdi <cialdi@firenze.net>
Subject: serial transimission/reception buffer infos
Date: Mon, 4 Oct 2004 17:04:34 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20041004170434.55ef0a0d.cialdi@firenze.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

I need to use ttyS? serial port. I need to "read" some information from
rx/tx buffers, like dimensions of buffers (is dimensions settable by my
application?), how many characters are still in transmission buffer (not
already send), if there was an overrun in reception buffer.

There exist FIONREAD requesto of ioctl(), but it only work on reception
buffer.

there exist some low leve function?

thanks

-- 
Massimiliano Cialdi
cialdi@firenze.net
m.cialdi@oksys.it
