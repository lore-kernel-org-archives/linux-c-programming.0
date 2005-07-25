From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Re: Unsigned off_t?
Date: Mon, 25 Jul 2005 09:00:28 +0000 (GMT)
Message-ID: <Pine.LNX.4.61.0507250858480.3913@praktifix.dwd.de>
References: <Pine.LNX.4.61.0507250842380.3913@praktifix.dwd.de>
 <6.2.3.4.0.20050725025009.042ad5f0@no.incoming.mail>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6.2.3.4.0.20050725025009.042ad5f0@no.incoming.mail>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Jeff Woods <Kazrak+kernel@cesmail.net>
Cc: linux-c-programming@vger.kernel.org

On Mon, 25 Jul 2005, Jeff Woods wrote:

> At 7/25/2005 08:47 +0000, Holger Kiehl wrote:
>> I would like to have an unsigned off_t, what is the best and portable way 
>> to define this? Currently I use the following code:
>> 
>>    #if SIZEOF_OFF_T == 4
>>    typedef unsigned long       u_off_t;
>>    #else
>>    typedef unsigned long long  u_off_t;
>>    #endif
>> 
>> SIZEOF_OFF_T is returned from the gnu autoconfig tools.
>> 
>> Is this the correct way of doing this? Or is there some better more 
>> portable way?
>
> Does the following do what you want?
>
>        typedef unsigned off_t u_off_t;
>
No, this is what I tried first but does not compile. Try the following code:

    #include <stdio.h>
    #include <sys/types.h>

    typedef unsigned off_t u_off_t;

    int
    main(void)
    {
       u_off_t a;

       return 0;
    }

Thanks,
Holger

