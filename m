From: Celelibi <celelibi@gmail.com>
Subject: Re: close socket and TCP RST
Date: Fri, 13 Apr 2012 03:37:04 +0200
Message-ID: <CAJR2zJ8rYPjR_+Nw_NSBBZgmKr95ekX0mt093aq89Bs59p8oYA@mail.gmail.com>
References: <CAJR2zJ9EQ5D-0U_6Yrzmv5nJkv7BBhiOuGLXcgF=c-K7qxsO5Q@mail.gmail.com>
	<20357.34865.112925.808959@cerise.gclements.plus.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=WK8G97hi0MiwI318Uasp2beNpe2CIY7AYZe+cXMlSgs=;
        b=mte4XJqxEOg75zieThlvAbS9s5lKo4JVcMcQvqzhDHjGVD+83UqNOxpZffn9mrgHYB
         ozkbD7M5QZ5VKU7PgsxL4N9NgodXlyvpVOu2WPdC/ynGap3xj5H2ZY+qxR+X3I5IH98F
         rfT+jUhCRdLCmcJN/2vTbP657xcM0K8csGgGw109V88tR6I0lcSn+zdVdMMB+ZYExM7+
         gyLF8Cx9RgVog7YDxR2vJcOKE4asJFC+e4EKrdj1zcSm2/BGyhg4sjfWMQ0mlqEwvlCA
         5hQJLxTIPqlDxekAhc8BPvOoadr0c6NvYFxiWrdLpf2u5UFe/PvbEvPFyxYcI8J9V2cG
         38gg==
In-Reply-To: <20357.34865.112925.808959@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

2012/4/11, Glynn Clements <glynn@gclements.plus.com>:
>
> Celelibi wrote:
>
>> Summary for lazy people ^^: calling close(2) on a socket with a
>> non-empty receive kernel-buffer cause the connection to be ReSeT and
>> the send buffer discarded and not sent.
>
> Yes; this is all as it should be.
>
>> 1) Is this a standard behavior?
>
> Yes.
>
>> Doesn't the RFC state that every pending data is sent when the
>> connection is closed?
>
> The RFCs describe the TCP protocol, not the sockets API.
>

I agree with that. But I didn't find any information about the
berkeley socket API standard.
Then, I assume that the close() syscall close the file descriptor and
close the socket (both ways) if it was the last file descriptor for
that socket.

However, when I look at the TCP's RFC 793 (a.k.a STD7):
http://www.rfc-editor.org/rfc/std/std7.txt
Section 3.5 "Closing a Connection" says:
"A TCP will reliably deliver all buffers SENT before the connection was CLOSED"

And RFC 1122 ("host requirement"): http://www.rfc-editor.org/rfc/rfc1122.txt
Section 4.2.2.13 "Closing a Connection" says:
"If such a host issues a CLOSE call while received data is still
pending in TCP, or if new data is received after CLOSE is called, its
TCP SHOULD send a RST to show that data was lost."

IMO both are not incompatible and should be done. But I may have
missed something somewhere.


>> 2) Shouldn't that behavior be documented somewhere? I didn't found any
>> information about that anywhere. I looked at the man close(2),
>> shutdown(2), socket(7), tcp(7).
>>
>> >From this I deduce that shutdown must be called everytime we want to
>> close a socket. But this is not taught anywhere. :p
>
> In many cases, shutdown() is not necessary. Normally, one side knows
> whether the other side will send more data. E.g. for (non-pipelined)
> HTTP, the client sends a request, the server sends a response, then
> closes the connection. At that point, the client sees EOF then
> close()s the socket (or it could just close the socket once the amount
> of data specified by the Content-Length header has been received).

My point is that if the client send one byte more than needed in its
request (like ending the HTTP request with 3 "\n" instead of 2), the
client will never receive the last bytes of the server's response. But
this makes more sens with the a request-response protocol as I will
explain just below.

>
> With a request-response protocol, either the requestor sends a "quit"
> command resulting in the responder closing the connection, or the
> requestor will just close the connection instead of issuing a request.
> In the latter case, it will either perform a half-close or just wait
> until any outstanding response has been received and perform a
> full-close.

Well, this is close to the original protocol. It was a kind of SQL
server. Every command is terminated by a semi-colon while every "\n"
are treated as spaces.

The client send "QUIT;\n", the server read 'Q', 'U', 'I', 'T', ';',
process "QUIT", send to the client Something that say "Ok, I quit" and
close() the connection.
However, a "\n" is still in the receive buffer of the server! That
makes the server RST the connection ASAP and discard the messages that
were not sent yet... Namely the "Ok, I quit" message which was delayed
because of Nagle's algorithm or whatever.
Annoying isn't it?

I totally agree with the RST. If the client send "QUIT;\nSELECT 42;\n"
a RST have to be sent.
I just disagree with the fact that the last messages that were sent
before the close() are not sent at all despite the success of the
send() calls.

> Once it has sent a RST, it cannot send any additional data. Doing so
> would just result in the receiver discarding the data and sending a
> RST, so there's no point.

That's right. I want to send the data *before* the RST is sent since I
called send() *before* close().

>
> If you want the other end to see EOF while your end still receives
> data, use shutdown(fd, SHUT_WR) to perform a half-close. This sends a
> FIN and effectively makes the descriptor read-only.

I don't care about the remaining data, and don't want to read it.


Celelibi
