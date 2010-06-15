From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: POSIX Message Queues
Date: Tue, 15 Jun 2010 16:33:25 +0100
Message-ID: <19479.40261.468578.991824@cerise.gclements.plus.com>
References: <20100614203426.2456FD00@resin06.mta.everyone.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20100614203426.2456FD00@resin06.mta.everyone.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ajhwb@knac.com
Cc: linux-c-programming@vger.kernel.org


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
