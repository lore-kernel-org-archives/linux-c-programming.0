From: Massimiliano Cialdi <cialdi@firenze.net>
Subject: Re: bitfield array
Date: Mon, 12 Jan 2004 11:56:43 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040112115643.0000382e.cialdi@firenze.net>
References: <20040112111016.000072cf.cialdi@firenze.net>
	<20040112112926.4e5794e3@tethys>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040112112926.4e5794e3@tethys>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming <linux-c-programming@vger.kernel.org>
Cc: wwp <subscript@free.fr>

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
