From: Fekete Gabor <feketga@delfin.unideb.hu>
Subject: Re: using the same port with two sockets
Date: Thu, 25 Sep 2003 21:35:51 +0200 (DFT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.A41.4.20.0309252133350.71280-100000@delfin.unideb.hu>
References: <5.2.1.1.0.20030925100439.01af0250@no.incoming.mail>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <5.2.1.1.0.20030925100439.01af0250@no.incoming.mail>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>



On Thu, 25 Sep 2003, Jeff Woods wrote:

> Unlike SOCK_STREAM (aka TCP sockets) SOCK_DGRAM (aka UDP sockets) are 
> connectionless.  Every new UDP packet arrives at the single listening 
> socket which is bound to the UDP port addressed.  You can not have two 
> sockets listening on the same UDP port (IIUC).
> 
it's ok. i know it.
i mean i would like to emulate the TCP connections with UDP.
ok the truth is, i need it because i want to make a client/server stuff
with udp.


