From: "Suma Choudhary" <sumac@myw.ltindia.com>
Subject: Re: time conversion
Date: Wed, 24 Aug 2005 07:51:44 +0530
Message-ID: <s30c2716.024@EMAIL>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: lejanson@ntsp.nec.co.jp, nanakos@wired-net.gr
Cc: linux-c-programming@vger.kernel.org

Hi
How about using time() and ctime() functions.

regards
suma

>>> "Nanakos Chrysostomos" <nanakos@wired-net.gr> 08/23/05 13:09 PM >>>
#include <stdio.h>
#include <sys/time.h>
#include <time.h>
#include <unistd.h>

void print_time ()
{
        struct timeval tv;
        struct tm* ptm;
        char time_string[40];
        long milliseconds;

        gettimeofday (&tv, NULL);
        ptm = localtime (&tv.tv_sec);
        strftime (time_string, sizeof (time_string), "%Y-%m-%d %H:%M:%S",
ptm);
        milliseconds = tv.tv_usec / 1000;
        printf ("%s.%03ld\n", time_string, milliseconds);
}


main()
{
        print_time();
}

I hope this helps.


-
To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

