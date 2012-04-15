From: Celelibi <celelibi@gmail.com>
Subject: Re: close socket and TCP RST
Date: Sun, 15 Apr 2012 02:41:14 +0200
Message-ID: <CAJR2zJ9pbXXdbXAcbQLa+rjutrzphe9UOYndJkooXK+SRZi9fg@mail.gmail.com>
References: <CAJR2zJ9EQ5D-0U_6Yrzmv5nJkv7BBhiOuGLXcgF=c-K7qxsO5Q@mail.gmail.com>
	<20357.34865.112925.808959@cerise.gclements.plus.com>
	<CAJR2zJ8rYPjR_+Nw_NSBBZgmKr95ekX0mt093aq89Bs59p8oYA@mail.gmail.com>
	<20359.54917.165693.172256@cerise.gclements.plus.com>
	<CAJR2zJ-Rw+nU4CjearErxwVWwDDXrkv_zf34YaSPfnMjF+u7yw@mail.gmail.com>
	<20361.41504.306777.154694@cerise.gclements.plus.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=c64VKgnUwey2X7BUMySmJUhittURZoCgS+ZADTTVgLs=;
        b=xjHLsVIEtGHE1mjtd4CSzZRRKdjMSBa8wDSuY01sEAeiLlctVr5azTPQlHw/UXpQVX
         GC5pf3AASYRmgdgKYIgGvM7+1kxm+PTqQm389seW5OTfINKH6kDUlDp/iGACZLkLYqLQ
         KmbMXsGfUUCKJ8oYAfD3aQ5pCZkLE7vrKHImV7NnAecvX1ZIMA8x0Xu1QyEKR0aqDVun
         JHZ8WpxWFP305f3FYfigObbsbKHRRUVNeZHLgqM8L7YGZHE2skQaP9oZNr8fXuWQZc5j
         dgMOwb/p0R0Jv9DG1IgqPS7CAwOYiPmFFn8AzMfPK1qIEVtY+VKcIdHr/beRLFZPxEaL
         aeiA==
In-Reply-To: <20361.41504.306777.154694@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

2012/4/14, Glynn Clements <glynn@gclements.plus.com>:
>
> Celelibi wrote:
>
>> > Sending outstanding data then sending the RST afterwards is
>> > potentially problematic as the receiver may not be able or willing to
>> > read the data until its own data has been ACK'd, which would result in
>> > deadlock.
>>
>> Could you tell me more about that?
>> I can't see a case which would be problematic.
>> Moreover shutdown(SHUT_WR) can actually send the outstanding data.
>
> Assume that the remote end is single threaded. At any given time, it's
> either reading or writing. If it's writing, it won't be reading data,
> and it won't read any data until it has finished writing. If the
> reader doesn't consume the data (in the sense of ACK'ing it), the
> writer's send buffer will fill, and the writer will block waiting for
> the write to complete. While it's blocked, it isn't reading any data
> sent in the other direction.
>
> IOW: sending a RST doesn't require the cooperation of the remote end,
> sending data does.
>

I can't see why it is important that the remote end is single threaded or not.
The data are ACK'd as soon as the kernel get them. There's nothing to
do at the application level.

Your explanation sounds a bit confusing to me. Let's see if I understood.

The remote kernel won't try to send the data over the network if the
window size has reached 0, but it can still receive data as long as
its own receive window has not reached 0.
That means, if the remote application is brusting with send(), it will
fill the server's receive window (since the server do not want to read
any data after a "QUIT;"), then it will fill it's own outgoing buffer
and then the send()/write() will become blocking.
And if, unfortunately, the first command from the send() burst
generated a lot of data send by the server to the client, the client's
receive window may be 0 too and server's kernel ougoing buffer may be
full too. And here is the deadlock.

But actually this kind of deadlock car occur everytime (and is quite
common when dealing with pipes).

But, well, I admit that a RST means here "protocol error" and should
imply a whole session rollback if possible.
And trying to send more data before the RST when the current remote
window size is 0 would either delay the RST (which would not be RFC
compliant) or "break the window".
But this is quite a corner case.
It may send together with the RST as much data as the window permit
and do not expect any ACK (as the connection has been reset).


> If you want to get by without either side performing a half-close, one
> side must adhere strictly to the protocol, the other side must perform
> the initial close.
>
> If neither side can be relied upon to follow protocol exactly, you
> must use a half-close (as mentioned previously, rsh works like this as
> there isn't any "protocol" to follow; it's just free-form text in each
> direction).
>

Ok, I understand that my protocol wasn't strict enough on the exact
amount of data to be sent. I mean, the existence of that trailing \n
should be specified.
Ok, let's say that the protocol say that the "QUIT;" can be followed
by one "\n". Even in that case, I'm forced to use a half-close
connection?


>> BTW, now I understand better what happen and why it happen, don't you
>> think this behavior should be documented somewhere? Should I report a
>> bug for the man 7 tcp?
>
> I wouldn't say it's a "bug" in the documentation. A manual page isn't
> really the place for a high-level overview of the TCP protocol. And
> the behaviour in question isn't related to a specific system call.
> close() isn't specific to sockets, shutdown() isn't specific to TCP
> sockets, and the same issue arises if the socket is closed implicitly
> as a result of process termination.

Actually, the section 7 contains (among other things) some high level
overviews of some parts of the system. The section 2 is meant for
system call documentation. The "man 7 socket" and "man 7 tcp" already
contains a lot of interesting stuff.

>
> What it really boils down to is that "receiving" data on a TCP socket
> which has been closed for reading will result in a RST; that much is
> in the RFCs, I believe. The practical consequence of that fact at the
> application layer is more appropriate in a tutorial or article.

The fact that outstanding data is discarded too is quite surprising
(even if it can makes sens after all). And still looks to me more like
an implementation choice than a real consequence of a RFC.


Celelibi
