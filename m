From: "Ranga Reddy M - CTD ,Chennai." <rangareddym@ctd.hcltech.com>
Subject: RE: question on socket connection
Date: Mon, 26 May 2003 14:14:38 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <EF836A380096D511AD9000B0D021B527013AD2E1@narmada.techmas.hcltech.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn.clements@virgin.net>, "Ranga Reddy M - CTD ,Chennai." <rangareddym@ctd.hcltech.com>
Cc: ronkhu@ntsp.nec.co.jp, linux-c-programming <linux-c-programming@vger.kernel.org>


Now Iam puting alarm (SIGALRM) on the reader side if There is no
data/response for some time,(according to my application manipulation).Iam
disconnecting the client connection.

In the above design client application is implented like that each 5 min or
(according to my application manipulation) will send a "KEEP ALIVE request
to the server". With this request Iam updating the client connection in the
server.

According to me this is OK, but Iam wasting the network bandwidth and if by
mistake this packet is lost then server disconnects the client connection.

Can any one give me a idea.

Thanks
------
Ranga

-----Original Message-----
From: Glynn Clements [mailto:glynn.clements@virgin.net]
Sent: Monday, May 26, 2003 1:58 PM
To: Ranga Reddy M - CTD ,Chennai.
Cc: ronkhu@ntsp.nec.co.jp; linux-c-programming
Subject: RE: question on socket connection



Ranga Reddy M - CTD ,Chennai. wrote:

> Error -1: because of recv/send fail.
> Error EGAIN: this is because of MSG_DONTWAIT.
> 
> Client and Server Both are running on different systems.What if client
> crashes or powered off.How does the underlaying TCP/IP layer works
> here,There is no time for TCP/IP to say socket close to server.

The socket won't be "closed" until the other end is rebooted or
powered up and sends a RST, or (if SO_KEEPALIVE is used) until the
kernel times out the connection.

> Client does not give any indication of socket close.Then, I think server
> will does not know about the status of the client.

Correct. If you don't get a response, there's no way to tell whether
that's due to a transient network fault, or because the other end has
crashed or is powered off.

> I have read the article about the "Nagles allgoritham" . It sets a default
> time out of 2 hours. If there is not data on the socket for 2 hrs this
will
> disconnect the socket.

No. The "Nagle algorithm" is for coalescing many small writes into
fewer, larger packets.

TCP keep-alive is something else; it involves sending occasional
zero-byte packets when the connection would otherwise be idle in order
to detect whether the remote end is still functioning.

> Is there any way to trace???

I don't understand that question.

-- 
Glynn Clements <glynn.clements@virgin.net>
