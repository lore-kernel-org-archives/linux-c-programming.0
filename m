From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: pointer indirection on the LHS of an assignment
Date: Sat, 7 Oct 2006 09:12:07 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0610070909590.6332@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: C programming list <linux-c-programming@vger.kernel.org>


  sort of a combination of a C and gcc question but what's the rules
these days on the following (ripped from the linux kernel source, from
asm/semaphore.h)?

===
static inline void sema_init (struct semaphore *sem, int val)
{
/*
 *      *sem = (struct semaphore)__SEMAPHORE_INITIALIZER((*sem),val);
 *
 * i'd rather use the more flexible initialization above, but sadly
 * GCC 2.7.2.3 emits a bogus warning. EGCS doesn't. Oh well.
 */
        atomic_set(&sem->count, val);
        sem->sleepers = 0;
        init_waitqueue_head(&sem->wait);
}
===

  i recall that earlier compilers complained about that first example
of pointer indirection as the target of an assignment.  is that legal
these days?

rday
