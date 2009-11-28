From: "Ardhan Madras" <ajhwb@knac.com>
Subject: Re: select() timeout question
Date: Fri, 27 Nov 2009 21:43:10 -0800
Message-ID: <20091127214310.FCC998C@resin13.mta.everyone.net>
Reply-To: <ajhwb@knac.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Hi Randi,

Basically the select syscall check the kernel buffer or in other words it just waiting to be notified by the kernel that there are pending data to read/write, it doesn't store any file-descriptor's related data.

                 - Ardhan


--- nightdecoder@gmail.com wrote:

From:	Randi Botse <nightdecoder@gmail.com>
To:	linux-c-programming@vger.kernel.org
Subject: select() timeout question
Date:	Wed, 25 Nov 2009 03:29:33 -0500

Hi All,

Im now learning the Linux's select() system call,

#include <sys/select.h>

int select(int fd, fd_set *rset, fd_set *wset, fd_set *excepfs, struct
timeval *timeout);

I want to receive notification when the given file descriptor is ready
to read, i use TCP socket connection to demonstrate this, one for the
sender and other for the receiver, with normal condition, when the
sender send data via write(), the select() returns and tell the
receiver there are data to read.

My question is: what happen when the receiver's select() is reaching
it's timeout while the sender send data? should the notification and
it's data lost (discarded)?

Based on my above experiment, select() never fail to notify although
it's in timeout state, and i awalys can read the data, i'm curious
with this, but i'm not sure if this always right.

Thanks before.

                                            Randi,
--
To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html




_____________________________________________________________
Listen to KNAC, Hit the Home page and Tune In Live! ---> http://www.knac.com
