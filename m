From: "John T. Williams" <jowillia@vt.edu>
Subject: Re: question on socket connection
Date: Mon, 26 May 2003 06:05:14 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <001a01c3236e$6249bc00$ed64a8c0@descartes>
References: <EF836A380096D511AD9000B0D021B527013AD2E1@narmada.techmas.hcltech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Ranga Reddy M - CTD ,Chennai." <rangareddym@ctd.hcltech.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>


send a keep alive packet every minute, and only have the server disconnect
if 10 in a row are missing.




Or cause your server respond to keep_alive packets. This way the client
knows if the server received it or not and can resend if it doesn't get the
appropriate response withing an given time period.



Unless bandwidth is at an unusual premium, I don't think you need to worry
about Keep_alive packets waisting bandwidth. TCP/IP waist plenty of
bandwidth; far more then any reasonable sized keep_alive packet could.



----- Original Message ----- 
From: "Ranga Reddy M - CTD ,Chennai." <rangareddym@ctd.hcltech.com>
To: "Glynn Clements" <glynn.clements@virgin.net>; "Ranga Reddy M - CTD
,Chennai." <rangareddym@ctd.hcltech.com>
Cc: <ronkhu@ntsp.nec.co.jp>; "linux-c-programming"
<linux-c-programming@vger.kernel.org>
Sent: Monday, May 26, 2003 4:44 AM
Subject: RE: question on socket connection


>
> Now Iam puting alarm (SIGALRM) on the reader side if There is no
> data/response for some time,(according to my application manipulation).Iam
> disconnecting the client connection.
>
> In the above design client application is implented like that each 5 min
or
> (according to my application manipulation) will send a "KEEP ALIVE request
> to the server". With this request Iam updating the client connection in
the
> server.
>
> According to me this is OK, but Iam wasting the network bandwidth and if
by
> mistake this packet is lost then server disconnects the client connection.
>
> Can any one give me a idea.
>
> Thanks
> ------
> Ranga
>
> -----Original Message-----
> From: Glynn Clements [mailto:glynn.clements@virgin.net]
> Sent: Monday, May 26, 2003 1:58 PM
> To: Ranga Reddy M - CTD ,Chennai.
> Cc: ronkhu@ntsp.nec.co.jp; linux-c-programming
> Subject: RE: question on socket connection
>
>
>
> Ranga Reddy M - CTD ,Chennai. wrote:
>
> > Error -1: because of recv/send fail.
> > Error EGAIN: this is because of MSG_DONTWAIT.
> >
> > Client and Server Both are running on different systems.What if client
> > crashes or powered off.How does the underlaying TCP/IP layer works
> > here,There is no time for TCP/IP to say socket close to server.
>
> The socket won't be "closed" until the other end is rebooted or
> powered up and sends a RST, or (if SO_KEEPALIVE is used) until the
> kernel times out the connection.
>
> > Client does not give any indication of socket close.Then, I think server
> > will does not know about the status of the client.
>
> Correct. If you don't get a response, there's no way to tell whether
> that's due to a transient network fault, or because the other end has
> crashed or is powered off.
>
> > I have read the article about the "Nagles allgoritham" . It sets a
default
> > time out of 2 hours. If there is not data on the socket for 2 hrs this
> will
> > disconnect the socket.
>
> No. The "Nagle algorithm" is for coalescing many small writes into
> fewer, larger packets.
>
> TCP keep-alive is something else; it involves sending occasional
> zero-byte packets when the connection would otherwise be idle in order
> to detect whether the remote end is still functioning.
>
> > Is there any way to trace???
>
> I don't understand that question.
>
> -- 
> Glynn Clements <glynn.clements@virgin.net>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

