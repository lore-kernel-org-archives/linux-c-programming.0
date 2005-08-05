From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Any pointer to Byte Alignment & Structure Padding?
Date: Fri, 5 Aug 2005 12:19:49 +0100
Message-ID: <17139.19285.978591.275528@cerise.gclements.plus.com>
References: <014001c5968e$4e30ca70$9900a8c0@ispl091>
	<6eee1c40508010514517b5b90@mail.gmail.com>
	<6eee1c405080105164cfbbaaa@mail.gmail.com>
	<673ac06405080402432d0feda3@mail.gmail.com>
	<6eee1c40508040823165f1df7@mail.gmail.com>
	<00c001c59974$32b0c9b0$9900a8c0@ispl091>
	<6a00c8d50508042332245283db@mail.gmail.com>
	<013901c59989$ed3d6440$9900a8c0@ispl091>
	<6a00c8d505080500092364df97@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d505080500092364df97@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Graegert <graegerts@gmail.com>
Cc: Amit Dang <amit_dang@intersolutions.stpn.soft.net>, linux-c-programming <linux-c-programming@vger.kernel.org>


Steve Graegert wrote:

> >    Thanks for your prompt response and the valuable information. But I
> > tried following on Linux 32-bit gcc 2.96
> > struct temp {
> >    long long i;
> >    char c;
> > } and sizeof(struct temp) gave 12 not 16.
> 
> Hmm, I have no access to a 32-bit machine right now, but I am running
> GCC 3.4.2 on SPARC and sizeof(temp) gives 16 as expected.

long long is likely to be 8-byte aligned on 64-bit systems and 4-byte
aligned on 32-bit systems.

> One thing a could think of is that on 32-bit machines it makes no
> sense to pad to 16 bytes since the natural word size (size of internal
> registers) is 4 bytes resulting in an unnecessary read operation to
> fetch the rest of the structure that is useless anyway.

Aligment is determined by the granularity of RAM access. E.g. 32-bit
systems tend to have RAM organised as 32-bit words; reading a 32-bit
value which issn't aligned requires reading two adjacent words,
shifting and OR-ing them together to obtain the desired value.

Some architectures (e.g. x86) can do unaligned access at the CPU
level, in which case unaligned access is merely a performance hit. 
Other architectures (e.g. most RISC CPUs) can't; if you try to
read/write an unaligned address, the CPU generates an exception. In
this case, if you want to perform an unaligned access, you have to do
it in software.

-- 
Glynn Clements <glynn@gclements.plus.com>
