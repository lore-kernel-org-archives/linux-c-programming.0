From: "Ardhan Madras" <ajhwb@knac.com>
Subject: Re: POSIX Message Queues
Date: Mon, 14 Jun 2010 20:34:26 -0700
Message-ID: <20100614203426.2456FD00@resin06.mta.everyone.net>
Reply-To: <ajhwb@knac.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

It was mq_open(), sorry my bad ;p

I did umask(0001) before creating the queue, it's works now. 'Program A' that requested O_RDWR flag to the queue can send and receive message as 'Program B' did. I also try to demonstrating this problem with another machine (Linux of course), as result i can O_RDWR'ed program A queue flag without have to call umask() first. Is this behavior can be set through system configuration?

fchmod() also works here, sorry, but what do you mean with 'not portable'?, do you mean fchmod() intended to be used only for file, in other words "not every system support fchmod() with message queue descriptor" right?

               Ardhan,


--- glynn@gclements.plus.com wrote:

From:	Glynn Clements <glynn@gclements.plus.com>
To:	<ajhwb@knac.com>
Cc:	<linux-c-programming@vger.kernel.org>
Subject: Re: POSIX Message Queues
Date:	Sat, 12 Jun 2010 14:40:07 +0100


Ardhan Madras wrote:

> I'm using POSIX message queue to exchange data as follow:
> 
> struct data {
>     unsigned char cmd;
>     long value;
> };
> 
> Creating a queue in program B:
> 
> struct mq_attr attr = { .mq_maxmsg = 1, .mq_msgsize = sizeof(struct data) };
> mqd_t mqd = open("/somename", O_RDWR | O_CREAT, 0777, &attr);
> 
> Open that queue in program A:
> 
> mqd_t mqd = open("/somename", O_RDWR); /* O_RDONLY should works here */

I presume that you mean mq_open() rather than open(), right?

> With given queue, i can't open this queue in program A with O_RDWR or
> O_WRONLY flag (O_RDONLY should works), no matter how i set the flag
> mode in program B's mq_open() i got EACCESS, i need both program can
> send and receive queues.
> 
> Did i miss something here?

The requested permissions have the process' umask subtracted from
them. Unless you've changed it, the umask probably removes at least
world-write permission, and possibly others. Either clear the umask
before calling mq_open(), or set the permissions afterwards with
fchmod() (although I don't know whether the latter is portable).

Also, if the queue already exists, mq_open(O_CREAT) will open the
existing queue; it won't replace it or change the permissions. Add
O_EXCL if you want it to fail if a queue with the same name already
exists.

-- 
Glynn Clements <glynn@gclements.plus.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html




_____________________________________________________________
Listen to KNAC, Hit the Home page and Tune In Live! ---> http://www.knac.com
