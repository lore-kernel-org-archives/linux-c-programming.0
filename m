From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: signaling a thread to stop
Date: Sun, 14 Apr 2002 15:43:39 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15545.38299.775057.577548@cerise.nosuchdomain.co.uk>
References: <1018798684.4455.17.camel@hikaru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1018798684.4455.17.camel@hikaru>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Eduardo Gomez Noguera <davidgn@servidor.unam.mx>
Cc: linux c programming <linux-c-programming@vger.kernel.org>


David Eduardo Gomez Noguera wrote:

> I am writting a gtk program that comunicates with a pen pad. when it
> starts writting, it starts doing it in "real time", just as the pen
> moves, there is flow of data, so a toggle button creates a thread, and
> will need to stop it too.
> 
> what is the best way to do it?
> 
> i read on libc info page pthread_cancel, but didnt understand what does
> it exactly do.
> I think it signals the thread, then the thread must tests its value to
> see if it has been "canceled" and decide upon an action (after the
> thread itself was set to CANCEL_ENABLE)what to do, am i right?

Assuming that the thread has cancellation enabled (which is the
default), if the cancellation type is deferred (the default), it will
be cancelled upon the next call to any of:

       pthread_join
       pthread_cond_wait
       pthread_cond_timedwait
       pthread_testcancel
       sem_wait
       sigwait

OTOH, if the cancellation type is set to asynchronous, with
pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS), the thread will be
terminated as soon as it receives the request.

-- 
Glynn Clements <glynn.clements@virgin.net>
