From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: bitfield array
Date: Mon, 12 Jan 2004 21:06:58 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16387.3186.943352.155205@cerise.nosuchdomain.co.uk>
References: <20040112111016.000072cf.cialdi@firenze.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040112111016.000072cf.cialdi@firenze.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Massimiliano Cialdi <cialdi@firenze.net>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>


Massimiliano Cialdi wrote:

> Is it possible to declare a bitfield array?

No.

> I also tried with
> 
> typedef struct
> {
>   u8_t busy:1;
> }dummy;
> dummy a[10];
> 
> but then a is as large as 10 bytes.

Structures which contain bitfields will be padded to an integral
number of bytes.

> > AFAIK, bitfields are stored in memory block which can only be
> > allocated with 1-byte minimum.. Try to allocate 1 bit in memory,
> > sounds not possible :-).
> 
> I know but I don't want to allocate a single bit. Since I need an array
> of binary flag, I thought that the compiler could help me. 10 bits could
> be placed in 2 bytes. Else I need 10 bytes (80% of space lost).

Declare a 16-bit field and set of macros to access the individual
bits, e.g.

	typedef struct
	{
		uint16_t bits;
	} dummy;
	
	#define get_flag(s, i) (((s).bits >> (i)) & 1)
	#define set_flag(s, i) ((s).bits |= 1 << (i))
	#define clear_flag(s, i) ((s).bits &= ~(1 << (i)))

-- 
Glynn Clements <glynn.clements@virgin.net>
