From: Neil Horman <nhorman@tuxdriver.com>
Subject: Re: PThread question
Date: Tue, 20 Mar 2007 07:29:59 -0400
Message-ID: <20070320112959.GB31465@hmsreliant.homelinux.net>
References: <45f8f22b.0c41e030.3bf2.ffff8dda@mx.google.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <45f8f22b.0c41e030.3bf2.ffff8dda@mx.google.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sreevathsa <sreevathsa@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Thu, Mar 15, 2007 at 12:13:18AM -0700, Sreevathsa wrote:
> I have a question on syncing the threads. I have a scenario like this:
> 
> 5 threads (T1, T2, T3, T4 & T5) are working on this piece of code:
> 
> LINE1: 	for(;;) {
> LINE2: 		pthread_mutex_lock(&r1_mutex)
> LINE3: 		.............
> LINE4: 		.............
> LINE5: 		pthread_mutex_unlock(&r1_mutex)
> 
> 
> 			/* some code that does not need protection */
> LINE6: 		.............
> LINE7: 		.............
> 
> 
> LINE8: 		pthread_mutex_lock(&r2_mutex)
> LINE9: 		.............
> LINE10: 		.............
> LINE11: 		pthread_mutex_unlock(&r2_mutex)
> LINE12: 	}
> 
> 
> r1_mutex is to protect the access to a FIFO queue. I want the 5 threads to
> process the queue contents in the same order in which they arrived into the
> queue. 
> 
> Now, lets assume that a request comes into the queue and thread T1 picks up
> and starts processing it. T1 has released r1_mutex lock and is holding
> r2_mutex lock and is executing the code in lines 9 and 10.
> 
> While T1 is busy executing code on lines 9 and 10, the queue gets 4 more
> requests and threads T2, T3, T4 and T5 (in that order) picks each one of
> them in the order in which they came into the queue and start processing
> them. They come till LINE 8 and wait to lock r2_mutex which thread T1 has
> currently locked.
> 
> Now, given this scenario, here is my question:
> After T1 unlocks r2_mutex, which thread among T2, T3, T4 and T5 gets the
> r2_mutex lock? Does pthread scheduler schedule (give the lock to) thread T2
> which came to LINE8 first??
> 

No the Lock is acquired by whichever thread is chosen by the scheduler to run
next, and that could be any of them.

Given that, I have to ask why you are bothering to use threads at all in the
consumer side of your application.  What you have described here is a system in
which you have multiple consumers of a queue, each of which are forced to run in
a certain order, as defined by the order in which they consume from the queue
protected by the r1 mutex.  If thats the case, why not instead simply create one
consumer thread?  It potentially eliminates the need for the r2 mutex (since you
only have one consumer thread).  Its not like multiple threads in the above
scenario offer any additional speedup anyway, since any thread that dequeues
data will have nothing to do but wait until all preceding data is processed
anyway.

Regards
Neil

