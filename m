From: Muthukumar Ratty <muthu@iqmail.net>
Subject: Re: soft real-time scheduling
Date: Sun, 26 Sep 2004 08:06:05 -0700 (PDT)
Sender: gcc-help-owner@gcc.gnu.org
Message-ID: <Pine.LNX.4.33.0409260800360.26309-100000@Muruga.localdomain>
References: <20040926140831.62007.qmail@web52901.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <gcc-help-return-18043-gcc-help=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-help-unsubscribe-gcc-help=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc-help/>
List-Post: <mailto:gcc-help@gcc.gnu.org>
List-Help: <mailto:gcc-help-help@gcc.gnu.org>
In-Reply-To: <20040926140831.62007.qmail@web52901.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ankit Jain <ankitjain1580@yahoo.com>
Cc: linux prg <linux-c-programming@vger.kernel.org>, gcc <gcc-help@gcc.gnu.org>


Hi, This is offtopic for this list.

from http://gcc.gnu.org/lists.html

"gcc-help is a relatively high volume list for people searching for help
in building or using GCC."


Anyway, for your question... i see few problems

1.    struct sched_param *p;
    sched_getparam(0,p);
Using unallocated memory. will result in SEGV

2. When you get 1 corrected, you may get another error
From man 2 sched_setscheduler
<snip>
EPERM  The calling process does not have appropriate  privileges.
<snip>

On Sun, 26 Sep 2004, Ankit Jain wrote:

> hi
>
>  /* soft realtime scheduling variable */
>    struct sched_param *p;
>
>
>  /* set soft real-time scheduling */
>    sched_getparam(0,p);
>    p->sched_priority = 50;
>    if (sched_setscheduler(0,SCHED_FIFO,p))
>      fprintf(stderr,"Could not change scheduler
> settings\n");
>
> if anyone knows about this then i need some help
>
> p is a pointer to the structure sched_param which is
> defined in sched.h
>
> this structure has a variable __sched_priority where i
> have to set the priority of the process
>
> p->sched_priority =50 this line gives a segmentation
> fault.
> how t oaccess this variable (__sched_priority) of the
> header file
>
> thanks
>
> ankit
>
> ________________________________________________________________________
> Yahoo! Messenger - Communicate instantly..."Ping"
> your friends today! Download Messenger Now
> http://uk.messenger.yahoo.com/download/index.html
>


