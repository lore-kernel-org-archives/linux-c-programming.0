From: Miguel Griffa <mgriffa@technisys.net>
Subject: Re: defining a #define
Date: Thu, 05 Dec 2002 10:22:52 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3DEF532C.5020701@technisys.net>
References: <200211071046.24987.abulfazl@juniv.edu> <200211072135.59164.abulfazl@juniv.edu> <20021107200436.C1136@neutrino.particles.org> <200211081504.01461.abulfazl@juniv.edu> <3DEF43F5.7050907@htec.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3DEF43F5.7050907@htec.demon.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christopher Quinn <cq@htec.demon.co.uk>
Cc: linux-c-programming@vger.kernel.org

Just what you did is ok

#ifdef LINUX
#define GREAT_API
#define OS "Linux"
#else
#define UNKNOWN
#endif


Christopher Quinn wrote:
Christopher Quinn wrote:

> if i compile a library with a certain build flag
> there are times when i would like to reflect that flag
> into the header file for the library, so that larger
> compilations involving the library are built the same
> way.
>
> ie. something like
>
> ---library.h---
> #ifdef BUILD_THIS_WAY
> #text "#define BUILD_THIS_WAY"
> #endif
>
> i could not find anything in the gnu cpp docs.
> but does anyone know for sure there *is* a way?
>
> thanks.
> - chris
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


> if i compile a library with a certain build flag
> there are times when i would like to reflect that flag
> into the header file for the library, so that larger
> compilations involving the library are built the same
> way.
>
> ie. something like
>
> ---library.h---
> #ifdef BUILD_THIS_WAY
> #text "#define BUILD_THIS_WAY"
> #endif
>
> i could not find anything in the gnu cpp docs.
> but does anyone know for sure there *is* a way?
>
> thanks.
> - chris
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



