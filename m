From: Heinrich du Toit <hdutoit@tlabs.ac.za>
Subject: wait_queue's
Date: Tue, 03 Dec 2002 10:01:58 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3DEC64F6.4050003@tlabs.ac.za>
Reply-To: hdutoit@tlabs.ac.za
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: linux-c-programming mailing list <linux-c-programming@vger.kernel.org>

Hello

I'm busy writing a device driver.
This device driver exports one char device.

Now the problem it that when 2 programs try to write to this device at 
the same time...
Well it works but they don't get queue fairly.

Both processes write's get blocked.. But for a long time in a row only 
one seem to write and the otherone stays block.
I think the problem is that the kernel wait queue is a LIFO structure 
and not a FIFO

Anyway in which I could change it to a FIFO? or any other ideas?

Thanks
-Heinrich


