From: "K.Anantha Kiran" <ananth@cse.iitk.ac.in>
Subject: Can i use dev_queue_xmit
Date: Tue, 6 Apr 2004 19:50:50 +0530 (IST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0404061946380.15974-100000@csews29.cse.iitk.ac.in>
References: <1080048682.7452.69.camel@one.test.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1080048682.7452.69.camel@one.test.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org


 We are supposed to build a kernel module which takes packets in the
 internet through one interface and forward them to another interface of
 my choice based on the IP,Port feilds in the packet.

Our module is working fine for less rate(200Mbps) of traffic.If speed is 
increasing(>200Mbps), for some packets "dev_queue_xmit()" is returning NET_XMIT_DROP due to which packets are being dropped.

 Can u suggest any solution. Can u give the reason for that return value
 only for high traffic.Is there any speed restiction to dev_queue_xmit() 
We are using Gigbyte traffic ethrtnet cards.

Thanks in advance,
K.AnanthaKiran



