From: Jeff Woods <kazrak+kernel@cesmail.net>
Subject: Re: using the same port with two sockets
Date: Thu, 25 Sep 2003 10:15:52 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <5.2.1.1.0.20030925100439.01af0250@no.incoming.mail>
References: <Pine.A41.4.20.0309251006170.140698-100000@delfin.unideb.hu
 >
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.A41.4.20.0309251006170.140698-100000@delfin.unideb.hu
 >
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Fekete Gabor <feketga@delfin.unideb.hu>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

At 9/25/2003 10:16 AM +0200, Fekete Gabor wrote:
>with SOCK_STREAM if the server accept()s a connection it creates
>another sokcet that can be used to handle that connection.
>I want to do the same but with SOCK_DGRAM.
>So what I want is to recvfrom() a "connection" request and then
>create another socket to handle that "connection", that is, the
>server would go back to recvfrom() requests without worrying about
>packets arriving from the previously "accepted" client which would
>send those packets to the socket created especially for it.
>Is it possible?

Unlike SOCK_STREAM (aka TCP sockets) SOCK_DGRAM (aka UDP sockets) are 
connectionless.  Every new UDP packet arrives at the single listening 
socket which is bound to the UDP port addressed.  You can not have two 
sockets listening on the same UDP port (IIUC).

I recommend Richard Stevens' book "Unix Network Programming" (ISBN: 
013490012X ) for an excellent explanation.
http://www.amazon.com/exec/obidos/ASIN/013490012X

--
Jeff Woods <kazrak+kernel@cesmail.net> 


