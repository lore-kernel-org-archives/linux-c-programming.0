From: Jad Saklawi <Jad@Saklawi.info>
Subject: Re: Splitter
Date: Mon, 22 Mar 2004 09:41:22 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <405E98A2.2080304@Saklawi.info>
References: <Pine.LNX.4.44.0403230018050.3646-100000@csews32.cse.iitk.ac.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0403230018050.3646-100000@csews32.cse.iitk.ac.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "K.Anantha Kiran" <ananth@cse.iitk.ac.in>
Cc: linux-c-programming@vger.kernel.org

K.Anantha Kiran wrote:

>Hi,
> Thanks for ur suggetsion.
> But we are not clear about the sentece "re invent the loop".
> Can u give clear explanantion about the "iptables" solution.
> IMP: Our machine should not work like a router.I should be able to decide 
>to which interface i want to redirect to , on the fly for each packet 
>using a HASH like functions.
>  
>
 It`s your choice then, check out net/core/dev.c net/core/dv.c 
net/ipv4/tcp_input.c net/ipv4/tcp_output.c net/ethernet/eth.c You have 
to take a look at the whole net directory and modify accordingly. I 
doubt you will be able to do any thing. Any way good luck!!!

Greets,
Jad

