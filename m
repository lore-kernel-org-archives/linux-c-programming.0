From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: How to suspend a thread (without pthread)
Date: Wed, 25 May 2005 14:23:56 +0800
Message-ID: <429419FC.2090102@hq.ntsp.nec.co.jp>
References: <d714qk$8iu$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <d714qk$8iu$1@sea.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: SVisor <svisor@lycos.com>
Cc: linux-c-programming@vger.kernel.org

what do u mean by suspend?
sleep/block? if ur looking for a time-based threadsleep
maybe u can make use(improvise) with the select() function.
 
for example:

void threadSleep( int sec )
{
    struct timeval stTimeOut;
    int nSel;

    stTimeOut.tv_sec = sec;         /* Set the number of seconds       */
    stTimeOut.tv_usec = 0;          /* Set the number of micro seconds */

    nSel = select( 0, NULL, NULL, NULL, &stTimeOut);
}

what's wrong with using the pthread library? (ex: pthread_mutex_lock, 
pthread_mutex_unlock)
license issues? client-preference issues? library-comptability?


SVisor wrote:

> As subject says,
>
> I need to suspend threads (for locking purpose) but I do not want to 
> use Posix threads library (pthread). Neither do I want to access 
> __KERNEL__ protected parts of the kernel API.
>
> There must be a user accesible API for this. The nearest Ive found is 
> sched_yield( ), but it just moves a thread (process) to the end of 
> run-queue.
>
> // Jarmo
>
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>


