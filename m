From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Hi, Needs suggestions for finding and fixing stack/memory
 corruption when calling a function
Date: Tue, 24 May 2011 13:48:20 +0100
Message-ID: <19931.43284.690853.95289@cerise.gclements.plus.com>
References: <BANLkTingN-61wOzWKk7iwxFgo0W2YAzUQQ@mail.gmail.com>
	<BANLkTimdU05oVtTdOr7TXdrUvc2NJ7KVyQ@mail.gmail.com>
	<BANLkTimx+=DxYCCqtSKjGWUm63jBAe+iug@mail.gmail.com>
	<BANLkTi=C7H=NK65aT4m0Mw-ecy6v2Kx44A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=C7H=NK65aT4m0Mw-ecy6v2Kx44A@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fawad Lateef <fawadlateef@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Fawad Lateef wrote:

> For now I added two more temporary arguments between 1st and 2nd
> arguments and the required arguments getting correct values thats
> why I am assuming that by adding temporary variables we moved the
> memory corruption from real arguments into temporary arguments. 
> After adding these arguments my function is behaving correctly so
> for now this is a work-around _but_ I want to figure-out its proper
> fix (as the same sort of issue we faced in our cgi based web-pages
> code some weeks earlier).
> 
> Hence I needs suggestion that is this really a memory corruption or
> some compiler issues ? If its a compiler issue then its not a big
> problem but if its memory corruption issue then we have to _fix_ it
> asap.

Check the assembler output ("gcc -S ...").

Personally, I'd be more inclined to suspect register corruption. Are
you calling a library function which use a different ABI? E.g. if your
code is compiled for an ABI where certain registers are preserved but
calling a function using an ABI which doesn't preserver those
registers, then you'll have problems.

-- 
Glynn Clements <glynn@gclements.plus.com>
