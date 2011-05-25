From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Hi, Needs suggestions for finding and fixing stack/memory
 corruption when calling a function
Date: Wed, 25 May 2011 12:07:14 +0100
Message-ID: <19932.58082.606261.491269@cerise.gclements.plus.com>
References: <BANLkTingN-61wOzWKk7iwxFgo0W2YAzUQQ@mail.gmail.com>
	<BANLkTimdU05oVtTdOr7TXdrUvc2NJ7KVyQ@mail.gmail.com>
	<BANLkTimx+=DxYCCqtSKjGWUm63jBAe+iug@mail.gmail.com>
	<BANLkTi=C7H=NK65aT4m0Mw-ecy6v2Kx44A@mail.gmail.com>
	<19931.43284.690853.95289@cerise.gclements.plus.com>
	<BANLkTik-2VQKoT20QkxN2yhfEBSyuDkjpg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <BANLkTik-2VQKoT20QkxN2yhfEBSyuDkjpg@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fawad Lateef <fawadlateef@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Fawad Lateef wrote:

> > Personally, I'd be more inclined to suspect register corruption. Are
> > you calling a library function which use a different ABI? E.g. if your
> > code is compiled for an ABI where certain registers are preserved but
> > calling a function using an ABI which doesn't preserver those
> > registers, then you'll have problems.
> 
> humm, Can you give some suggestion about how to verify this ? Using
> readelf or objdump on different libraries and executables can give
> some clue ? As we are using some pre-compiled  libraries provided by
> some stack we are using.

The files themselves may not contain sufficient information. E.g. if
someone builds a library using e.g. -mregparm=3, that isn't going to
show up in the objdump (etc) output. First, check the documentation
for the libraries; if that doesn't help, try disassembling them.

-- 
Glynn Clements <glynn@gclements.plus.com>
