From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: string initialization
Date: Wed, 24 Mar 2004 13:43:39 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16481.37003.37570.444399@cerise.nosuchdomain.co.uk>
References: <20040324122509.00007458.cialdi@firenze.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040324122509.00007458.cialdi@firenze.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Massimiliano Cialdi <cialdi@firenze.net>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>


Massimiliano Cialdi wrote:

> I want to initialize staticly a string like this:
> "abc\0defg\0hi\0"
> 
> if I define:
> char *str[] = {
> "abc",
> "defg",
> "hi" };
> 
> can I be sure that the 3 strings are placed consecutively? 

No.

> In this way I declase an array of strings. There is another way to avoid
> this?

	char str[] = "abc\0defg\0hi";

The C compiler will automatically add the final NUL byte.

If you also want an array of pointers to the individual substrings,
you will need to initialise it manually, e.g.:

	char str[] = "abc\0defg\0hi";
	char *ptrs[] = {&str[0], &str[4], &str[9]};

-- 
Glynn Clements <glynn.clements@virgin.net>
