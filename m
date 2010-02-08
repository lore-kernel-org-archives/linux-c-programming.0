From: =?utf-8?B?TWljaGHFgiBOYXphcmV3aWN6?= <m.nazarewicz@samsung.com>
Subject: Re: How to use CRC32 of SSE 4.2 on i3/5/7?
Date: Mon, 08 Feb 2010 13:15:04 +0100
Message-ID: <op.u7s5nenr7p4s8u@pikus>
References: <alpine.LRH.2.00.1002081130110.11287@praktifix.dwd.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <alpine.LRH.2.00.1002081130110.11287@praktifix.dwd.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed	delsp=yes"
To: Holger Kiehl <Holger.Kiehl@dwd.de>, linux-c-programming@vger.kernel.org

On Mon, 08 Feb 2010 12:41:04 +0100, Holger Kiehl <Holger.Kiehl@dwd.de> =
wrote:
> In my application I use a lot of crc32 checksum calculation in a litt=
le
> C function. I now have access to a system with an i7 which does have
> crc32 as an instruction. How can I make use of this instruction in
> my program? Most likely one can do this directly via assembler code, =
but
> is there support for this via libc?

This is doubtful however you might try using OpenSSL or similar library
(IIRC it has CRC32 function implemented) and hope it has optimization
for architecture you are running which may or may not be the case
depending on how it has been compiled.

This is probably the most portable way (as portable as the library) of
achieving optimized CRC32 calculation meaning that you may get differen=
t
optimizations on different architectures depending and you won't have
to worry about it but at the same time you may end up with generic code=
=2E

If you don't care about portability that much and simply won't to have
fast function on your machine I'd say your best bet is using (inline)
assembly (if you're using GCC google for "GCC inline assembly" or look
through GCC's info pages).

--=20
Best regards,                                           _     _
  .o. | Liege of Serenely Enlightened Majesty of       o' \,=3D./ `o
  ..o | Computer Science,  Micha=C5=82 "mina86" Nazarewicz     (o o)
  ooo +---[mina86@mina86.com]---[mina86@jabber.org]---ooO--(_)--Ooo--
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
