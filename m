From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: C module won't load
Date: Sun, 28 Apr 2002 00:34:06 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15563.13678.310301.532264@cerise.nosuchdomain.co.uk>
References: <3CCB320E.8030503@adelphia.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3CCB320E.8030503@adelphia.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mark Johnson <rmjohnson144@adelphia.net>
Cc: linux-c-programming@vger.kernel.org


Mark Johnson wrote:

>      I am new to linux and C and I am having trouble loading in my new 
> network drivers.  I compile the module like the docs say, and everything 
> seems to be OK, but when I insmod it into memory I get an error: 
> unresolved symbol pci_drv_unregister and pci_drv_register.

Try using "modprobe" instead of "insmod". BTW, you also need to have
installed the pci-scan.o module.

-- 
Glynn Clements <glynn.clements@virgin.net>
