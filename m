From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Division in loop
Date: Thu, 10 Sep 2009 01:46:15 +0100
Message-ID: <19112.19543.594103.477988@cerise.gclements.plus.com>
References: <34e1241d0909080740m5a3c3098xa48f275f2cf2fd3b@mail.gmail.com>
	<20090908145838.GF947@comcast.net>
	<19110.64410.498993.60369@cerise.gclements.plus.com>
	<34e1241d0909081937y5ecbd0davf7edbba9d9b201a0@mail.gmail.com>
	<34e1241d0909081939x2d20ab45t57fe3f760ae447d0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <34e1241d0909081939x2d20ab45t57fe3f760ae447d0@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Randi Botse wrote:

> void *buffer; /* buffer, will be allocated */
> ...

> =A0 =A0 =A0 =A0ret =3D read(fdp, buffer + bytes, stat.st_size - bytes=
);

Pointer arithmetic on a void* is undefined. gcc allows this as an
extension, treating void* like char*, i.e. p+i is treated as
(void*)((char*)p+i).

=46or portability, define buffer as a char*.

> =A0 =A0 =A0 =A0printf("\rcompleted: %i%%", progress); /* NO OUTPUT, U=
NTIL LOOP ENDED */
> =A0 =A0 =A0 =A0fflush(stdout);

> Then i see printf() never output the message until the loop has ended=
=2E..
> 'fdp' is a file descriptor to a local file, i send it through a seria=
l
> connection (RS232),

Try checking the return value of printf() and fflush(), and errno upon
error.

Also, what is stdout connected to? A VT? An xterm? sshd?

--=20
Glynn Clements <glynn@gclements.plus.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
