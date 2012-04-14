From: Celelibi <celelibi@gmail.com>
Subject: Re: close socket and TCP RST
Date: Sat, 14 Apr 2012 17:37:06 +0200
Message-ID: <CAJR2zJ-Rw+nU4CjearErxwVWwDDXrkv_zf34YaSPfnMjF+u7yw@mail.gmail.com>
References: <CAJR2zJ9EQ5D-0U_6Yrzmv5nJkv7BBhiOuGLXcgF=c-K7qxsO5Q@mail.gmail.com>
	<20357.34865.112925.808959@cerise.gclements.plus.com>
	<CAJR2zJ8rYPjR_+Nw_NSBBZgmKr95ekX0mt093aq89Bs59p8oYA@mail.gmail.com>
	<20359.54917.165693.172256@cerise.gclements.plus.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=87RJMQG+LkSwxiyoPDnxH5HkIMW5y7nkcd0DkO404OY=;
        b=fVFIvocZQ5/xpAQ1JEGSQS5FKI4/E26VPYDLoa3C4vNUq9QwGoFZqUa894iVK6j5r5
         kWBtWpQF2p+/S+tuI2ExOWTiae/P65U8Gq4ml4kdJSK+gOhFj7XjxDSzkQq25vSlaF/t
         eEpyqQgtDRHy4m1Oi9Fzx3Ky+O/S9Dq8nCSr2QbKCHaiNDX71eRIj3xI2GiiEW3+BzU9
         WGd9LuaMQWaiELOvPtdw4mdaYFuMTSSvfnKNknr0Op00+1CtCOgRBLuR81sCr1fEToir
         BrQNtqv0EdmQotNRlDdcF5scLmZTQPbcU0CbiBEVIawg/DBPSJyJM60jPoDY5DnUPYjT
         1lJA==
In-Reply-To: <20359.54917.165693.172256@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

2012/4/13, Glynn Clements <glynn@gclements.plus.com>:
> Sending outstanding data then sending the RST afterwards is
> potentially problematic as the receiver may not be able or willing to
> read the data until its own data has been ACK'd, which would result in
> deadlock.

Could you tell me more about that?
I can't see a case which would be problematic.
Moreover shutdown(SHUT_WR) can actually send the outstanding data.

>> The client send "QUIT;\n", the server read 'Q', 'U', 'I', 'T', ';',
>> process "QUIT", send to the client Something that say "Ok, I quit" and
>> close() the connection.
>> However, a "\n" is still in the receive buffer of the server! That
>> makes the server RST the connection ASAP and discard the messages that
>> were not sent yet... Namely the "Ok, I quit" message which was delayed
>> because of Nagle's algorithm or whatever.
>> Annoying isn't it?
>
> If the server sends a response to the quit command, the client should
> read the response then close() the socket. Provided that the server's
> response is well-formed, there shouldn't be a problem.

The client is ok. As soon as it receive "Ok, I quit" from the server,
it close the connection. Although the server should also work with
basic clients like netcat or telnet, which won't close the connection
by themselves. Then the server just has to send its last message and
close the connection. That's the protocol we expect:
The server read the command "QUIT;", send its last message saying it's
going to close the connection, and close the connection. The client is
quite passive in the termination process, it read the response to the
"QUIT;" and wait for the connection to be closed (its read should
return -1).

The problem is on the server side. Because of the unread "\n" (after
the "QUIT;"), "Ok, I quit" is never sent.


> Alternatively, using SHUT_WR with SO_LINGER allows the sender to
> ensure that any data is sent before closing the read side, so even if
> the connection does end in a RST, sent data won't be lost.
>
> However, this may be a moot point, as a connection terminated by RST
> may result in close() indicating an error. For some protocols, that
> will cause any "transaction" to be aborted; e.g. for POP3, any
> messages marked for deletion by the DELE command should only be
> deleted if the connection is terminated normally.

That's not a problem since that was a student project. (I'm a teaching
assistant and wrote a test script for their server.) But that's still
worth noticing that the way a connection terminate can be meaningful.

BTW, now I understand better what happen and why it happen, don't you
think this behavior should be documented somewhere? Should I report a
bug for the man 7 tcp?


Celelibi
