From: Mark Johnson <rmjohnson144@adelphia.net>
Subject: C module won't load
Date: Sat, 27 Apr 2002 16:19:42 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3CCB320E.8030503@adelphia.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hello All,

     I am new to linux and C and I am having trouble loading in my new 
network drivers.  I compile the module like the docs say, and everything 
seems to be OK, but when I insmod it into memory I get an error: 
unresolved symbol pci_drv_unregister and pci_drv_register.  I am 
compiling rtl8139.c for my RealTec 8139 network card.  I use gcc version 
2.96 and linux 2.4.9-31 under Red Hat and KDE desktop 2.2.2-2. Any help 
would be appreciated.

-=Mark=-

