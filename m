From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Disadvantage of using long long int
Date: Wed, 22 Feb 2006 20:09:27 +0100
Message-ID: <6a00c8d50602221109i40f9947do5754467e2b918c26@mail.gmail.com>
References: <200602221235.43058.techlist@pathfinder.phys.utk.edu>
	 <6a00c8d50602220954h324b36a4i2ed432ad5616c65d@mail.gmail.com>
	 <17404.45980.455312.5228@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17404.45980.455312.5228@cerise.gclements.plus.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 2/22/06, Glynn Clements <glynn@gclements.plus.com> wrote:
>
> Steve Graegert wrote:
>
> > > In terms of performance and raw speed, is there any disadvantage of using
> > > "long long int" instead of "long int", "long double" instead of "double" on
> > > 32-bit machine ? Are there any other disadvantage that I should consider?
> >
> > On 32-bit Intel machines a long long int (64 bits) is usually not the
> > same as a long int (32 bits), the same is true for double (64 bits,
> > IEEE754) and long double (96 bits, IEEE845).
>
> In C99 (ISO-IEC 9899:1999), long double is supposed to be one of the
> two ISO-IEC 60559 extended formats, which are 80 or 128 bits. On x86,
> it's usually 80 bits.

x86 ABI defines long double 12 Bytes of size (96 bits) on x86.  80
bits for precision, 12 bits is padding, totalling for 96 bits of size.
 It _can_ be put in a 128 bit container to preserve alignment.  The
compilers default to 96-bit but gcc has an option to pad out to 128bit
(-m128bit-long-double) resulting in a gain of performance with IA64
but slower speed on x86 due to software emulation.

> > BTW long long int is a GNU extension and subject to portability.
>
> long long int is part of the C99 standard.

Ok, thanks.

	\Steve
