From: "K.Anantha Kiran" <ananth@cse.iitk.ac.in>
Subject: Re: Splitter
Date: Tue, 23 Mar 2004 17:24:13 +0530 (IST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0403231716230.9445-100000@csews38.cse.iitk.ac.in>
References: <1080041902.7454.54.camel@one.test.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1080041902.7454.54.camel@one.test.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: syedk <syedk@intotoinc.com>
Cc: Jad Saklawi <Jad@Saklawi.info>, linux-c-programming@vger.kernel.org

Hi,
  Whenever we receive a packet( let it is stored in skb), can we directly 
change the skbuff->dev and call dev_queue_xmit(skbuff) without undergoing 
any processing in this system. That means this will simply take one packet and 
keep it in another interface( for suppose there are no packets destined 
for this system) . Doing this will cause any problems? 



On 23 Mar 2004, syedk wrote:

> Date: 23 Mar 2004 17:08:20 +0530
> From: syedk <syedk@intotoinc.com>
> To: K.Anantha Kiran <ananth@cse.iitk.ac.in>
> Cc: Jad Saklawi <Jad@Saklawi.info>, linux-c-programming@vger.kernel.org
> Subject: Re: Splitter
> 
> you can look into dev_queue_xmit(sk_buff) function in net/core/dev.c
> 
>  sk_buff->dev  has the information abt the device (can be any interface
> registered using register_netdevice() for that matter)...
> 
> dev_queue_xmit just transfers the sk_buff for the device for
> delivery....
> 
> I feel the best way to solve your problem would be use NF_IP_PRE_ROUTING
> hook of netfilter by which u get all packets ( even before any routing
> decisions has been made : that is what u wanted RIGHT??) and then call
> dev_queue_xmit function by setting the sk_buff->dev as whatever
> interface u wish to redirect....
> 
> I hope this would help....
> 
> Best regards
> syed sk
> 
> 
> On Tue, 2004-03-23 at 15:09, K.Anantha Kiran wrote:
> > Hi,
> >  Thanks a lot for ur guidance.
> >  I am following the same files(i mean NET directory).But i am facing 
> > following problem.
> >  " where the output interface variable (rtable->key->oif) is changed to 
> > the index of interface through which packet has to go out. In the function 
> > /net/route.c ip_route_input_slow() they are setting it to 0 what is it 
> > mean.
> > 
> > 	When a packet has to be put on to an interface what are the fields 
> > will it use to decide that( in skbuff structure).
> > 
> > Thanks 
> > regards,
> > K. Anantha kiran
> > 
> > 
> > On Mon, 22 Mar 2004, Jad Saklawi wrote:
> > 
> > > Date: Mon, 22 Mar 2004 09:41:22 +0200
> > > From: Jad Saklawi <Jad@Saklawi.info>
> > > To: K.Anantha Kiran <ananth@cse.iitk.ac.in>
> > > Cc: linux-c-programming@vger.kernel.org
> > > Subject: Re: Splitter
> > > 
> > > K.Anantha Kiran wrote:
> > > 
> > > >Hi,
> > > > Thanks for ur suggetsion.
> > > > But we are not clear about the sentece "re invent the loop".
> > > > Can u give clear explanantion about the "iptables" solution.
> > > > IMP: Our machine should not work like a router.I should be able to decide 
> > > >to which interface i want to redirect to , on the fly for each packet 
> > > >using a HASH like functions.
> > > >  
> > > >
> > >  It`s your choice then, check out net/core/dev.c net/core/dv.c 
> > > net/ipv4/tcp_input.c net/ipv4/tcp_output.c net/ethernet/eth.c You have 
> > > to take a look at the whole net directory and modify accordingly. I 
> > > doubt you will be able to do any thing. Any way good luck!!!
> > > 
> > > Greets,
> > > Jad
> > > 
> > 
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

