From: "K.Anantha Kiran" <ananth@cse.iitk.ac.in>
Subject: Re: Can i use dev_queue_xmit
Date: Wed, 7 Apr 2004 16:44:59 +0530 (IST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0404071643130.9950-100000@csews110.cse.iitk.ac.in>
References: <Pine.LNX.4.44.0404070954110.12893-100000@csews106.cse.iitk.ac.in>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0404070954110.12893-100000@csews106.cse.iitk.ac.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Armen Kaleshian <akaleshian@kriation.com>
Cc: linux-c-programming@vger.kernel.org

 
 
 Anyway we have written a module,
   If you know any idea about our problem,(dropping packets due to 
 NET_XMIT_DROP return value of dev_queue_xmit()) can u help us.Atleast 
 suggest a source where we can get answer for my problem.
   We want to know the situation(or)Reason when NET_XMIT_DROP will be 
returned.
 
 Thanks,
 K.AnanthaKiran
 
> On Tue, 6 Apr 2004, Armen Kaleshian wrote:
> 
> > Date: Tue, 6 Apr 2004 12:55:29 -0400
> > From: Armen Kaleshian <akaleshian@kriation.com>
> > To: K.Anantha Kiran <ananth@cse.iitk.ac.in>
> > Cc: linux-c-programming@vger.kernel.org
> > Subject: Re: Can i use dev_queue_xmit
> > 
> > Why don't you look at the source for iptables? Or use iptables instead of writing the kernel module from scratch?
> > 
> > Good luck!
> > 
> > On Tue, Apr 06, 2004 at 07:50:50PM +0530, K.Anantha Kiran wrote:
> > : 
> > :  We are supposed to build a kernel module which takes packets in the
> > :  internet through one interface and forward them to another interface of
> > :  my choice based on the IP,Port feilds in the packet.
> > : 
> > : Our module is working fine for less rate(200Mbps) of traffic.If speed is 
> > : increasing(>200Mbps), for some packets "dev_queue_xmit()" is returning NET_XMIT_DROP due to which packets are being dropped.
> > : 
> > :  Can u suggest any solution. Can u give the reason for that return value
> > :  only for high traffic.Is there any speed restiction to dev_queue_xmit() 
> > : We are using Gigbyte traffic ethrtnet cards.
> > : 
> > : Thanks in advance,
> > : K.AnanthaKiran
> > : 
> > : 
> > : 
> > : -
> > : To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> > : the body of a message to majordomo@vger.kernel.org
> > : More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > 
> 
> 

