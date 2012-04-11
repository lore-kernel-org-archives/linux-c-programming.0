From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: close socket and TCP RST
Date: Wed, 11 Apr 2012 14:33:37 +0100
Message-ID: <20357.34865.112925.808959@cerise.gclements.plus.com>
References: <CAJR2zJ9EQ5D-0U_6Yrzmv5nJkv7BBhiOuGLXcgF=c-K7qxsO5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <CAJR2zJ9EQ5D-0U_6Yrzmv5nJkv7BBhiOuGLXcgF=c-K7qxsO5Q@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Celelibi <celelibi@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Celelibi wrote:

> Summary for lazy people ^^: calling close(2) on a socket with a
> non-empty receive kernel-buffer cause the connection to be ReSeT and
> the send buffer discarded and not sent.

Yes; this is all as it should be.

> 1) Is this a standard behavior?

Yes.

> Doesn't the RFC state that every pending data is sent when the
> connection is closed?

The RFCs describe the TCP protocol, not the sockets API.

> 2) Shouldn't that behavior be documented somewhere? I didn't found any
> information about that anywhere. I looked at the man close(2),
> shutdown(2), socket(7), tcp(7).
>
> >From this I deduce that shutdown must be called everytime we want to
> close a socket. But this is not taught anywhere. :p

In many cases, shutdown() is not necessary. Normally, one side knows
whether the other side will send more data. E.g. for (non-pipelined)
HTTP, the client sends a request, the server sends a response, then
closes the connection. At that point, the client sees EOF then
close()s the socket (or it could just close the socket once the amount
of data specified by the Content-Length header has been received).

With a request-response protocol, either the requestor sends a "quit"
command resulting in the responder closing the connection, or the
requestor will just close the connection instead of issuing a request. 
In the latter case, it will either perform a half-close or just wait
until any outstanding response has been received and perform a
full-close.

If you close the receive side of the connection while the other end is
still sending, the kernel needs to inform the sender that data was
discarded (analogous to EPIPE for a pipe). It does so by sending a
RST. A FIN merely indicates that it has ceased sending data; a RST
asserts that the connection no longer exists.

Once it has sent a RST, it cannot send any additional data. Doing so
would just result in the receiver discarding the data and sending a
RST, so there's no point.

If you want the other end to see EOF while your end still receives
data, use shutdown(fd, SHUT_WR) to perform a half-close. This sends a
FIN and effectively makes the descriptor read-only.

The classic example of a half-close is for the rsh protocol, where
each side transmits independently and the format of the data is
unknown to either the client or the server. If the user types Ctrl-D
(or whatever the EOF character is), the rsh client receives EOF which
needs to be passed to the server, which is done using a half-close. 
The server then closes the the descriptor used to write to the pty
master, which causes the shell to read EOF from the slave. Once all
processes writing to the slave have terminated, rshd reads EOF from
the master, closes the socket, server sends FIN to the client, which
the rsh client sees as EOF, at which point it terminates.

-- 
Glynn Clements <glynn@gclements.plus.com>
