From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: pointer indirection on the LHS of an assignment
Date: Sun, 8 Oct 2006 02:53:46 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0610080252420.12188@localhost.localdomain>
References: <Pine.LNX.4.64.0610070909590.6332@localhost.localdomain>
 <17704.12250.231544.173434@cerise.gclements.plus.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17704.12250.231544.173434@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn@gclements.plus.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>

On Sat, 7 Oct 2006, Glynn Clements wrote:

>
> Robert P. J. Day wrote:
>
> >   sort of a combination of a C and gcc question but what's the rules
> > these days on the following (ripped from the linux kernel source, from
> > asm/semaphore.h)?
> >
> > ===
> > static inline void sema_init (struct semaphore *sem, int val)
> > {
> > /*
> >  *      *sem = (struct semaphore)__SEMAPHORE_INITIALIZER((*sem),val);
> >  *
> >  * i'd rather use the more flexible initialization above, but sadly
> >  * GCC 2.7.2.3 emits a bogus warning. EGCS doesn't. Oh well.
> >  */
> >         atomic_set(&sem->count, val);
> >         sem->sleepers = 0;
> >         init_waitqueue_head(&sem->wait);
> > }
> > ===
> >
> >   i recall that earlier compilers complained about that first example
> > of pointer indirection as the target of an assignment.  is that legal
> > these days?
>
> The problem with the first example is that the
> __SEMAPHORE_INITIALIZER macro uses C99 features, which probably
> aren't supported in gcc 2.7.x.
>
> The LHS has nothing to do with it.

ah, sorry, i didn't look closely enough.  so if one could count on a
C99-compilant compiler being available, then the first form would be
perfectly acceptable?  thanks.

rday
