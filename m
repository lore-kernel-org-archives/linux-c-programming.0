From: <Sreecharan.Sivadevuni@nokia.com>
Subject: RE: Splitter
Date: Tue, 23 Mar 2004 17:19:16 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <79A2DB53BC51BD448F0D19A86FB1DB63030FC529@siebe002.apac.nokia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
content-class: urn:content-classes:message
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming-owner@vger.kernel.org
Cc: linux-c-programming@vger.kernel.org

hi,
         Just add a module to the running kernel and use the firewall 
registration mechanism. With that you will get the packet in your input 
function and once you have the packet you can do anything with it right ?
its very simple u need not change the kernel code at all; all u need to 
do is load a module into kernel.

regards
Sreecharan.S

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org]
Sent: Tuesday, March 23, 2004 12:12 AM
To: Glynn Clements
Cc: linux-c-programming@vger.kernel.org
Subject: Re: Splitter



Hi,
  I am giving some what better description of my problem.I want to modify 
the Linux code for " REDIRECTING PACKETS REACHING ONE INTERFACE , AS IT IS 
TO ANOTHER INTERFACE OF MY INTEREST OUT OF ALL AVAILABLE 
 INTERFACES".Note PACKETS here should not be allowed to go beyond IP 
layer .That means System should not do any changes to the packet 
before outputting.What part of CODE , do i need to concentrate on.

 Thanks in advance,
 K.AnanthaKiran
 

-
To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
