From: "K.Anantha Kiran" <ananth@cse.iitk.ac.in>
Subject: Re: Splitter
Date: Tue, 23 Mar 2004 15:09:13 +0530 (IST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0403231456450.8971-100000@csews41.cse.iitk.ac.in>
References: <405E98A2.2080304@Saklawi.info>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <405E98A2.2080304@Saklawi.info>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jad Saklawi <Jad@Saklawi.info>
Cc: linux-c-programming@vger.kernel.org

Hi,
 Thanks a lot for ur guidance.
 I am following the same files(i mean NET directory).But i am facing 
following problem.
 " where the output interface variable (rtable->key->oif) is changed to 
the index of interface through which packet has to go out. In the function 
/net/route.c ip_route_input_slow() they are setting it to 0 what is it 
mean.

	When a packet has to be put on to an interface what are the fields 
will it use to decide that( in skbuff structure).

Thanks 
regards,
K. Anantha kiran


On Mon, 22 Mar 2004, Jad Saklawi wrote:

> Date: Mon, 22 Mar 2004 09:41:22 +0200
> From: Jad Saklawi <Jad@Saklawi.info>
> To: K.Anantha Kiran <ananth@cse.iitk.ac.in>
> Cc: linux-c-programming@vger.kernel.org
> Subject: Re: Splitter
> 
> K.Anantha Kiran wrote:
> 
> >Hi,
> > Thanks for ur suggetsion.
> > But we are not clear about the sentece "re invent the loop".
> > Can u give clear explanantion about the "iptables" solution.
> > IMP: Our machine should not work like a router.I should be able to decide 
> >to which interface i want to redirect to , on the fly for each packet 
> >using a HASH like functions.
> >  
> >
>  It`s your choice then, check out net/core/dev.c net/core/dv.c 
> net/ipv4/tcp_input.c net/ipv4/tcp_output.c net/ethernet/eth.c You have 
> to take a look at the whole net directory and modify accordingly. I 
> doubt you will be able to do any thing. Any way good luck!!!
> 
> Greets,
> Jad
> 

