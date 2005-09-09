From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: default function parameters
Date: Fri, 9 Sep 2005 13:50:50 +0100
Message-ID: <17185.34090.653681.903413@cerise.gclements.plus.com>
References: <dfr8v1$kn7$1@sea.gmane.org>
	<6a00c8d505090823472706ba98@mail.gmail.com>
	<dfrc52$rro$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <dfrc52$rro$1@sea.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: _z33 <timid.Gentoo@gmail.com>
Cc: linux-c-programming@vger.kernel.org


_z33 wrote:

>    I'm clear... but, now wondering why for two days a guy from an R&D 
> dept of an MNC is arguing with me, saying that a function with empty 
> argument specification implies having implicit "int" type arguments. 
> (similar to the implicit assumption of return type of functions to "int" 
> when none is specified explicitly).

If you call a function for which a prototype is in scope, the
arguments will be coerced to the specified types. E.g. if you have:

	void foo(float x) { ... }

	...

	foo(1.0);

k will be passed as a float (even though the literal has type double).

OTOH, if the function was declared without its argument list, the
arguments will be converted using the K&R default conversions, i.e. 
char and short are converted to int, float is converted to double, and
other types are passed without conversions.

Similarly, if a function has a variadic protoype (e.g. the printf()
family), the variadic arguments (those accounted for by the ellipsis)
are subject to the default conversions.

-- 
Glynn Clements <glynn@gclements.plus.com>
