From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Type conversion
Date: Fri, 28 Jun 2002 10:54:43 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15644.12899.635930.540711@cerise.nosuchdomain.co.uk>
References: <20020628054419Z317059-685+171@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020628054419Z317059-685+171@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: adam@luchjenbroers.com
Cc: linux-c-programming@vger.kernel.org


Adam Luchjenbroers wrote:

> What are the C/C++ functions for converting between variable types. 
> 
> ATM I need to be able to convert a long to an int. But I thought it would be 
> good to find out about the others while I'm here.

Conversion between numeric types is handled by "casts" (which are a
language feature) rather than explicit functions, i.e.

	int i;
	long l;
	...
	i = (int) l;

If you weren't aware of type casts, you probably need to get a book on
C.

You can't realistically learn a language from a combination of
trial-and-error and asking questions on mailing lists. Primarily
because, for many of the things which you need to learn, you won't
realise that you need to learn them until you've learnt them.

-- 
Glynn Clements <glynn.clements@virgin.net>
