From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: connecting to a hoast
Date: Mon, 13 Sep 2004 12:09:21 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <E3E30069B061524E90BCEE4417E30661138528@monm207.monmouth.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org


>Hi all.
>I was wondering, where is a step by step instructions to connect to a
hoast?
>The documentation seems very cryptic, and doesn't give directions.

There are several online tutorial for network programming (beej for
example),
however if you intend to do a lot of network programming, I would recommend
reading one or more of the following books:

1. Unix Network Programming vol 1 and 2 by W. Richard Stevens

   N.B. - volume one was recently updated by Bill Fenner and Andrew M Rudoff

          after Stevens death.

   volumn 1 covers Sockets and XTI programming.  Lots of examples and
details 
   volume 2 covers interprocess communications

2. Internetworking with TCP/IP vol 1 -3 by Douglas Comer and David Stevens

   volume 1 covers the protocols and architecture
   volume 2 covers the implementation of the network stack and protocols
   volume 3 covers client-server programming.  There are seperate volumes 
            for most of the popular operating systems.

3. TCP/IP Illustrated, vol 1 - 3 by W. Richard Stevens
   volume 1 is a detailed coverage of the protocols and how they work
   volume 2 is a line by line code walkthrough for the TCP stack of 4.4BSD
   volume 3 covers transaction based communications and UNIX domain
protocols

3. Linux Socket Programming by Sean Walton

4. Effective TCP/IP Programming: 44 Tips to Improve Your Programming,
   Jon C. Snader

   Lots of useful tips to improve you code.

George

