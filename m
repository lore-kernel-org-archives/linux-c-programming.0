From: "Nanakos Chrysostomos" <nanakos@wired-net.gr>
Subject: Re: time conversion
Date: Tue, 23 Aug 2005 10:42:55 +0300 (EEST)
Message-ID: <56285.62.1.10.221.1124782975.squirrel@webmail.wired-net.gr>
References: <430AD085.7070004@hq.ntsp.nec.co.jp>
Reply-To: nanakos@wired-net.gr
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <430AD085.7070004@hq.ntsp.nec.co.jp>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Lejanson C. Go" <lejanson@ntsp.nec.co.jp>
Cc: linux-c-programming@vger.kernel.org

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


