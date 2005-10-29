From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Pointers to int
Date: Sat, 29 Oct 2005 16:44:52 +0100
Message-ID: <17251.39156.520358.678685@cerise.gclements.plus.com>
References: <4362255E.90303@racsa.co.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4362255E.90303@racsa.co.cr>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabio Andres Miranda <fabiomiranda@racsa.co.cr>
Cc: linux-c-programming@vger.kernel.org


Fabio Andres Miranda wrote:

> Can anyone explain to the list how this pointers to int work:
>     int *p;
>     p = (int *)(array);
>     for (i = 0; i < arraysize - 1; i += 4)
>         *p++ = j - 8;
>     *p = 0x0;
> 
> P is defined as a pointer to a int. Then, it points to (the beginning ? 
> ) a char array.

When used as an expression, an array variable evaluates to a pointer
to its first element.

> What is the result of perform the instruction: *p++; ?

The expression "*p++ = j - 8" will store j-8 in the (int) location
referenced by p, then increment p so it points to the next location
(i.e. increments the address by sizeof(int)).

> First, what is it? It adds 1 to what?

It evaluates to the p, incrementing p as a side-effect.

It "adds 1" to p in the sense that p will point to the next int.
Adding a value to a pointer scales the value by the size of the type
being pointed to, e.g. if p has type "pointer to T" for some type T,
then the expression:

	p + n

is equivalent to:

	(T*)((char*)p + n * sizeof(T))

-- 
Glynn Clements <glynn@gclements.plus.com>
