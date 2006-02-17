From: "Reuben D. Budiardja" <techlist@pathfinder.phys.utk.edu>
Subject: Re: Compiling the NIST Time Client
Date: Fri, 17 Feb 2006 08:03:15 -0500
Message-ID: <200602170803.17816.techlist@pathfinder.phys.utk.edu>
References: <200602170800.59429.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200602170800.59429.samjnaa@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

On Thursday 16 February 2006 21:30, Shriramana Sharma wrote:
> Hello all.
>
> I downloaded the source code for the NIST Time Client from
> ftp://time-a.nist.gov/pub/daytime and compiled it using make. I made =
the
> following changes to the source code to make it compile without error=
s but
> I want to verify here that I have not committed a blunder (though the
> program compiles and works properly).
>
> I got:
>
> samjnaa@linux:~/src/daytime> make nistime
> cc -o tcp.o -c tcp_time_client.c
> tcp_time_client.c: In function =E2=80=98main=E2=80=99:
> tcp_time_client.c:172: warning: incompatible implicit declaration of
> built-in function =E2=80=98exit=E2=80=99

Is stdlib.h included ?

> tcp_time_client.c:172: error: too few arguments to function =E2=80=98=
exit=E2=80=99
<snip>
> So I replaced all occurrences of:
>
> exit(); with return;
> exit(0); with return 0;
> exit(1); with return 1;

exit() takes one argument. exit() is not the same as return. 'man 3 exi=
t' for=20
details.

RDB
--=20
Reuben D. Budiardja
Dept. Physics and Astronomy
University of Tennessee, Knoxville, TN
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
