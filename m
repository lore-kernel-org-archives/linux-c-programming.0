From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: another socket connection question
Date: Thu, 3 Jul 2003 07:12:15 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16131.51519.340635.202856@cerise.nosuchdomain.co.uk>
References: <3F039FB2.3070600@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3F039FB2.3070600@hq.ntsp.nec.co.jp>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Lejanson C. Go" <lejanson@ntsp.nec.co.jp>
Cc: linux-c-programming@vger.kernel.org


Lejanson C. Go wrote:

> I am trying to make a client server application where a client
> is trying to get the nodeId of the server.
> 
> The server opens up its ports and my client connects to the server.
> If unsuccessful the client side will retry to connect until it is
> successful.
> 
> Considering the client is connected. Client application then will
> send a GetServerNodeId request to the server.
> 
> What if the server is not ready to receive any request, how will
> I make my GetServerNodeId request to be sent without errors? My
> client application displays "Broken Pipe" when I run the client.

"Broken Pipe" means that you are writing to a closed descriptor.

Is this using TCP or UDP?

For TCP, connect() will either fail or will block until the server has
acknowledged the connection. Once the connection has been established,
you just send the request once and wait for the reply.

If you're using UDP, you should probably learn how TCP is implemented,
because you will end up re-implementing many of the mechanisms which
TCP uses (sequencing, acknowledgements, flow control, etc).

-- 
Glynn Clements <glynn.clements@virgin.net>
