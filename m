From: Stephen Kratzer <kratzers@pa.net>
Subject: Re: Question about ULLONG_MAX
Date: Mon, 2 Jul 2007 08:57:12 -0400
Message-ID: <200707020857.13174.kratzers@pa.net>
References: <Pine.LNX.4.64.0707020835520.6237@praktifix.dwd.de>
Reply-To: kratzers@pa.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0707020835520.6237@praktifix.dwd.de>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: linux-c-programming@vger.kernel.org

From limits.h,

#  ifdef __USE_ISOC99

/* Minimum and maximum values a `signed long long int' can hold.  */
#   define LLONG_MAX    9223372036854775807LL
#   define LLONG_MIN    (-LLONG_MAX - 1LL)

/* Maximum value an `unsigned long long int' can hold.  (Minimum is 0.)  */
#   define ULLONG_MAX   18446744073709551615ULL

#  endif /* ISO C99 */


/* The <limits.h> files in some gcc versions don't define LLONG_MIN,
   LLONG_MAX, and ULLONG_MAX.  Instead only the values gcc defined for
   ages are available.  */
#if defined __USE_ISOC99 && defined __GNUC__
# ifndef LLONG_MIN
#  define LLONG_MIN     (-LLONG_MAX-1)
# endif
# ifndef LLONG_MAX
#  define LLONG_MAX     __LONG_LONG_MAX__
# endif
# ifndef ULLONG_MAX
#  define ULLONG_MAX    (LLONG_MAX * 2ULL + 1)
# endif
#endif

On Monday 02 July 2007 04:55:00 Holger Kiehl wrote:
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
>    longlong.c:7: error: 'ULLONG_MAX' undeclared (first use in this
> function) longlong.c:7: error: (Each undeclared identifier is reported only
> once longlong.c:7: error: for each function it appears in.)
>
> If I compile it with cc -std=c99 longlong.c it works.
>
> Why is it necessary to specify -std=c99? If I use for example strtoull()
> I do not need to set -std=c99.
>
> Compiling the above on AIX compiles and runs without problems. Also
> on an older Solaris 8 system using gcc (3.3.2) it compiles and runs
> straight out of the box.
>
> If I want to use ULLONG_MAX how can I do this in a portable way so it
> compiles on different systems?
>
> Thanks,
> Holger
>
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


