From: Stephen Satchell <list@fluent2.pyramid.net>
Subject: Re: stdio
Date: Wed, 18 Jun 2003 06:04:21 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <5.2.1.1.0.20030618055414.01373338@fluent2.pyramid.net>
References: <011801c33580$48425aa0$e764a8c0@fesnel.noip.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <011801c33580$48425aa0$e764a8c0@fesnel.noip.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "John T. Williams" <jtwilliams@vt.edu>, linux-c-programming <linux-c-programming@vger.kernel.org>

At 05:58 AM 6/18/2003 -0400, John T. Williams wrote:
>I am trying to figure out how to cause a character to be printed to a
>specific place on the terminal
>
>what I'm actually trying to accomplish is to make a progress bar
>
>example:
>
>Progress [*****                           ]  25%
>
>and I want it to fill up the box with stars as my program progresses, but I
>can't figure out how to just get c to write a single '*'  to anywhere other
>then the end of the streak
>I tried lseek and got no good results.
>
>I'd really like any advice anyone has on this.

The really "classic" way to do what you want to do is to rewrite the entire 
line each time you add a progress indicator.    This is the basic idea:

    int i;
    char progress[52];

    memset(progress, 0, 52);
    for (i = 0; i <50; i++)
     {
     fprintf(stderr, "%1.26s [%-50s]\r", "some.text", progress);
     progress[i] = '*';
     GoDoOneFiftyithOfSomething();
     }
    fprintf(stderr, "%1.26s [%-50s]\n", "some.text", progress);

This avoids the need to use termcap or terminfo, or the curses package.  It 
works with all non-paper terminals, but it's SLOW if you are on a real 
teletype and HORRIBLE on some kludge like a keypunch-cardreader/printer 
console.  (Not likely today, but...)

Hope this helps.

Satch

