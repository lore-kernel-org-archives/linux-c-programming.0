From: Celelibi <celelibi@gmail.com>
Subject: Re: close socket and TCP RST
Date: Fri, 13 Apr 2012 03:54:03 +0200
Message-ID: <CAJR2zJ-v15Y_S5BoZ+QYb5_+R24_66aJ2T4pZ8zi0SDYOEmSLg@mail.gmail.com>
References: <CAJR2zJ9EQ5D-0U_6Yrzmv5nJkv7BBhiOuGLXcgF=c-K7qxsO5Q@mail.gmail.com>
	<20357.34865.112925.808959@cerise.gclements.plus.com>
	<5706767.2IZuFMGXdL@desktop>
	<20358.5213.624894.840711@cerise.gclements.plus.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=hVtc54VdyIFBLzY4M1/9DtWH77+u5nKe5/YNMOtaYYo=;
        b=vD4gRTEljngxOPMjiBPdERqbwYxEw71B3U0cVJ3+QHGX03cpP4acccUblTTgtMI3jO
         rkgFH92/eJWiPX/FxtuXqte5x3C2zEgAh8BUuf8t23DOehNK+0nUwlARCeBgCiE/ISsL
         NWkUTXXEJl9Xux/zSbW8TWOh1HIeXyE1f2oMSLrEhLy8nDgQW3PtAiCQdzcr6paf0h6R
         eimkCMcLFiMaj8WltHXWwiaju3Jez6S2PUPJwgErA3fVLUIgE+rdXCyNtKCrxpV8nclY
         dFhhhXR6X1xSw9EiK/LsTkbE+3SmRbsSx75n8AC+v1NcNx7tlIVzcXoo732cdUYuFlnv
         mQIg==
In-Reply-To: <20358.5213.624894.840711@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn@gclements.plus.com>
Cc: Bogdan Cristea <cristeab@gmail.com>, linux-c-programming@vger.kernel.org

2012/4/12, Glynn Clements <glynn@gclements.plus.com>:
> IIUC, he close()s a socket which has unread data. Whether the data had
> already been received when close() was called or whether it arrived
> afterwards doesn't matter.

Right.

>
> Normal behaviour is simply not to use close() or shutdown(SHUT_RD) if
> you expect to receive more data, e.g. wait until you have seen EOF
> (i.e. read(), recv() etc return a zero count) before closing the read
> side of the socket.

I don't care about these data. I don't want to read them. If there are
too much data after the client sent a QUIT command, it have to receive
a RST.

> AFAIK, there is no way to make close() or shutdown(SHUT_RD) silently
> discard subsequent inbound data.

And that's ok because that's not what I want. :)

> Alternatives include:
>
> 1. ACK and discard the data. But then there would be no way for the
> sender to identify that it's writing to a closed socket.

Right.

>
> 2. Do nothing. The receive buffer will fill, the window will close,
> and the sender will block until someone kills it (it won't time out
> because probes will still be met with an ACK of the last byte which
> fitted into the buffer).
>
> If the OP wants to send outstanding data, but doesn't want to wait for
> EOF from the sender, the solution is to use SO_LINGER with a long
> timeout and shutdown(SHUT_WR). The shutdown() won't return until the
> FIN (and everything before it) has been ACK'd. At that point, he can
> just close() the socket; presumably it won't matter if subsequent data
> results in a RST (if it does matter, there is no alternative to
> reading until EOF).
>

Actually, shutdown(SHUT_RDWR) do the trick since shutdown(SHUT_WR)
forces the unsent data to be actually sent with a FIN flag.
And since shutdown(SHUT_RDWR) send the outstanding data, why don't
close() do the same? I don't get it.

And of course, calling close() after shutdown() send a RST because of
the unread data.


Celelibi
