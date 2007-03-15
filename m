From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: PThread question
Date: Thu, 15 Mar 2007 10:37:34 +0100
Message-ID: <6a00c8d50703150237g5ceef20ev87ea8bf9843e0cfe@mail.gmail.com>
References: <45f8f22b.0c41e030.3bf2.ffff8dda@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=SWVw9L6IcaxpK90ww3IKcrfiAuR1xG2iy9p8r3rMrTnLn6LiYHA2H6Y104+KsPHKLOJpLI3jmzyitjyNETz0aBmNEorAMhxgcq3x2My5iwu7IqmU7KbQYcgbGpckmJk05BHjBRHHdHGeK8163RczmmOL+dBcaj0ghj7uqLN6R7M=
In-Reply-To: <45f8f22b.0c41e030.3bf2.ffff8dda@mx.google.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Sreevathsa <sreevathsa@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On 3/15/07, Sreevathsa <sreevathsa@gmail.com> wrote:
> I have a question on syncing the threads. I have a scenario like this=
:
>
> 5 threads (T1, T2, T3, T4 & T5) are working on this piece of code:
>
> LINE1:  for(;;) {
> LINE2:          pthread_mutex_lock(&r1_mutex)
> LINE3:          .............
> LINE4:          .............
> LINE5:          pthread_mutex_unlock(&r1_mutex)
>
>
>                         /* some code that does not need protection */
> LINE6:          .............
> LINE7:          .............
>
>
> LINE8:          pthread_mutex_lock(&r2_mutex)
> LINE9:          .............
> LINE10:                 .............
> LINE11:                 pthread_mutex_unlock(&r2_mutex)
> LINE12:         }
>
>
> r1_mutex is to protect the access to a FIFO queue. I want the 5 threa=
ds to
> process the queue contents in the same order in which they arrived in=
to the
> queue.
>
> Now, lets assume that a request comes into the queue and thread T1 pi=
cks up
> and starts processing it. T1 has released r1_mutex lock and is holdin=
g
> r2_mutex lock and is executing the code in lines 9 and 10.
>
> While T1 is busy executing code on lines 9 and 10, the queue gets 4 m=
ore
> requests and threads T2, T3, T4 and T5 (in that order) picks each one=
 of
> them in the order in which they came into the queue and start process=
ing
> them. They come till LINE 8 and wait to lock r2_mutex which thread T1=
 has
> currently locked.
>
> Now, given this scenario, here is my question:
> After T1 unlocks r2_mutex, which thread among T2, T3, T4 and T5 gets =
the
> r2_mutex lock? Does pthread scheduler schedule (give the lock to) thr=
ead T2
> which came to LINE8 first??

Sreevathsa,

I will not ask you why you want to enforce some sort of artificial
"scheduling policy" for your threads with regard to the problem you're
trying to solve.  I'd generally recommend decoupling the comsumer
pattern from the communication pattern.  While a FIFO guarantees items
to be processed in a particular order, the order of execution of
threads is beyond your control, unless you apply a scheduling policy
to each thread, which may require superuser privileges (see SCHED_FIFO
and SCHED_RR).

You may want to create a chain of threads (instead of a tree), each
one waiting for the other to complete (see pthread_join).  Every
controller thread could then create a single worker thread to process
the data, thus the controller thread can relinquish the CPU
afterwards.

Anyhow, I recommend not to rely on the order of items arriving in the
=46IFO.  Instead, I'd introduce another layer of abstraction to map
items to particular threads.

	\Steve

--

Steve Gr=E4gert <steve@graegert.com>
Jabber    xmpp://graegerts@jabber.org
Internet  http://eth0.graegert.com, http://blog.graegert.com
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
