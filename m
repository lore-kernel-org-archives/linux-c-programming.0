From: "David S. Miller" <davem@redhat.com>
Subject: Re: this code does not get called in dev.c so do we need it?
Date: Thu, 03 Oct 2002 04:14:49 -0700 (PDT)
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <20021003.041449.58450031.davem@redhat.com>
References: <20021002.171042.42890215.davem@redhat.com>
	<20021003111356.51794.qmail@web13101.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-Reply-To: <20021003111356.51794.qmail@web13101.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: linux_learning@yahoo.co.uk
Cc: linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org

   From: will fitzgerald <linux_learning@yahoo.co.uk>
   Date: Thu, 3 Oct 2002 12:13:56 +0100 (BST)

   you say that fast routing occurs in the device driver
   level. 
   how does it send a packet from router eth0 to router
   eth1? 
   is it on the bus? (is this like zero copy jumping from
   one device directly to another?)
   
It passes the packet directly to the output method of
the target device for the route.  Just like I said in
my original email, nothing more nothing less.

   if fast routing saves time in not having to go to the
   ip layer why is it not used alll the time? 
   
Because it is used only by a limited number of people
and it makes drivers harder to maintain since very few
people have the setups necessary to test this feature
properly.

   is it buggy? 

No.
