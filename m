From: "Ardhan Madras" <ajhwb@knac.com>
Subject: POSIX Message Queues
Date: Sat, 12 Jun 2010 02:10:11 -0700
Message-ID: <20100612021011.2461323D@resin16.mta.everyone.net>
Reply-To: <ajhwb@knac.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

    I'm hacking a program that need to do several *privileged* tasks, such as getting ethernet's link status (ioctl's SIOCETHTOOL command), setting and saving system time, and many more, this program must run in regular user mode (unprivileged), let's call this program as 'A'. I created another program (program 'B') as service than run in privileged mode to do privileged tasks above. I'm using POSIX message queue to exchange data as follow:

struct data {
    unsigned char cmd;
    long value;
};

Creating a queue in program B:

struct mq_attr attr = { .mq_maxmsg = 1, .mq_msgsize = sizeof(struct data) };
mqd_t mqd = open("/somename", O_RDWR | O_CREAT, 0777, &attr);

Open that queue in program A:

mqd_t mqd = open("/somename", O_RDWR); /* O_RDONLY should works here */

With given queue, i can't open this queue in program A with O_RDWR or O_WRONLY flag (O_RDONLY should works), no matter how i set the flag mode in program B's mq_open() i got EACCESS, i need both program can send and receive queues.

Did i miss something here?

                            Ardhan,


_____________________________________________________________
Listen to KNAC, Hit the Home page and Tune In Live! ---> http://www.knac.com
