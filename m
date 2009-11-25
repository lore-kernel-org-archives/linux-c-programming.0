From: =?utf-8?B?TWljaGHFgiBOYXphcmV3aWN6?= <m.nazarewicz@samsung.com>
Subject: Re: select() timeout question
Date: Wed, 25 Nov 2009 10:43:28 +0100
Message-ID: <op.u3x2mqc07p4s8u@localhost>
References: <34e1241d0911250029g5e56e1cdxe7abfce03eb15836@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <34e1241d0911250029g5e56e1cdxe7abfce03eb15836@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed	delsp=yes"
To: Randi Botse <nightdecoder@gmail.com>, linux-c-programming@vger.kernel.org

On Wed, 25 Nov 2009 09:29:33 +0100, Randi Botse <nightdecoder@gmail.com=
> wrote:

> I'm now learning the Linux's select() system call,
>
> int select(int fd, fd_set *rset, fd_set *wset, fd_set *excepfs, struc=
t
> timeval *timeout);
>
> I want to receive notification when the given file descriptor is read=
y
> to read, I use TCP socket connection to demonstrate this, one for the
> sender and other for the receiver, with normal condition, when the
> sender sends data via write(), the select() returns and tells the
> receiver there is data to read.
>
> My question is: what happens when the receiver's select() is reaching
> its timeout while the sender sends data? Should the notification and
> it's data be lost (discarded)?

Data read from a socket is buffered somewhere in kernel (and the same
goes for any other file descriptors).  You may think of select(2) as
a way to check if there is any data ready in the buffer.  If select(2)
reaches timeout before data is written to buffer you get 0 return value
(if I recall correctly) but the buffer is still there and if the data
is written into the buffer the next select(2) will notify about it.

In fact, you can use select(2) with a zero timeout (as opposed to
giving NULL as timeout argument) to check if there is data without
waiting for any.

--=20
Best regards,                                           _     _
  .o. | Liege of Serenely Enlightened Majesty of       o' \,=3D./ `o
  ..o | Computer Science,  Micha=C5=82 "mina86" Nazarewicz     (o o)
  ooo +---<mina86@mina86.com>---<mina86@jabber.org>---ooO--(_)--Ooo--

--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
