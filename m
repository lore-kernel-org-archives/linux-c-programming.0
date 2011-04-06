From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: close() on tcp socket.
Date: Wed, 6 Apr 2011 20:20:29 +0100
Message-ID: <19868.48381.449887.852156@cerise.gclements.plus.com>
References: <BANLkTimLJ4k1KzmzHkz10JvL9HTyb0y+WQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <BANLkTimLJ4k1KzmzHkz10JvL9HTyb0y+WQ@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc: linux-c-programming@vger.kernel.org


ratheesh kannoth wrote:

> connect() system call establishes a connection as shown in below steps.
> 
> 1.   |client |  ----------------- syn --------------->  | server |
> 
> 2.  |Server|  --------------syn+ ack --------------> | client |
> 
> 3.  | Client | -----------------ack --------------------> | Server |
> 
> 
> But establishing connection , client calls close() system call. Client
> is sending FIN+ ACK to server  [ i expected only FIN to be sent from
> client to server ]

Every TCP packet except the initial SYN-only packet includes an ACK. 
The ACK flag simply indicates that the acknowledgement number field is
valid. Once a host has received at least one packet, any packets which
it sends will always have a valid acknowledgement number and so the
ACK flag will be set.

When the client sends the initial SYN packet to create the connection,
it hasn't received any packets from the server, so it cannot
acknowledge anything. This packet (including any retransmissions of
it) is the only case where the ACK flag will be clear.

> Is this a valid scenario.?  what could be the problem ?

There is no problem.

-- 
Glynn Clements <glynn@gclements.plus.com>
