From: "James Stevenson" <mistral@stev.org>
Subject: Re: Misc C question
Date: Thu, 20 Jun 2002 22:53:32 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <002d01c218a4$ecb20cb0$0501a8c0@Stev.org>
References: <Pine.GSO.4.33.0206201540260.13436-100000@servidor.unam.mx>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: GOMEZ NOGUERA DAVIDEDUARDO <davidgn@servidor.unam.mx>, Glynn Clements <glynn.clements@virgin.net>
Cc: xmp <xmp@multipasto.net.co>, linux-c-programming@vger.kernel.org

Hi

thats because you can check for it.
it disappears and sombody creates a symlink to somewhere like /etc/passwd :)

you need to check it open it and check it again on the open fd

----- Original Message -----
From: "GOMEZ NOGUERA DAVIDEDUARDO" <davidgn@servidor.unam.mx>
To: "Glynn Clements" <glynn.clements@virgin.net>
Cc: "xmp" <xmp@multipasto.net.co>; <linux-c-programming@vger.kernel.org>
Sent: Thursday, June 20, 2002 9:42 PM
Subject: Re: Misc C question


> hello.
> sorry if the message gets duplicated.
>
> I read a while ago of some security issues on doing checks on files before
> opening, wich is harmfull if the program is suid.
>
> But i dont remember what to do about it.
> can someone refresh it to me?
> is there anyway you can lock a file access and tell the kernel? and what
> would happen if the program crashes without unlocking the file?
>
> bye bye
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


