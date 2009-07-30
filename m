From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: how compiler decide the range of real numbers in C...
Date: Thu, 30 Jul 2009 18:46:53 +0100
Message-ID: <19057.56461.639732.848186@cerise.gclements.plus.com>
References: <24743191.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <24743191.post@talk.nabble.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: RAM_LOCK <Kaushik.Sarkar@netapp.com>
Cc: linux-c-programming@vger.kernel.org


RAM_LOCK wrote:

> Say 16 bit compiler (for ex Turbo C) uses 2's compliment to find the range of
> signed integer.
> Say for 16 bit n=16. Now applying 2's compliment equation : -2^(n-1)  to
> 2^(n-1) -1
> so for n=16 : The range is -32768 to 32767
> 
> This is ok. The question arises when it tell about real constant's range.
> For 16 bit compiler the range of real constant is : -3.4e38 to 3.4e38
> 
> How they arrived to this real constant range?
> 
> Can any one share the mathematical calculation behind it?

	http://en.wikipedia.org/wiki/IEEE_754-1985

-- 
Glynn Clements <glynn@gclements.plus.com>
