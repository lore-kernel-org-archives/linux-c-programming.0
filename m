From: Luiz Fernando Capitulino <lcapitulino@conectiva.com.br>
Subject: Re: ternary operator
Date: Tue, 28 Jun 2005 14:15:34 -0300
Message-ID: <42C185B6.4020005@conectiva.com.br>
References: <6eee1c405062810224f4db7e5@mail.gmail.com> <6a00c8d50506281049335e427d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50506281049335e427d@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Steve Graegert <graegerts@gmail.com>
Cc: Vadiraj <vadiraj.cs@gmail.com>, linux-c-programming <linux-c-programming@vger.kernel.org>

Steve Graegert wrote:

> Just take a look at our discussion about implicit return values on
> int- and void-valued functions a week or two ago.  If no return value
> is given explicitly it is undefined and in most cases not zero,
> therfore not yielding false.  It's chosen randomly.

Yes, but note that this happens because the default return value
for functions is 'int'. So, if you change func2()'s prototype to
return 'void', the compiler will give you a warning.

PS: This is not the case for the arguments, in that case func2() it's
able to accept anything (IIRC).

-- 
Luiz Fernando N. Capitulino
