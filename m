From: James Stevenson <james@ez-dsp.com>
Subject: Re: Can i use dev_queue_xmit()
Date: Mon, 19 Apr 2004 11:59:08 +0100 (BST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0404191158340.18753-100000@Beast.ez-dsp.com>
References: <Pine.LNX.4.44.0404121616450.11451-100000@csews110.cse.iitk.ac.in>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0404121616450.11451-100000@csews110.cse.iitk.ac.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "K.Anantha Kiran" <ananth@cse.iitk.ac.in>
Cc: Anupam <anupamg@iitk.ac.in>, linux-c-programming@vger.kernel.org


Thats 2 off topic posts i count on this.

linux-c-programming is userspace releated you might want
to try the linux-kernel list or the kernelnewbies list

	James

On Mon, 12 Apr 2004, K.Anantha Kiran wrote:

> Hi,
> 
>   Sorry, we did not put our question in correct way. 
>   We came to know that whenever qdisc is full some flag is set and
> it will be unset only when qdisc is completely empty once again.
>   Because of this we are unable to enque packets in the qdisc even when 
> some space is available. What i want is to enqueue packets as soon as 
> qdisc has space for atleast one packet.
>   Even if i am increasing the qdisc length, then also after some time
> again the qdisc is getting full and packets are getting dropped.
> 
>  Note: I am using gigabit ethernet cards.
> 
>  Please help me in this matter.
> 
> Thanks in advance,
> Regards,
> Ananth.
> 
> 
> On Mon, 12 Apr 2004, Anupam wrote:
> 
> > Date: Mon, 12 Apr 2004 14:16:43 +0530
> > From: Anupam <anupamg@iitk.ac.in>
> > To: K.Anantha Kiran <ananth@cse.iitk.ac.in>
> > Subject: Re: Can i use dev_queue_xmit()
> > 
> > K.Anantha Kiran wrote:
> > >  	The problem is that " is there any flag that tell the queue is 
> > >  full and once it is full it will not take any pkts in and drops all 
> > >  till the queue is empty". If so can u plz suggest a solution to this 
> > >  problem.
> > 
> > 
> > Hi Anantha,
> > 
> >  From above description of yours, I presume that you're trying something 
> > that is called "Flush Queue", i.e., when a queue is overloaded, there is 
> >   option to drop all packets in queue. This means that all the adaptive 
> > flow should back-off. However it is quite inefficient since all the 
> > backed-off flows will startup again.
> > 
> > Anyways, I didn't get the chance to dig up the code myself, but my guess 
> > is that solution for you lies in: linux/net/sched/cls_api.c.
> > 
> > 
> > >  thanks,
> > >  Ananth.
> > 
> > 
> > Please do let me know how things go.
> > 
> > Regards,
> > 
> > Anupam Gupta, Ph.D.
> > mailto:anupamg@iitk.ac.in
> > Deptt. of EE,
> > Res. E1-315, Hall-4
> > IIT Kanpur.
> > 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

