From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Question about ULLONG_MAX
Date: Mon, 2 Jul 2007 08:55:00 +0000 (GMT)
Message-ID: <Pine.LNX.4.64.0707020835520.6237@praktifix.dwd.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello

When compiling the following program on a Fedora 6 x86_64 system:

    #include <stdio.h>
    #include <limits.h>

    int
    main(void)
    {
       (void)printf("%llu\n", ULLONG_MAX);

       return 0;
    }

Produces the following result:

   cc longlong.c
   longlong.c: In function 'main':
   longlong.c:7: error: 'ULLONG_MAX' undeclared (first use in this function)
   longlong.c:7: error: (Each undeclared identifier is reported only once
   longlong.c:7: error: for each function it appears in.)

If I compile it with cc -std=c99 longlong.c it works.

Why is it necessary to specify -std=c99? If I use for example strtoull()
I do not need to set -std=c99.

Compiling the above on AIX compiles and runs without problems. Also
on an older Solaris 8 system using gcc (3.3.2) it compiles and runs
straight out of the box.

If I want to use ULLONG_MAX how can I do this in a portable way so it
compiles on different systems?

Thanks,
Holger

