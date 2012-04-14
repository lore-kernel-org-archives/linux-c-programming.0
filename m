From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: close socket and TCP RST
Date: Sat, 14 Apr 2012 17:13:20 +0100
Message-ID: <20361.41504.306777.154694@cerise.gclements.plus.com>
References: <CAJR2zJ9EQ5D-0U_6Yrzmv5nJkv7BBhiOuGLXcgF=c-K7qxsO5Q@mail.gmail.com>
	<20357.34865.112925.808959@cerise.gclements.plus.com>
	<CAJR2zJ8rYPjR_+Nw_NSBBZgmKr95ekX0mt093aq89Bs59p8oYA@mail.gmail.com>
	<20359.54917.165693.172256@cerise.gclements.plus.com>
	<CAJR2zJ-Rw+nU4CjearErxwVWwDDXrkv_zf34YaSPfnMjF+u7yw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <CAJR2zJ-Rw+nU4CjearErxwVWwDDXrkv_zf34YaSPfnMjF+u7yw@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Celelibi <celelibi@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Celelibi wrote:

> > Sending outstanding data then sending the RST afterwards is
> > potentially problematic as the receiver may not be able or willing to
> > read the data until its own data has been ACK'd, which would result in
> > deadlock.
> 
> Could you tell me more about that?
> I can't see a case which would be problematic.
> Moreover shutdown(SHUT_WR) can actually send the outstanding data.

Assume that the remote end is single threaded. At any given time, it's
either reading or writing. If it's writing, it won't be reading data,
and it won't read any data until it has finished writing. If the
reader doesn't consume the data (in the sense of ACK'ing it), the
writer's send buffer will fill, and the writer will block waiting for
the write to complete. While it's blocked, it isn't reading any data
sent in the other direction.

IOW: sending a RST doesn't require the cooperation of the remote end,
sending data does.

> > If the server sends a response to the quit command, the client should
> > read the response then close() the socket. Provided that the server's
> > response is well-formed, there shouldn't be a problem.
> 
> The client is ok. As soon as it receive "Ok, I quit" from the server,
> it close the connection. Although the server should also work with
> basic clients like netcat or telnet, which won't close the connection
> by themselves. Then the server just has to send its last message and
> close the connection. That's the protocol we expect:
> The server read the command "QUIT;", send its last message saying it's
> going to close the connection, and close the connection. The client is
> quite passive in the termination process, it read the response to the
> "QUIT;" and wait for the connection to be closed (its read should
> return -1).
> 
> The problem is on the server side. Because of the unread "\n" (after
> the "QUIT;"), "Ok, I quit" is never sent.

If you want to get by without either side performing a half-close, one
side must adhere strictly to the protocol, the other side must perform
the initial close.

If neither side can be relied upon to follow protocol exactly, you
must use a half-close (as mentioned previously, rsh works like this as
there isn't any "protocol" to follow; it's just free-form text in each
direction).

> BTW, now I understand better what happen and why it happen, don't you
> think this behavior should be documented somewhere? Should I report a
> bug for the man 7 tcp?

I wouldn't say it's a "bug" in the documentation. A manual page isn't
really the place for a high-level overview of the TCP protocol. And
the behaviour in question isn't related to a specific system call. 
close() isn't specific to sockets, shutdown() isn't specific to TCP
sockets, and the same issue arises if the socket is closed implicitly
as a result of process termination.

What it really boils down to is that "receiving" data on a TCP socket
which has been closed for reading will result in a RST; that much is
in the RFCs, I believe. The practical consequence of that fact at the
application layer is more appropriate in a tutorial or article.

-- 
Glynn Clements <glynn@gclements.plus.com>
