From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Question about ULLONG_MAX
Date: Mon, 2 Jul 2007 19:55:26 +0100
Message-ID: <18057.18974.373870.405519@cerise.gclements.plus.com>
References: <Pine.LNX.4.64.0707020835520.6237@praktifix.dwd.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0707020835520.6237@praktifix.dwd.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: linux-c-programming@vger.kernel.org


Holger Kiehl wrote:

> Hello
> 
> When compiling the following program on a Fedora 6 x86_64 system:
> 
>     #include <stdio.h>
>     #include <limits.h>
> 
>     int
>     main(void)
>     {
>        (void)printf("%llu\n", ULLONG_MAX);
> 
>        return 0;
>     }
> 
> Produces the following result:
> 
>    cc longlong.c
>    longlong.c: In function 'main':
>    longlong.c:7: error: 'ULLONG_MAX' undeclared (first use in this function)
>    longlong.c:7: error: (Each undeclared identifier is reported only once
>    longlong.c:7: error: for each function it appears in.)
> 
> If I compile it with cc -std=c99 longlong.c it works.
> 
> Why is it necessary to specify -std=c99? If I use for example strtoull()
> I do not need to set -std=c99.

The declaration of strtoull() is enabled by __USE_MISC:

#if defined __USE_ISOC99 || (defined __GLIBC_HAVE_LONG_LONG && defined __USE_MISC)

If you use "-ansi -Wall", you'll get a warning due to the implicit
declaration of strtoull().

Bear in mind that a missing declaration only results in a warning,
while a missing macro is an error (as the symbol won't exist in any
library).

> Compiling the above on AIX compiles and runs without problems. Also
> on an older Solaris 8 system using gcc (3.3.2) it compiles and runs
> straight out of the box.
> 
> If I want to use ULLONG_MAX how can I do this in a portable way so it
> compiles on different systems?

You need to explicitly enable C99 support; "long long" isn't in C89,
so you shouldn't assume that it will be available when using the
default compilation settings.

-- 
Glynn Clements <glynn@gclements.plus.com>
