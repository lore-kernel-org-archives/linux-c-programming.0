From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Virtual Serial Port
Date: Sat, 25 Mar 2006 19:47:41 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0603251945100.29793@yvahk01.tjqt.qr>
References: <442582B8.8040403@gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <442582B8.8040403@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikado <mikado4vn@gmail.com>
Cc: linux-c-programming@vger.kernel.org, linux-kernel@vger.kernel.org

>My machine has only one serial port. Now I want to add more *software*
>(virtual) serial ports. I also want to make a virtual serial cable
>between a real serial port and a virtual one OR between virtual ports.
>Is there any way to solve that problem in our universe?

You could write a device driver implementing virtual serial ports. Then you 
just add an ioctl that connects/disconnects virtual ports to real ports if 
desired.
I do not quite see what this would be good for, but I am sure it's 
good for learning or for fun. :)



Jan Engelhardt
-- 
