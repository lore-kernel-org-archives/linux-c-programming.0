From: nick@snowman.net
Subject: Re: this code does not get called in dev.c so do we need it?
Date: Thu, 3 Oct 2002 16:14:10 -0400 (EDT)
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0210031613500.12220-100000@ns>
References: <20021002.171042.42890215.davem@redhat.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-Reply-To: <20021002.171042.42890215.davem@redhat.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@redhat.com>
Cc: linux_learning@yahoo.co.uk, linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org

I'm not sure if this is a dumb question, but why arn't there any in-tree
drivers with support for this?  Is it too ugly to merge?
	Nick

On Wed, 2 Oct 2002, David S. Miller wrote:

> 
> Fast routing, although not implemented in any in-tree drivers,
> does get used by some people who have hacked up drivers to support
> this.
> 
> It allows IPv4 routing to occur right at the level of the device
> driver, it directly pushes an input packet to the output routine
> of the destination device all without leaving the driver.
> 
> This code is used.
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
