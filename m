From: wwp <subscript@free.fr>
Subject: Re: bitfield array
Date: Mon, 12 Jan 2004 11:29:26 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040112112926.4e5794e3@tethys>
References: <20040112111016.000072cf.cialdi@firenze.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040112111016.000072cf.cialdi@firenze.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi Massimiliano Cialdi,


On Mon, 12 Jan 2004 11:10:16 +0100 Massimiliano Cialdi <cialdi@firenze.net> wrote:

> Is it possible to declare a bitfield array?
> I tried with
> 
> typedef struct
> {
>   u8_t busy[10]:1;
> }dummy;
> 
> but I obtain an error:
> error: bit-field `busy' has invalid type
> 
> I also tried with
> 
> typedef struct
> {
>   u8_t busy:1;
> }dummy;
> dummy a[10];
> 
> but then a is as large as 10 bytes.

AFAIK, bitfields are stored in memory block which can only be allocated with
1-byte minimum.. Try to allocate 1 bit in memory, sounds not possible :-).

IOW, if you use a 1-bit bitfield, it will still be require an amount of memory
counted in bytes. That's partly why bitfields are not so used for
optimization, 'cause following the compiler you don't gaim memory space not
cpu time.

My 2cts.


Regards,

-- 
wwp
