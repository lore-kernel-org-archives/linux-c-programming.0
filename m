From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Finding how much data is available for read from a SOCK_SEQPACKET
Date: Wed, 25 Mar 2009 15:05:07 +0000
Message-ID: <18890.18467.865404.614181@cerise.gclements.plus.com>
References: <C5EFBA45.17C2D%fgrieu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <C5EFBA45.17C2D%fgrieu@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Francois Grieu <fgrieu@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Francois Grieu wrote:

> I have a working program that receives blocks of data from a
> SOCK_SEQPACKET using a blocking read(). So far I use a
> fixed-size buffer of the maximum size.
> 
> I would like to query for the size available, malloc a block
> of the appropriate size, then read. Is that feasible?

It doesn't look like it. Unfortunately, ioctl(SIOCINQ) returns the
total number of bytes in all queued incoming packets, not the next
packet.

You could malloc() a maximum size packet then realloc() it once you've
received the data.

-- 
Glynn Clements <glynn@gclements.plus.com>
