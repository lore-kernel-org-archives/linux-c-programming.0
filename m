From: Glynn Clements <glynn.clements@virgin.net>
Subject: RE: question on socket connection
Date: Mon, 26 May 2003 09:27:35 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16081.53239.610446.749983@cerise.nosuchdomain.co.uk>
References: <EF836A380096D511AD9000B0D021B527013AD275@narmada.techmas.hcltech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <EF836A380096D511AD9000B0D021B527013AD275@narmada.techmas.hcltech.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Ranga Reddy M - CTD ,Chennai." <rangareddym@ctd.hcltech.com>
Cc: ronkhu@ntsp.nec.co.jp, linux-c-programming <linux-c-programming@vger.kernel.org>


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
> time out of 2 hours. If there is not data on the socket for 2 hrs this will
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
