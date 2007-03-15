From: <krishna.vamsi@wipro.com>
Subject: RE: PThread question
Date: Thu, 15 Mar 2007 14:44:29 +0530
Message-ID: <4459E2CEA9D3AE419885B13EABB1323204210EC2@BLR-EC-MBX05.wipro.com>
References: <45f8f22b.0c41e030.3bf2.ffff8dda@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <45f8f22b.0c41e030.3bf2.ffff8dda@mx.google.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sreevathsa@gmail.com, linux-c-programming@vger.kernel.org

It is not guaranteed..

-Vamsi

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of
Sreevathsa
Sent: Thursday, March 15, 2007 12:43 PM
To: linux-c-programming@vger.kernel.org
Subject: PThread question

I have a question on syncing the threads. I have a scenario like this:

5 threads (T1, T2, T3, T4 & T5) are working on this piece of code:

LINE1: 	for(;;) {
LINE2: 		pthread_mutex_lock(&r1_mutex)
LINE3: 		.............
LINE4: 		.............
LINE5: 		pthread_mutex_unlock(&r1_mutex)


			/* some code that does not need protection */
LINE6: 		.............
LINE7: 		.............


LINE8: 		pthread_mutex_lock(&r2_mutex)
LINE9: 		.............
LINE10: 		.............
LINE11: 		pthread_mutex_unlock(&r2_mutex)
LINE12: 	}


r1_mutex is to protect the access to a FIFO queue. I want the 5 threads
to
process the queue contents in the same order in which they arrived into
the
queue. 

Now, lets assume that a request comes into the queue and thread T1 picks
up
and starts processing it. T1 has released r1_mutex lock and is holding
r2_mutex lock and is executing the code in lines 9 and 10.

While T1 is busy executing code on lines 9 and 10, the queue gets 4 more
requests and threads T2, T3, T4 and T5 (in that order) picks each one of
them in the order in which they came into the queue and start processing
them. They come till LINE 8 and wait to lock r2_mutex which thread T1
has
currently locked.

Now, given this scenario, here is my question:
After T1 unlocks r2_mutex, which thread among T2, T3, T4 and T5 gets the
r2_mutex lock? Does pthread scheduler schedule (give the lock to) thread
T2
which came to LINE8 first??

FYI: I use Linux 2.6 - Fedora distro. I am not sure if its uses NPTL or
the
native Linux threads.

Thanks,
Sreevathsa

-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
