From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Howto print off_t
Date: Wed, 26 Jun 2002 23:30:17 +0200 (CEST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0206262314360.10613-100000@talentix.dwd.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello

What is the best way to print an off_t variable. On a 32 bit machine
you can print it with %ld and on a 64 bit machine you need to print
it with %lld. One could code this as follows:

    if (sizeof(off_t) == 4)
       printf("%ld\n", off_t_var);
    else
       printf("%lld\n", off_t_var);

But is this portable? Do all implementations know about %lld? Don't
some of them use %Ld or some other syntax.

Or is there a better way of doing this? I don't like the above code
since it makes it ugly to read when you have to print lots of off_t's.

Thanks,
Holger

