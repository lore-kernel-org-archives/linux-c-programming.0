From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Is it bad to let a signal handler stay alive for a long time
Date: Thu, 29 Jan 2009 19:21:22 +0000
Message-ID: <18818.434.100972.665773@cerise.gclements.plus.com>
References: <16930643.1233169098680.JavaMail.ngmail@webmail14.arcor-online.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16930643.1233169098680.JavaMail.ngmail@webmail14.arcor-online.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: xcomp@arcor.de
Cc: linux-c-programming@vger.kernel.org


xcomp@arcor.de wrote:

> But now I ran into another question: If I am using swapcontext inside
> the signal handler its context stays alive for a long time (because
> other contexts are running before the handler can finish its work). I
> didn't find any trouble caused by this till now. But I've found also
> many sites where they say that a signal handler should include only a
> small amount of code so that it can finish fast.

Do any of them say why?

The main reason for not doing too much inside a signal handler is that
only a handful of functions are specified as being safe to use from
within a signal handler.

If you are using user-space threads, you should protect "unsafe"
functions from being re-entered with semaphores or similar. Note that
functions which are re-entrant with respect to pthreads won't
necessarily be re-entrant with respect to user-space threading.

The pthreads library overrides a number of libc functions; the fact
that the pthreads version is re-entrant doesn't mean that the normal
version is. Also, some functions may use per-thread storage
(pthread_setspecific() etc), but this doesn't help if you only have
one "real" thread. E.g. errno is per-thread; functions which need to
check errno will be re-entrant for pthreads but not for user-space
threads.

Another reason is that the signal will be blocked while its handler is
executing. On platforms which don't queue blocked signals (Linux
does), only the first blocked signal will be received; the rest will
be lost. But this doesn't apply if you leave the handler via
swapcontext(), as each context has a separate signal mask.

-- 
Glynn Clements <glynn@gclements.plus.com>
