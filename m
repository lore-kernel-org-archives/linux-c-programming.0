From: Romain Geissler <romain.geissler@gmail.com>
Subject: mq_timedreceive on multiple queues
Date: Mon, 15 Apr 2013 09:48:05 +0200
Message-ID: <CAF+LTefWbDyLPukDFei7o9LdOjoHrF6=ud5Oyk=P5epPgdz_rg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=uVUfXLuXCpHcQD3rE1xHVWqHHQ/ODaKgMJkHFxGKwi8=;
        b=LGMqGpqiBELT+NQidUbAXR9C7wN48eBv03PsrOStzG8FiPREekEbddGMJUR8Da4+Ry
         8HZBPRACsJcz0R7xWg5scXV3EOX38l2jzNTBn1ENMkxKCHAz+qbXdI5nZy6J27fDd5yt
         ZETdidmMEPgo6ojmX9txc7M23cyI3LVQQN1kmgwrzbcHGqSN8/mxdXjJBjfH19CdzIek
         woSQD3o8BYEJkqCA2nXSCCzYeJk3OHS4Dq9I6uOuQg6XbHxZDEKyGtleYOd1Ft/QZz06
         UAsiCYuECW1iZW7oAAan8/g0snlLtx3UXFRkxStfsVx4j79oeIMNKgyjTeJj0BUawLz5
         4Jew==
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi,

I am currently facing an issue when reading in a set of several posix
queues (let's say 2 different mqueues) from several processes. I
currently use epoll_wait to wait for an incoming message on either
queue on all listening processes, then mq_timedreceive to retrieve it
from the queue.

This is an issue when the number of reader process grows, as if I send
only one message on a queue, all processes are awaken when epoll_wait
returns, and all processes try to fetch the message. I would like to
fix this and wake up only one process when listening to several
queues, removing the useless user/kernel space switchs for the other
listening processes.

Is there any way to run a mq_receive/mq_timedreceive on several
queues, that would wake up only one process? Something more or less
like epoll, but that also fetches a message from the readable queues
before returning.

Thanks,
Romain
