From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: Network Statistics Collection
Date: Tue, 21 Sep 2004 09:54:23 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <E3E30069B061524E90BCEE4417E30661138533@monm207.monmouth.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-net@vger.kernel.org, linux-c-programming@vger.kernel.org, linux-admin@vger.kernel.org, linux-newbie@vger.kernel.org

Tejas wondered:

>I am working on a company project and as a part of it - I have to
>collect and show some network information on the Monitoring utility.
>Please help to find out that how can I collect these information from
>a Linux Machine.

>1. Number of active TCP connection
>2. Information of Active connections (Source and Dest IP, Source and Dest
Port)
>3. Retransmitted packets due to Duplicate ACK and SACK
>4. Connection Duration and RTT
>5. Transmission Troughput (in KB/Sec)
>6. Number of Newly Created TCP Connections
>7. Closed TCP Connections
>8. Total Data transmitted (in byte)
>9. Total Data Retransmitted (in byte)

Take a look at iptraf - it does most (if not all of what you want).  Through
a
study of its source code you should be able to figure out how to do what you
want.

George
