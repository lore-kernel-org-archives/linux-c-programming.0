From: Nicolae Mihalache <mache@abcpages.com>
Subject: tcpdump equivalent for the serial port
Date: Fri, 12 Sep 2003 15:37:24 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F61CC14.20607@abcpages.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hello!

I'm interested if somebody has any ideea how to write a program that is 
able to sniff the data passing through a serial port the same way 
tcpdump is able to show the data passing through the ethernet cable, 
i.e. without disturbing the application that sends/receives the data.
I've seen few programs that basically work as tunnels opening a 
pseudo-console where the application connects and writing on the other 
side to the serial device. This approach is not very useful because I 
want to be able to start/stop my sniffer without interupting the 
communication and also the application can control different settings of 
the serial port which probably will not be forwarded by the tunnel.

Thanks,
mache

