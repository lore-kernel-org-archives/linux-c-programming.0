From: "Sreevathsa" <sreevathsa@gmail.com>
Subject: PThread question
Date: Thu, 15 Mar 2007 00:13:18 -0700
Message-ID: <45f8f22b.0c41e030.3bf2.ffff8dda@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:from:to:subject:date:organization:mime-version:content-type:content-transfer-encoding:x-mailer:x-mimeole:thread-index:message-id;
        b=TzTdiV1+HeCPIpSFV+zVHx7kS7ePIjOWHzGIvh64Hh1WpVF555ZGaX1tfQ2dfD7UoGBtJX+/ae9EgUJHHxX8/3gTOy5UXcimsVmmXa99UxB2lDdJofZW5uGeTmDIbDBJB87xBft8/7t14W7ZsV4I/IqhEV1/b3KOU+3BwI0vCOw=
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

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


r1_mutex is to protect the access to a FIFO queue. I want the 5 threads to
process the queue contents in the same order in which they arrived into the
queue. 

Now, lets assume that a request comes into the queue and thread T1 picks up
and starts processing it. T1 has released r1_mutex lock and is holding
r2_mutex lock and is executing the code in lines 9 and 10.

While T1 is busy executing code on lines 9 and 10, the queue gets 4 more
requests and threads T2, T3, T4 and T5 (in that order) picks each one of
them in the order in which they came into the queue and start processing
them. They come till LINE 8 and wait to lock r2_mutex which thread T1 has
currently locked.

Now, given this scenario, here is my question:
After T1 unlocks r2_mutex, which thread among T2, T3, T4 and T5 gets the
r2_mutex lock? Does pthread scheduler schedule (give the lock to) thread T2
which came to LINE8 first??

FYI: I use Linux 2.6 - Fedora distro. I am not sure if its uses NPTL or the
native Linux threads.

Thanks,
Sreevathsa

