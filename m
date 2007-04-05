From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: efficiency in passing a value to a function
Date: Thu, 5 Apr 2007 13:05:36 +0100
Message-ID: <17940.58896.512698.269693@cerise.gclements.plus.com>
References: <4613DCB8.8030007@gmail.com>
	<6a00c8d50704041138l278f34d2t9c97ba551f7ad5c3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50704041138l278f34d2t9c97ba551f7ad5c3@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Graegert <graegerts@gmail.com>
Cc: Shriramana Sharma <jamadagni@gmail.com>, linux-c-programming@vger.kernel.org


Steve Graegert wrote:

> > I think passing as const & would be more efficient since passing by
> > value would involve copying the value whereas passing by const & would
> > skip this step. Am I right? Or is there something else?
> 
> I have seen many programs making use const reference parameters in
> order to inform the compiler that the parameter is read-only, and
> hence should be better optimized.
> 
> Unfortunately, this intent is at odds with the C++ language
> definition. The const keyword says that the storage may not be
> modified through the given name. What it does not say is that the
> storage cannot be modified through some other name.
> 
> With the exception of variables directly declared const, which means
> you can only initialize them, const is basically ineffective a
> improving run-time performance. It does, however, catch errors in the
> programming process.

Using a const qualifier still allows the compiler to optimise the
caller. E.g. if it computes a complex expression involving a variable,
passes a pointer/reference to that variable to a function, then
subsequently uses the result of the expression, it doesn't have to
re-compute the expression if the pointer/reference has a const
qualifier.

In any case, I suspect that the OP was talking primarily about passing
references rather than values, rather than about const qualifiers
per se.

-- 
Glynn Clements <glynn@gclements.plus.com>
