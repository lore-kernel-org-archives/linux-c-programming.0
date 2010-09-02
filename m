From: "Ardhan Madras" <ajhwb@knac.com>
Subject: Re: POSIX Message Queues
Date: Thu, 2 Sep 2010 02:51:56 -0700
Message-ID: <20100902025156.8C23C442@resin17.mta.everyone.net>
Reply-To: <ajhwb@knac.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

Hi all,

        I use message queue to exchange data between 2 unrelated process, as shown below

Program A:
while (1) {
    mq_receive(); /* wait and receive request */
    /* process request */
    mq_send(); /* reply the request result */
}

Program B:
mq_send(); /* send request */
mq_receive(); /* process result */

        How it's possible to process A that call mq_send() receive it's *own* send data using mq_receive(), so process B that intended to read the message (mq_receive()) could not read it?, the problem is *sometime* happen, at most program A reply what program B requested. Did I miss something here?

        Ardhan



--- glynn@gclements.plus.com wrote:

From: Glynn Clements <glynn@gclements.plus.com>
To: <ajhwb@knac.com>
Cc: <linux-c-programming@vger.kernel.org>
Subject: Re: POSIX Message Queues
Date: Tue, 15 Jun 2010 16:33:25 +0100


Ardhan Madras wrote:

> It was mq_open(), sorry my bad ;p
> 
> I did umask(0001) before creating the queue, it's works now. 'Program
> A' that requested O_RDWR flag to the queue can send and receive
> message as 'Program B' did. I also try to demonstrating this problem
> with another machine (Linux of course), as result i can O_RDWR'ed
> program A queue flag without have to call umask() first. Is this
> behavior can be set through system configuration?

A process' umask is inherited from its parent. For interactive
sessions, you can set it in your ~/.profile or similar. For daemons
started by init, you can set it in the rc script which starts the
daemon.

> fchmod() also works here, sorry, but what do you mean with 'not
> portable'?, do you mean fchmod() intended to be used only for file, in
> other words "not every system support fchmod() with message queue
> descriptor" right?

Yes.

-- 
Glynn Clements <glynn@gclements.plus.com>




_____________________________________________________________
Listen to KNAC, Hit the Home page and Tune In Live! ---> http://www.knac.com
