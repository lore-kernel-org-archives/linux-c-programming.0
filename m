From: Srinivasa T N <seenutn@linux.vnet.ibm.com>
Subject: Re: Co-thread for parallel processing
Date: Fri, 02 Dec 2011 16:56:57 +0530
Message-ID: <4ED8B601.1090707@linux.vnet.ibm.com>
References: <CAA6iF_4z_MPpU8Eq+i+PT-+VgpX_ZXX5FwOwa2NpLxW_gyzTSg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <CAA6iF_4z_MPpU8Eq+i+PT-+VgpX_ZXX5FwOwa2NpLxW_gyzTSg@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>


> 1. What the proper way to the main thread to wait for all co-threads
> until finished?
> 2. After calling pthread_cond_signal() or pthread_cond_broadcast()
> followed by sleep()/nanosleep(),
>      the condition variable looks like not signaled, (the co-thread
> routine doesn't run). What make this?
I think you need a pthread_cond_broadcast () after do_work () in each 
thread.

Regards,
Seenu.

