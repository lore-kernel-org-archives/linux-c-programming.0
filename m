From: "william fitzgerald" <william.fitzgerald3@beer.com>
Subject: how do i get a packets contents from using printks
Date: Mon, 13 May 2002 15:03:17 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <44D8933CAE839984FA29FC69B9F24B15@william.fitzgerald3.beer.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

hi all,

i have inserted printk statements into a 2.4.14
kernel in the networking code and want to trace a
packet through the kerenl.

i have being able to record a particular sk_buff
by for example:
printk(KERN_DEBUG"ip_forwrd(sk_buff %P)-> entry
point",skb);

but how do i extract the packets headers etc from
the sk_buff?


Beer Mail, brought to you by your friends at beer.com.
