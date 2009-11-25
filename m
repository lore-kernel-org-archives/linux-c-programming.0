From: Randi Botse <nightdecoder@gmail.com>
Subject: select() timeout question
Date: Wed, 25 Nov 2009 03:29:33 -0500
Message-ID: <34e1241d0911250029g5e56e1cdxe7abfce03eb15836@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=iqRN4OUztZnXUDGONefaMRnaHw9dcNFCW4+rIGPIEvM=;
        b=gwk35XvXJnig+nwiPFgDuYcSX9S9i+Fo2g2FkzTTHuhmpmvNL2q/lO43X9mOZBaeVJ
         A3XOZ9SeCnYOd3mLcaJJcKEk1fHQ93E8fGi7IaF98B0x5gDqDeWypnnELWInSXEgYhF2
         ioWahntNutJnYRgUgvB+dDBoK2FVi9pnXVE7o=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

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
