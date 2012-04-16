From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: close socket and TCP RST
Date: Mon, 16 Apr 2012 21:43:47 +0100
Message-ID: <20364.33923.402871.136736@cerise.gclements.plus.com>
References: <CAJR2zJ9EQ5D-0U_6Yrzmv5nJkv7BBhiOuGLXcgF=c-K7qxsO5Q@mail.gmail.com>
	<20357.34865.112925.808959@cerise.gclements.plus.com>
	<CAJR2zJ8rYPjR_+Nw_NSBBZgmKr95ekX0mt093aq89Bs59p8oYA@mail.gmail.com>
	<20359.54917.165693.172256@cerise.gclements.plus.com>
	<CAJR2zJ-Rw+nU4CjearErxwVWwDDXrkv_zf34YaSPfnMjF+u7yw@mail.gmail.com>
	<20361.41504.306777.154694@cerise.gclements.plus.com>
	<CAJR2zJ9pbXXdbXAcbQLa+rjutrzphe9UOYndJkooXK+SRZi9fg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <CAJR2zJ9pbXXdbXAcbQLa+rjutrzphe9UOYndJkooXK+SRZi9fg@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Celelibi <celelibi@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Celelibi wrote:

> I can't see why it is important that the remote end is single
> threaded or not.

If it's single-threaded, it won't read data until it has finished
writing.

> The data are ACK'd as soon as the kernel get them.

Only if there's space in the receive buffer. Otherwise, the kernel
will ACK the last byte which was stored and report a receive window of
zero. The sender will not attempt to send more data until the receive
window opens.

> The remote kernel won't try to send the data over the network if the
> window size has reached 0, but it can still receive data as long as
> its own receive window has not reached 0.
> That means, if the remote application is brusting with send(), it will
> fill the server's receive window (since the server do not want to read
> any data after a "QUIT;"), then it will fill it's own outgoing buffer
> and then the send()/write() will become blocking.
> And if, unfortunately, the first command from the send() burst
> generated a lot of data send by the server to the client, the client's
> receive window may be 0 too and server's kernel ougoing buffer may be
> full too. And here is the deadlock.

Yes.

> But actually this kind of deadlock car occur everytime (and is quite
> common when dealing with pipes).

In this case, the problem is that the application may have terminated,
leaving the kernel to clean up the mess. If the kernel is going to
send a RST anyhow, it's debatable whether there's any benefit in going
to significant effort to send outstanding data which the receiver may
just ignore.

> But, well, I admit that a RST means here "protocol error" and should
> imply a whole session rollback if possible.
> And trying to send more data before the RST when the current remote
> window size is 0 would either delay the RST (which would not be RFC
> compliant) or "break the window".
> But this is quite a corner case.
> It may send together with the RST as much data as the window permit
> and do not expect any ACK (as the connection has been reset).

That would require a separate path, and is essentially pointless. If
it's not going to wait for an ACK (and retransmit if necessary),
there's not much point sending the data in the first place. If a
single dropped packet means that the data is permanently lost, it may
as well just discard it and save itself some trouble.

> > If you want to get by without either side performing a half-close, one
> > side must adhere strictly to the protocol, the other side must perform
> > the initial close.
> >
> > If neither side can be relied upon to follow protocol exactly, you
> > must use a half-close (as mentioned previously, rsh works like this as
> > there isn't any "protocol" to follow; it's just free-form text in each
> > direction).
> 
> Ok, I understand that my protocol wasn't strict enough on the exact
> amount of data to be sent. I mean, the existence of that trailing \n
> should be specified.
> Ok, let's say that the protocol say that the "QUIT;" can be followed
> by one "\n". Even in that case, I'm forced to use a half-close
> connection?

If the newline is optional and the receiver performs the initial
close, then at least one side needs to perform a half-close. Either:

1. The client sends "QUIT;\n...", the server sends a response and
performs a half-close, the client reads the response and EOF and calls
close(), the server reads the EOF and calls close(). Or:

2. The client sends "QUIT;\n...", the server sends the response, the
client performs a half-close, the server reads the EOF and calls
close(), the client reads the EOF and calls close().

If the client can be relied upon to send an exact termination
sequence, then the server can call close() as soon as it has read that
sequence, and the client can call close() once it has read EOF from
the server. EOF is always a reliable terminator; nothing else will be
received after that, so calling close() won't cause a RST.

> > What it really boils down to is that "receiving" data on a TCP socket
> > which has been closed for reading will result in a RST; that much is
> > in the RFCs, I believe. The practical consequence of that fact at the
> > application layer is more appropriate in a tutorial or article.
> 
> The fact that outstanding data is discarded too is quite surprising
> (even if it can makes sens after all).

Not really. RST indicates abnormal termination. Once it has been sent,
the kernel can (almost) completely forget that the connection ever
existed. Not only will unsent data be discarded, but so will
unacknowledged sent data. Any subsequent packets will be met with
another RST as they don't correspond to a "known" connection.

> And still looks to me more like an implementation choice than a real
> consequence of a RFC.

The very existence of SHUT_RD is an implementation choice, not just
its behaviour. The TCP protocol itself necessitates a mechanism to
terminate transmission, and each direction can be terminated
independently.

While it would be possible to implement an API where close() peformed
a half-close (SHUT_WR) with no "offical" mechanism for the SHUT_RD
case, the kernel still has to deal with an application which exit()s
or crashes.

-- 
Glynn Clements <glynn@gclements.plus.com>
