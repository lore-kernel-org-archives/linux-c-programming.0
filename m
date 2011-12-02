From: Bogdan Cristea <cristeab@gmail.com>
Subject: Re: Co-thread for parallel processing
Date: Fri, 2 Dec 2011 10:28:38 +0100
Message-ID: <201112021028.38892.cristeab@gmail.com>
References: <CAA6iF_4z_MPpU8Eq+i+PT-+VgpX_ZXX5FwOwa2NpLxW_gyzTSg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=from:organization:to:subject:date:user-agent:references:in-reply-to
         :cc:mime-version:content-type:content-transfer-encoding:message-id;
        bh=sMB8PIwRLsfVPGX9qyVbYvo+OHI7QihK1UHAyZq+k7A=;
        b=X5FzB64MzfYTr2B8LQyIvtzVFDtN+Kqqjlye15AslBA3T/tmMKNCyihYLl7F3UB526
         GeHhan3n17b6AabKwsb6uLQx6pssgONcB7ioxYfbi452y/zw8pl8LrjJR7M8spYiUB5h
         sJnHC4hvTiRDTp8ix5N4rRTK2xCvcbkEg8CVU=
In-Reply-To: <CAA6iF_4z_MPpU8Eq+i+PT-+VgpX_ZXX5FwOwa2NpLxW_gyzTSg@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Friday 02 December 2011 10:23:49 you wrote:
> My program use co-threads, because creating and reinitialize thread is
> expensive, it first create threads and reuse them. The main thread
> will send each co-thread a event (through condition variable)
> simultaneously to do task in parallel way. Each co-thread has variety
> work-time, let say it can be (in miliseconds) 200ms, 130ms, 317ms,
> 90ms etc to get result to be consumed by main thread.
> 
> Here I did to wake-up all threads in the main thread:
> 
> .....
> for (i = 0; i < nthread; i++)
>     pthread_cond_broadcast(&cond);
> wait_all_worker(); /* wait for all worker threads to finish */
> get_all_worker_result(); /* get result from all worker thread */
> ...
> 
> 
> And worker-thread routines:
> 
> ...
> for (;;) {
>   pthread_mutex_lock();
>   pthread_cond_wait();
>   pthread_mutex_unlock();
> 
>   do_work();
>   fill_result();
> }
> ....
> 
> My dilema is:
> 
> 1. What the proper way to the main thread to wait for all co-threads
> until finished?

I would use  a semaphore which should be locked by the treads once the 
condition variable is set en unlocked when the result is available for the 
main thread.

> 2. After calling pthread_cond_signal() or pthread_cond_broadcast()
> followed by sleep()/nanosleep(),
>     the condition variable looks like not signaled, (the co-thread
> routine doesn't run). What make this?

I don't understand, please provide a working example

-- 
Bogdan 
