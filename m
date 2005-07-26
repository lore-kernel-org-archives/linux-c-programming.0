From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Re: Unsigned off_t?
Date: Tue, 26 Jul 2005 07:38:29 +0000 (GMT)
Message-ID: <Pine.LNX.4.61.0507260638110.22613@praktifix.dwd.de>
References: <Pine.LNX.4.61.0507250842380.3913@praktifix.dwd.de>
 <17125.51475.763052.283552@cerise.gclements.plus.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17125.51475.763052.283552@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

On Tue, 26 Jul 2005, Glynn Clements wrote:

>
> Holger Kiehl wrote:
>
>> I would like to have an unsigned off_t, what is the best and portbale way
>> to define this? Currently I use the following code:
>>
>>     #if SIZEOF_OFF_T == 4
>>     typedef unsigned long       u_off_t;
>>     #else
>>     typedef unsigned long long  u_off_t;
>>     #endif
>>
>> SIZEOF_OFF_T is returned from the gnu autoconfig tools.
>>
>> Is this the correct way of doing this?
>
> There isn't any "correct" way of doing it.
>
>> Or is there some better more portable way?
>
> Using the types from stdint.h (uint32_t, uint64_t etc) would be more
> portable than making assumptions about the sizes of "long", "long long"
> etc.
>
So a solution with C99 and stdint.h could look as follows:

         #ifdef HAVE_STDINT_H
         # if SIZEOF_OFF_T == 4
         typedef uint32_t u_off_t;
         # else
         typedef uint64_t u_off_t;
         # endif
         #else
         # if SIZEOF_OFF_T == 4
         typedef unsigned long u_off_t;
         # else
         typedef unsigned long long u_off_t;
         # endif
         #endif

The problem I have with this is how do I use this with printf() or fprintf()?
What do I use: %u, %lu or %llu? Does C99 provide a solution here?

> Alternatively:
>
> 	#if SIZEOF_OFF_T == SIZEOF_INT
> 	typedef unsigned int off_t
> 	#elif SIZEOF_OFF_T == SIZEOF_LONG
> 	typedef unsigned long off_t
> 	#elif SIZEOF_OFF_T == SIZEOF_LONG_LONG
> 	typedef unsigned long long off_t
> 	#endif
>
Same problem here as well, how to use this with printf()?

Besides, what do I use for uint64_t in printf()?

> Out of curiosity, why do you want an unsigned off_t anyhow?
>
I use it to store the number of bytes I have send to a certain host.
If this is unsigned there is no need to worry about an overflow and I can
always just add each file size transmitted. Just when I want to calculate
the transfer rate I need to watch out for an overflow.

Thanks,
Holger

