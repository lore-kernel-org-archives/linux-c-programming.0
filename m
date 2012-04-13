From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: close socket and TCP RST
Date: Fri, 13 Apr 2012 08:32:21 +0100
Message-ID: <20359.54917.165693.172256@cerise.gclements.plus.com>
References: <CAJR2zJ9EQ5D-0U_6Yrzmv5nJkv7BBhiOuGLXcgF=c-K7qxsO5Q@mail.gmail.com>
	<20357.34865.112925.808959@cerise.gclements.plus.com>
	<CAJR2zJ8rYPjR_+Nw_NSBBZgmKr95ekX0mt093aq89Bs59p8oYA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <CAJR2zJ8rYPjR_+Nw_NSBBZgmKr95ekX0mt093aq89Bs59p8oYA@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Celelibi <celelibi@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Celelibi wrote:

> However, when I look at the TCP's RFC 793 (a.k.a STD7):
> http://www.rfc-editor.org/rfc/std/std7.txt
> Section 3.5 "Closing a Connection" says:
> "A TCP will reliably deliver all buffers SENT before the connection was CLOSED"
> 
> And RFC 1122 ("host requirement"): http://www.rfc-editor.org/rfc/rfc1122.txt
> Section 4.2.2.13 "Closing a Connection" says:
> "If such a host issues a CLOSE call while received data is still
> pending in TCP, or if new data is received after CLOSE is called, its
> TCP SHOULD send a RST to show that data was lost."
> 
> IMO both are not incompatible and should be done. But I may have
> missed something somewhere.

First, the RFC's "close" doesn't necessarily equate to the Unix
close() call.

The host can't send outstanding data after a RST has been sent (if it
did, the receiver would just reply with an RST rather than an ACK, it
the sender definitely shouldn't send data after an RST has been
received).

Sending outstanding data then sending the RST afterwards is
potentially problematic as the receiver may not be able or willing to
read the data until its own data has been ACK'd, which would result in
deadlock.

> > With a request-response protocol, either the requestor sends a "quit"
> > command resulting in the responder closing the connection, or the
> > requestor will just close the connection instead of issuing a request.
> > In the latter case, it will either perform a half-close or just wait
> > until any outstanding response has been received and perform a
> > full-close.
> 
> Well, this is close to the original protocol. It was a kind of SQL
> server. Every command is terminated by a semi-colon while every "\n"
> are treated as spaces.
> 
> The client send "QUIT;\n", the server read 'Q', 'U', 'I', 'T', ';',
> process "QUIT", send to the client Something that say "Ok, I quit" and
> close() the connection.
> However, a "\n" is still in the receive buffer of the server! That
> makes the server RST the connection ASAP and discard the messages that
> were not sent yet... Namely the "Ok, I quit" message which was delayed
> because of Nagle's algorithm or whatever.
> Annoying isn't it?

If the server sends a response to the quit command, the client should
read the response then close() the socket. Provided that the server's
response is well-formed, there shouldn't be a problem.

Ultimately, if neither side can be relied upon to strictly adhere to
the protocol, then at least one side must perform a half-close, and
each side must wait for EOF before closing the read side of the
connnection.

Alternatively, using SHUT_WR with SO_LINGER allows the sender to
ensure that any data is sent before closing the read side, so even if
the connection does end in a RST, sent data won't be lost.

However, this may be a moot point, as a connection terminated by RST
may result in close() indicating an error. For some protocols, that
will cause any "transaction" to be aborted; e.g. for POP3, any
messages marked for deletion by the DELE command should only be
deleted if the connection is terminated normally.

-- 
Glynn Clements <glynn@gclements.plus.com>
