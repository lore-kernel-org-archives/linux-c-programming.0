From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Re: Howto print off_t
Date: Thu, 27 Jun 2002 21:43:18 +0200 (CEST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0206272049120.31948-100000@talentix.dwd.de>
References: <15642.44080.970456.988159@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <15642.44080.970456.988159@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org


On Thu, 27 Jun 2002, Glynn Clements wrote:

>
> Holger Kiehl wrote:
>
> > What is the best way to print an off_t variable. On a 32 bit machine
> > you can print it with %ld and on a 64 bit machine you need to print
> > it with %lld.
>
> On a 64-bit machine, "long" is probably 64 bits.
>
> > One could code this as follows:
> >
> >     if (sizeof(off_t) == 4)
> >        printf("%ld\n", off_t_var);
> >     else
> >        printf("%lld\n", off_t_var);
>
> It's probably better to use the preprocessor, i.e.
>
> 	#if sizeof(off_t) == 4
>
Does the sizeof operator work in the preprocessor? I tried this but it
does not seem to work for me.

> > But is this portable?
>
> No. This should be portable:
>
> 	#if sizeof(off_t) == sizeof(int)
> 		printf("%d\n", off_t_var);
> 	#elif sizeof(off_t) == sizeof(long)
> 		printf("%ld\n", off_t_var);
> 	#else
> 	#error cannot print off_t
> 	#endif
>
But is not on most 32 bit system, both long and int 4 bytes long, so %d
will be used, but off_t in that case is mostly of type long?

> You could also include tests for specific platforms which support "ll"
> or "q".
>
C99 does have a 64 bit integer type, how does one print it here?

Thanks,
Holger

