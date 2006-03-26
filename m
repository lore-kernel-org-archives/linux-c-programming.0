From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Virtual Serial Port
Date: Sun, 26 Mar 2006 11:31:19 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0603261127580.22145@yvahk01.tjqt.qr>
References: <442582B8.8040403@gmail.com> <Pine.LNX.4.61.0603251945100.29793@yvahk01.tjqt.qr>
 <4425FB22.7040405@gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4425FB22.7040405@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikado <mikado4vn@gmail.com>
Cc: linux-c-programming@vger.kernel.org, linux-kernel@vger.kernel.org

>> You could write a device driver implementing virtual serial ports. Then you 
>> just add an ioctl that connects/disconnects virtual ports to real ports if 
>> desired.
>> I do not quite see what this would be good for, but I am sure it's 
>> good for learning or for fun. :)
>
>My purpose is to provide serial interfaces for debugging. My real box
>acts as remote host connecting to VMWare box by a *virtual* serial cable
>so that I can set up a debugging environment.
>
Ah! You don't want to have the X11 overhead of VMware. Quite an idea.
If I get it right, your setup looks like:

  guest writes to /dev/ttyS0
  vmware connects its virtual S0 to the host's ttyFakeS0
  minicom on the host to ttyFakeS0
or even
  vmware S0 to host's ttyS0
  other remote machine do minicom to ttyS0

The reason for FakeS0 is that vmware does not know about ptys, 
unfortunately.


Jan Engelhardt
-- 
