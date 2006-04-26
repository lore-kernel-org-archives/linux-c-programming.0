From: gutter <gutter@bk.ru>
Subject: Working with COM-port from kernel module
Date: Wed, 26 Apr 2006 11:16:45 +1100
Message-ID: <444EBBED.8060203@bk.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi, all.

Could you, please, help me?

I want to write a linux-driver for a device connected to computer over a 
serial port to access it through /dev/mydev, but i'm not sure how to do 
it. I mean, i can access my device from user-mode program, setting 
termios structure and working with device through file /dev/ttySx.

1. But how can i in kernel-mode open /dev/ttySx, setup termios and 
read/write?
2. Should i use some kernel functions to do it or i shouldn't use 
termios and have to program harware ports (such as 0x3F8 etc) using 
inb/outb?
3. If i should program harware ports then how can i disable native linux 
serial driver (couse when my driver and linux driver will exist together 
they won't work, i think)?
4. And is there any way to use native linux serial driver from my driver 
to open serial port and read/write it?

Thank you in advance.

Mihail.
