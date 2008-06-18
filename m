From: Benoit Fouet <benoit.fouet@purplelabs.com>
Subject: Re: Shared Memory using threads in C on AIX
Date: Wed, 18 Jun 2008 13:26:30 +0200
Message-ID: <4858F0E6.80803@purplelabs.com>
References: <17979185.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17979185.post@talk.nabble.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kumars <subhankar_k@rediffmail.com>
Cc: linux-c-programming@vger.kernel.org

Hi,

kumars wrote:
> I am looking for C program source code. Could you please help me in finding
> the source code of the required mentioned below.
>
>  
>
> Task that I need to complete:
>
> Write a program to create multiple threads (one master thread and rest
> worker threads) and using the threads write into and read from shared memory
>
>
> Restrictions:
>
> Only one thread should be able to read at any instant of time into shared
> memory region.
>
> Only one thread should be able to write at any instant of time into shared
> memory region.
>
> Worker threads should inform the master thread after every read and write
> operation.
>
> Master thread inform the worker thread (which is waiting to acquire shared
> memory region) that read or write operation is successful and it can acquire
> the memory for either reading and writing operations.
>
>
>   

man pthread.h, you'll find everything you need in there...

-- 
Benoit Fouet
Purple Labs S.A.
www.purplelabs.com
