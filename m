From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: default function parameters
Date: Fri, 9 Sep 2005 13:43:58 +0100
Message-ID: <17185.33678.421304.142260@cerise.gclements.plus.com>
References: <dfr8v1$kn7$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <dfr8v1$kn7$1@sea.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: _z33 <timid.Gentoo@gmail.com>
Cc: linux-c-programming@vger.kernel.org


_z33 wrote:

>    I had a wierd doubt today morning. If a function's return type is not 
> defined, "C" takes it as returning "int". Now, what does it do when I 
> don't specify the arguments of the function. Something like this -
> 
>    void sampleFunc ()
>    {
> 	/* ... */
>    }
> 
>    Is this equivalent to saying,
> 
>    void sampleFunc (void)
>    {
> 	/* ... */
>    }

The former declares a function taking unspecified arguments, while the
latter declares a function taking no arguments.

You can pass arguments to the former (although it can't use them), but
you will get an error if you try to pass arguments to the latter.

Nowadays, the main use of the former is for declaring a variable or
field which can hold a pointer to arbitrary functions, e.g.

	int (*foo)();

declares a variable which can hold a pointer to any function which
returns int, regardless of its argument types.

-- 
Glynn Clements <glynn@gclements.plus.com>
