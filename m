From: "Mariano Moreyra" <moremari@aca.org.ar>
Subject: RE: bitfield array
Date: Mon, 12 Jan 2004 10:40:23 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <000001c3d911$a179eea0$0c81640a@aca.org.ar>
References: <20040112115643.0000382e.cialdi@firenze.net>
Reply-To: <mariano_moreyra@aca.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040112115643.0000382e.cialdi@firenze.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Massimiliano Cialdi' <cialdi@firenze.net>, 'linux-c-programming' <linux-c-programming@vger.kernel.org>
Cc: 'wwp' <subscript@free.fr>

Maybe you should use a 2-byte variable, and access each bit with a mask.
In this case, if you only need 10 one bit flags, there will be 6 unused
bits, but you may use those bits with future flags...
Anyway...you will be using only 2 bytes...and not 10 bytes... you still gain
some memory.


-----Mensaje original-----
De: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org]En nombre de
Massimiliano Cialdi
Enviado el: Lunes, 12 de Enero de 2004 07:57
Para: linux-c-programming
CC: wwp
Asunto: Re: bitfield array


On Mon, 12 Jan 2004 11:29:26 +0100
wwp <subscript@free.fr> wrote:

> AFAIK, bitfields are stored in memory block which can only be
> allocated with 1-byte minimum.. Try to allocate 1 bit in memory,
> sounds not possible :-).
I know but I don't want to allocate a single bit. Since I need an array
of binary flag, I thought that the compiler could help me. 10 bits could
be placed in 2 bytes. Else I need 10 bytes (80% of space lost).

> IOW, if you use a 1-bit bitfield, it will still be require an amount
> of memory counted in bytes. That's partly why bitfields are not so
> used for optimization, 'cause following the compiler you don't gaim
> memory space not cpu time.
I work with a (very) limited memory embedded system. I need to save
memory, no matter in cpu time.

thanks

--
Massimiliano Cialdi
cialdi@firenze.net
m.cialdi@oksys.it
-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

