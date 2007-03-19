From: "Hendrik Visage" <hvjunk@gmail.com>
Subject: Re: PThread question
Date: Mon, 19 Mar 2007 22:22:51 +0200
Message-ID: <d93f04c70703191322o365d4ed3q7be76e85daf8ac29@mail.gmail.com>
References: <45f8f22b.0c41e030.3bf2.ffff8dda@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=QdcdzU2FUMwYdpkS4566OV/PRoBRv8mwTQoWDN0px8uEVMdL+gn98IEXcYdgS/vAnYuEbR6uv/AONtoUR8cikUzwlfuWmVQ6Q6phvIHbQmT6tBkXJT9Nvw829YZtYQWvE8R2XwzxtiuCwdTDhAOWdLhrXgbU3WxuofBNcHLkE74=
In-Reply-To: <45f8f22b.0c41e030.3bf2.ffff8dda@mx.google.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sreevathsa <sreevathsa@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On 3/15/07, Sreevathsa <sreevathsa@gmail.com> wrote:
> I have a question on syncing the threads. I have a scenario like this:
>
> 5 threads (T1, T2, T3, T4 & T5) are working on this piece of code:
>
> LINE1:  for(;;) {
> LINE2:          pthread_mutex_lock(&r1_mutex)

Include setting up the semaphores as discussed below ;^)

> LINE3:          .............
> LINE4:          .............
> LINE5:          pthread_mutex_unlock(&r1_mutex)
>
>
>                         /* some code that does not need protection */
> LINE6:          .............
> LINE7:          .............
>

Given the explanation below, I'd advise on another critical area here
that will block based on the FIFO. Ie. the FIFO structure will include a
pointer to two semaphores for each entry. The first one to be "READY"
and the second one to be "FINISHED".
The "FINISHED" of the Nth entry, is the "READY" for the (N+1)th entry (The
corner case of the begining/head needs to be considered too).
The initial state for these semaphores should be "down"/0 (except for the
HEAD whose READY should be "up"/1).

Thus before entry the Thread will down(FIFO[entry]->READY), and block until
the previous entry/thread upped it.
> LINE8:          pthread_mutex_lock(&r2_mutex)
> LINE9:          .............
> LINE10:                 .............
> LINE11:                 pthread_mutex_unlock(&r2_mutex)
Here you should then do up(FIFO[entry]->FINISHED)

Actually, in this way, you'll (1) serialize the processing as "Expected"
and (2) you'll do away with the pthread_mutex as you'll only be using the
semaphores in this way.
> LINE12:         }
>
>

> Now, given this scenario, here is my question:
> After T1 unlocks r2_mutex, which thread among T2, T3, T4 and T5 gets the
> r2_mutex lock? Does pthread scheduler schedule (give the lock to) thread T2
> which came to LINE8 first??

What if the threads arrived to r2_mutex in the order: T4, T2, T5, T3??

I recall some settings to the POSIX/SVR4 IPCs which will make all the processes
wake up simultaneously and all trying to regrab, and then there might be a
setting to allow them to be woken in sequence of arival, but then
still, what about
the order T4,T2,T5,T3?? I understood you'll want them processed T2,T3,T4,T5, and
that's the reason for the advice on using the semaphores.

Also check on all the other IPCs out there, as you might be able to (ab)use
the reader/writers type locks to check etc. and use yield etc. to get
the ordering right
without the corner cases and issues WRT the FIFO buffer, and it's
pointers etc. and clearing/releasing the data etc. without memory
leaks etc.

-- 
Hendrik Visage
