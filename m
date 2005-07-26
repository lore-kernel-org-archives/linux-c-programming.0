From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Unsigned off_t?
Date: Tue, 26 Jul 2005 06:24:35 +0100
Message-ID: <17125.51475.763052.283552@cerise.gclements.plus.com>
References: <Pine.LNX.4.61.0507250842380.3913@praktifix.dwd.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0507250842380.3913@praktifix.dwd.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: linux-c-programming@vger.kernel.org


Holger Kiehl wrote:

> I would like to have an unsigned off_t, what is the best and portbale way
> to define this? Currently I use the following code:
> 
>     #if SIZEOF_OFF_T == 4
>     typedef unsigned long       u_off_t;
>     #else
>     typedef unsigned long long  u_off_t;
>     #endif
> 
> SIZEOF_OFF_T is returned from the gnu autoconfig tools.
> 
> Is this the correct way of doing this?

There isn't any "correct" way of doing it.

> Or is there some better more portable way?

Using the types from stdint.h (uint32_t, uint64_t etc) would be more
portable than making assumptions about the sizes of "long", "long long"
etc. Alternatively:

	#if SIZEOF_OFF_T == SIZEOF_INT
	typedef unsigned int off_t
	#elif SIZEOF_OFF_T == SIZEOF_LONG
	typedef unsigned long off_t
	#elif SIZEOF_OFF_T == SIZEOF_LONG_LONG
	typedef unsigned long long off_t
	#endif

Out of curiosity, why do you want an unsigned off_t anyhow?

-- 
Glynn Clements <glynn@gclements.plus.com>
