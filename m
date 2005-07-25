From: Jeff Woods <Kazrak+kernel@cesmail.net>
Subject: Re: Unsigned off_t?
Date: Mon, 25 Jul 2005 02:53:03 -0600
Message-ID: <6.2.3.4.0.20050725025009.042ad5f0@no.incoming.mail>
References: <Pine.LNX.4.61.0507250842380.3913@praktifix.dwd.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0507250842380.3913@praktifix.dwd.de>
References: <Pine.LNX.4.61.0507250842380.3913@praktifix.dwd.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: linux-c-programming@vger.kernel.org

At 7/25/2005 08:47 +0000, Holger Kiehl wrote:
>I would like to have an unsigned off_t, what is the best and 
>portable way to define this? Currently I use the following code:
>
>    #if SIZEOF_OFF_T == 4
>    typedef unsigned long       u_off_t;
>    #else
>    typedef unsigned long long  u_off_t;
>    #endif
>
>SIZEOF_OFF_T is returned from the gnu autoconfig tools.
>
>Is this the correct way of doing this? Or is there some better more 
>portable way?

Does the following do what you want?

         typedef unsigned off_t u_off_t;

--
Jeff Woods <kazrak+kernel@cesmail.net> 

