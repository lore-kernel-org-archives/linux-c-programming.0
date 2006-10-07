From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: pointer indirection on the LHS of an assignment
Date: Sat, 7 Oct 2006 23:53:14 +0100
Message-ID: <17704.12250.231544.173434@cerise.gclements.plus.com>
References: <Pine.LNX.4.64.0610070909590.6332@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0610070909590.6332@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>


Robert P. J. Day wrote:

>   sort of a combination of a C and gcc question but what's the rules
> these days on the following (ripped from the linux kernel source, from
> asm/semaphore.h)?
> 
> ===
> static inline void sema_init (struct semaphore *sem, int val)
> {
> /*
>  *      *sem = (struct semaphore)__SEMAPHORE_INITIALIZER((*sem),val);
>  *
>  * i'd rather use the more flexible initialization above, but sadly
>  * GCC 2.7.2.3 emits a bogus warning. EGCS doesn't. Oh well.
>  */
>         atomic_set(&sem->count, val);
>         sem->sleepers = 0;
>         init_waitqueue_head(&sem->wait);
> }
> ===
> 
>   i recall that earlier compilers complained about that first example
> of pointer indirection as the target of an assignment.  is that legal
> these days?

The problem with the first example is that the __SEMAPHORE_INITIALIZER
macro uses C99 features, which probably aren't supported in gcc 2.7.x.

The LHS has nothing to do with it.

-- 
Glynn Clements <glynn@gclements.plus.com>
