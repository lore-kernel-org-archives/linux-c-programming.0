From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: POSIX Message Queues
Date: Sat, 12 Jun 2010 14:40:07 +0100
Message-ID: <19475.36407.405869.794968@cerise.gclements.plus.com>
References: <20100612021011.2461323D@resin16.mta.everyone.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20100612021011.2461323D@resin16.mta.everyone.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ajhwb@knac.com
Cc: linux-c-programming@vger.kernel.org


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
