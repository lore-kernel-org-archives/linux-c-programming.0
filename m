From: SVisor <svisor@lycos.com>
Subject: Re: How to suspend a thread (without pthread)
Date: Wed, 25 May 2005 08:47:55 +0200
Message-ID: <d716vk$dfu$1@sea.gmane.org>
References: <d714qk$8iu$1@sea.gmane.org> <429419FC.2090102@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <429419FC.2090102@hq.ntsp.nec.co.jp>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Ron Michael Khu wrote:
> what do u mean by suspend?
> sleep/block? if ur looking for a time-based threadsleep
> maybe u can make use(improvise) with the select() function.

I mean sleep until awoken. Ive used a yielding spin lock this far. But 
there must be a better way. I cant use a timer (like select).

...
> what's wrong with using the pthread library? (ex: pthread_mutex_lock, 
> pthread_mutex_unlock)
> license issues? client-preference issues? library-comptability?

pthread doesnt play well with clone( ). LGPL (which is pthread:s licens) 
is not realy a problem (today). But the truth is that I try to avoid 
(L)GPL as much as possible. Especially when writing support code (like 
libraries) which future use is unknown.

// Jarmo

...
>> I need to suspend threads (for locking purpose) but I do not want to 
>> use Posix threads library (pthread). Neither do I want to access 
>> __KERNEL__ protected parts of the kernel API.
>>
>> There must be a user accesible API for this. The nearest Ive found is 
>> sched_yield( ), but it just moves a thread (process) to the end of 
>> run-queue.
...

