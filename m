From: "Rivalino M. Jr." <rmj@icablenet.com.br>
Subject: Re: Is it possible to trace back from where a user comes
Date: Tue, 4 Nov 2003 11:19:40 -0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <00ab01c3a2d6$52d41e40$0201a8c0@bigip>
References: <5.2.1.1.0.20031029004509.0194e350@no.incoming.mail>
Reply-To: "Rivalino M. Jr." <rmj@icablenet.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Holger Kiehl <Holger.Kiehl@dwd.de>, Jeff Woods <kazrak+kernel@cesmail.net>
Cc: linux-c-programming@vger.kernel.org

If your program is based on TCP/IP, I think you could use something like
tcpd. You could make yourself "tcpd", a kind of wrapper that will receive
the connection and log the source IP before spawn the target service.

----- Original Message ----- 
From: "Jeff Woods" <kazrak+kernel@cesmail.net>
To: "Holger Kiehl" <Holger.Kiehl@dwd.de>
Cc: <linux-c-programming@vger.kernel.org>
Sent: Wednesday, October 29, 2003 6:50 AM
Subject: Re: Is it possible to trace back from where a user comes


> At 10/29/2003 08:29 AM +0000, Holger Kiehl wrote:
> >I have written a small program that allows a user to do some
> >configuration. Now everytime the user does configure something it gets
> >logged to a log file. Usually when someone comes from a remote machine I
> >took the environment variable DISPLAY and if that is not there the output
> >from "who am i", to determine from where the user comes. However this
does
> >not work reliably since DISPLAY is set to localhost when the user is
using
> >ssh, also "who am i" does not always tell me from where a user comes.
> >Another problem is when the user first logs in on say host1 then to host2
> >and then to host3. Is there a way to determine that the user comes from
> >host1? The SSH_CLIENT environment variable is always set to the last
host,
> >so this can not be used. SSH_CONNECTION is not set so this can also not
be
> >used. I also looked at struct utmp it to does not provide the
information,
> >it is also not very portable since the structure differs a lot from
system
> >to system.
> >
> >So is there a way to determine from where a user comes?
>
> In short, no.
>
> The practical answer to what I think you want is "authentication".  That
> authentication can come from a variety of mechanisms (e.g. password,
> Kerberos token, client certificate, smart card, etc.) but they all boil
> down to some form of userid and password (i.e., a shared secret).
>
> --
> Jeff Woods <kazrak+kernel@cesmail.net>
> "Errors creep into everything, and the only way to expunge them is to have
> any bit of work reviewed by a few others." -- Wirt Atmar, 10-27-2001
> "The great thing about Open Source software is that you can have any color
> screen of death that you want." -- Gavin Scott, 08-22-2000
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


