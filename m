From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Slow signal delivery to server process with heavy I/O
Date: Sun, 11 Jul 2010 14:18:16 +0100
Message-ID: <19513.50328.712544.577528@cerise.gclements.plus.com>
References: <AANLkTimehfszGlcsKm4wt2byyNTb8cGD7DQSBK_W2Ome@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <AANLkTimehfszGlcsKm4wt2byyNTb8cGD7DQSBK_W2Ome@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dallas Clement <dallas.a.clement@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Dallas Clement wrote:

> I've noticed that asynchronous signals such as SIGINT, SIGTERM etc are
> delivered to my process long after the signal is sent if the receiving
> process is handling lots of I/O.  My process is a multi-threaded web
> server.  It's got one thread waiting on 'select' to accept incoming
> connections and a thread pool which reads the data with 'recv'.
> 
> When I batter the web server with incoming traffic and I try to
> shutdown the server by sending a SIGINT or SIGTERM, I have observed
> that the web server finishes handling the incoming traffic before the
> kernel dispatches the signal to the process.  It appears that the
> 'select' and 'recv' calls are getting highest priority with regard to
> scheduling.
> 
> I realize this test may appear unnatural and is perhaps unrealistic,
> but I would like to be able to shutdown my server gracefully within a
> reasonable amount of time, no matter what kind of load it is handling.
>  Don't want to have to wait several minutes for my signals to get
> handled under heavy load.  Could someone please explain why signal
> delivery is slow under these conditions?

Is it delivery that's slow, or handling? A thread which is executing a
signal handler doesn't get any additional priority. And if there is
intensive disk I/O, paging in the block containing the signal handler
won't get prioritised over other disk I/O.

Also: historically, the kernel hasn't been particularly intelligent
about choosing which thread received the signal (at one time, it
didn't even take into account whether the thread had blocked the
signal). It wouldn't surprise me if it's willing to deliver the signal
to a thread which is in uninterruptible sleep ("D" state).

-- 
Glynn Clements <glynn@gclements.plus.com>
