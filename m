From: "K.Anantha Kiran" <ananth@cse.iitk.ac.in>
Subject: Can i use dev_queue_xmit()
Date: Mon, 12 Apr 2004 12:54:17 +0530 (IST)
Sender: linux-net-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0404121246040.5450-100000@csews104.cse.iitk.ac.in>
References: <Pine.LNX.4.44.0404121223250.5450-100000@csews104.cse.iitk.ac.in>
Mime-Version: 1.0
Return-path: <linux-net-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0404121223250.5450-100000@csews104.cse.iitk.ac.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-net@vger.kernel.org, linux-c-programming@vger.kernel.org

 
Hi,
 
 	We are printing the return value of dev_queue_xmit() and we 
 confirm that this will be NET_XMIT_DROP for dropped pkts.
 
 	in *dev_queue_xmit()* function , there is a call to  *enqueue()* 
 which is function pointer pointing to, /net/sched/sch_generic.c 
 pfifo_fast_enqueue() function. In this if the length of queue is greater 
 that the txqueuelen( a parameter of NIC ) then the packet is not queued 
 and DROPPED.
  
 static int pfifo_fast_enqueue(struct sk_buff *skb, struct Qdisc* qdisc)
     {
 	
 		struct sk_buff_head *list;
    
             list = ((struct sk_buff_head*)qdisc->data) +
                    prio2band[skb->priority&TC_PRIO_MAX];
    
             if (list->qlen <= qdisc->dev->tx_queue_len) {
                     __skb_queue_tail(list, skb);
                     qdisc->q.qlen++;
                     return 0;
             }
             qdisc->stats.drops++;
             kfree_skb(skb);
             return NET_XMIT_DROP;
    }
 
 	We have tested this by printing the values of list->qlen and 
 checking for different values of txqueuelen ( def-100 upto 100000). still 
 the packets are being dropped after some time when the condition fails. 
 and this is continuing until the whole queue is empty, after this it is 
 again resuming to Xmit properly, this phenomenon is repeated.Actually we 
sending 10 lakh pkts at 500 Mbps speed.  
 
 	The problem is that " is there any flag that tell the queue is 
 full and once it is full it will not take any pkts in and drops all 
 till the queue is empty". If so can u plz suggest a solution to this 
 problem.
 
 
 thanks,
 Ananth.

