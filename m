From: "K.Anantha Kiran" <ananth@cse.iitk.ac.in>
Subject: Re: Splitter
Date: Tue, 23 Mar 2004 00:21:15 +0530 (IST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0403230018050.3646-100000@csews32.cse.iitk.ac.in>
References: <405E8AD4.9070402@Saklawi.info>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <405E8AD4.9070402@Saklawi.info>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jad Saklawi <Jad@Saklawi.info>
Cc: linux-c-programming@vger.kernel.org

Hi,
 Thanks for ur suggetsion.
 But we are not clear about the sentece "re invent the loop".
 Can u give clear explanantion about the "iptables" solution.
 IMP: Our machine should not work like a router.I should be able to decide 
to which interface i want to redirect to , on the fly for each packet 
using a HASH like functions.

Thanks,
K.AnanthaKiran
On Mon, 22 Mar 2004, Jad Saklawi wrote:

> Date: Mon, 22 Mar 2004 08:42:28 +0200
> From: Jad Saklawi <Jad@Saklawi.info>
> To: K.Anantha Kiran <ananth@cse.iitk.ac.in>
> Cc: linux-c-programming@vger.kernel.org
> Subject: Re: Splitter
> 
> K.Anantha Kiran wrote:
> 
> >Hi,
> > I want to modify the Linux code for " REDIRECTING PACKETS FROM ONE 
> >INTERFACE TO ANOTHER INTERFACE OF MY INTEREST OUT OF ALL AVAILABLE 
> >INTERFACES". What part of CODE , do i need to concentrate on.
> >
> >  
> >
>     This ain`t gonna be an easy task if you want to do it in kernel 
> space. Why re invent the loop when iptables (netfilter) can do the job ? 
> any way the networking part for the linux kernel is found the net 
> directory in the root directory.
> 
> Greets,
> Jad
> 
> 

