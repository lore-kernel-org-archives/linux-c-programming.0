From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Unsigned off_t?
Date: Mon, 25 Jul 2005 08:47:39 +0000 (GMT)
Message-ID: <Pine.LNX.4.61.0507250842380.3913@praktifix.dwd.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello

I would like to have an unsigned off_t, what is the best and portbale way
to define this? Currently I use the following code:

    #if SIZEOF_OFF_T == 4
    typedef unsigned long       u_off_t;
    #else
    typedef unsigned long long  u_off_t;
    #endif

SIZEOF_OFF_T is returned from the gnu autoconfig tools.

Is this the correct way of doing this? Or is there some better more portable
way?

Thanks,
Holger
-- 

