From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Howto print off_t
Date: Thu, 27 Jun 2002 07:09:52 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15642.44080.970456.988159@cerise.nosuchdomain.co.uk>
References: <Pine.LNX.4.33.0206262314360.10613-100000@talentix.dwd.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0206262314360.10613-100000@talentix.dwd.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: linux-c-programming@vger.kernel.org


Holger Kiehl wrote:

> What is the best way to print an off_t variable. On a 32 bit machine
> you can print it with %ld and on a 64 bit machine you need to print
> it with %lld.

On a 64-bit machine, "long" is probably 64 bits.

> One could code this as follows:
> 
>     if (sizeof(off_t) == 4)
>        printf("%ld\n", off_t_var);
>     else
>        printf("%lld\n", off_t_var);

It's probably better to use the preprocessor, i.e.

	#if sizeof(off_t) == 4

> But is this portable?

No. This should be portable:

	#if sizeof(off_t) == sizeof(int)
		printf("%d\n", off_t_var);
	#elif sizeof(off_t) == sizeof(long)
		printf("%ld\n", off_t_var);
	#else
	#error cannot print off_t
	#endif

You could also include tests for specific platforms which support "ll"
or "q".

> Do all implementations know about %lld?

No.

> Don't some of them use %Ld or some other syntax.

"%Ld" is invalid; the "L" modifier is only valid when preceding a, A,
e, E, f, g, or G, and indicates a "long double" argument.

> Or is there a better way of doing this? I don't like the above code
> since it makes it ugly to read when you have to print lots of off_t's.

Assuming that off_t is no larger than "long", you could just cast it,
e.g.:

	printf("%ld", (long) off_t_var);

If off_t is larger than "long", then you have to deal with platform
specifics, as ANSI C doesn't have anything bigger than long.

-- 
Glynn Clements <glynn.clements@virgin.net>
