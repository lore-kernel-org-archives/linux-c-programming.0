From: blitzkrieg <blitzkrieg@sitoverde.com>
Subject: Re: how do i get a packets contents from using printks
Date: Mon, 13 May 2002 20:32:15 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020513203215.A572@slackware.alcatrazz.org>
References: <44D8933CAE839984FA29FC69B9F24B15@william.fitzgerald3.beer.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <44D8933CAE839984FA29FC69B9F24B15@william.fitzgerald3.beer.com>; from william.fitzgerald3@beer.com on Mon, May 13, 2002 at 03:03:17PM +0100
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: william fitzgerald <william.fitzgerald3@beer.com>
Cc: linux-c-programming@vger.kernel.org

On Mon, May 13, 2002 at 03:03:17PM +0100, william fitzgerald wrote:
> printk(KERN_DEBUG"ip_forwrd(sk_buff %P)-> entry
> point",skb);
> 
> but how do i extract the packets headers etc from
> the sk_buff?

Check the definition of struct sk_buff in linux/skbuff.h, check also 
linux/ip.h, linux/tcp.h and so on... depends which headers you want to 
know.

bye bye
-b

-- 
head --lines=4 $HOME/.signature
