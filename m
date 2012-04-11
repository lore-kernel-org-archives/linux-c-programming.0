From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: close socket and TCP RST
Date: Thu, 12 Apr 2012 00:31:41 +0100
Message-ID: <20358.5213.624894.840711@cerise.gclements.plus.com>
References: <CAJR2zJ9EQ5D-0U_6Yrzmv5nJkv7BBhiOuGLXcgF=c-K7qxsO5Q@mail.gmail.com>
	<20357.34865.112925.808959@cerise.gclements.plus.com>
	<5706767.2IZuFMGXdL@desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <5706767.2IZuFMGXdL@desktop>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bogdan Cristea <cristeab@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Bogdan Cristea wrote:

> > In many cases, shutdown() is not necessary. Normally, one side knows
> > whether the other side will send more data. E.g. for (non-pipelined)
> > HTTP, the client sends a request, the server sends a response, then
> > closes the connection.
> 
> It is exactly what he does, but the question is how to close the connection so 
> that the client receives the last message. 
> He is using for this:
> 
>  err = setsockopt(sockfd, SOL_SOCKET, SO_LINGER, &lin, sizeof(lin));
> 
> but for some reason it does not work as it should.

IIUC, he close()s a socket which has unread data. Whether the data had
already been received when close() was called or whether it arrived
afterwards doesn't matter.

Normal behaviour is simply not to use close() or shutdown(SHUT_RD) if
you expect to receive more data, e.g. wait until you have seen EOF
(i.e. read(), recv() etc return a zero count) before closing the read
side of the socket.

Current Linux behaviour is that receiving data on a close()ed socket
sends a RST. No data can be sent after a RST.

SO_LINGER doesn't affect this; it just affects whether close() or
shutdown(SHUT_WR) wait until the data has been sent (i.e. for the FIN
to be ACK'd).

AFAIK, there is no way to make close() or shutdown(SHUT_RD) silently
discard subsequent inbound data.

The exact behaviour of SHUT_RD isn't specified by any standard. The
RFCs don't deal with the sockets API, and POSIX just says "Disables
further receive operations". For Unix-domain sockets, a writer will
receive SIGPIPE/EPIPE; Linux' current behaviour for TCP sockets is at
least consistent with that.

Alternatives include:

1. ACK and discard the data. But then there would be no way for the
sender to identify that it's writing to a closed socket.

2. Do nothing. The receive buffer will fill, the window will close,
and the sender will block until someone kills it (it won't time out
because probes will still be met with an ACK of the last byte which
fitted into the buffer).

If the OP wants to send outstanding data, but doesn't want to wait for
EOF from the sender, the solution is to use SO_LINGER with a long
timeout and shutdown(SHUT_WR). The shutdown() won't return until the
FIN (and everything before it) has been ACK'd. At that point, he can
just close() the socket; presumably it won't matter if subsequent data
results in a RST (if it does matter, there is no alternative to
reading until EOF).

-- 
Glynn Clements <glynn@gclements.plus.com>
