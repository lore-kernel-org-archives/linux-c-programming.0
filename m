From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: stdio
Date: Wed, 18 Jun 2003 18:45:38 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16112.42306.221238.72881@cerise.nosuchdomain.co.uk>
References: <011801c33580$48425aa0$e764a8c0@fesnel.noip.org>
	<5.2.1.1.0.20030618055414.01373338@fluent2.pyramid.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <5.2.1.1.0.20030618055414.01373338@fluent2.pyramid.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "John T. Williams" <jtwilliams@vt.edu>
Cc: Stephen Satchell <list@fluent2.pyramid.net>, linux-c-programming <linux-c-programming@vger.kernel.org>


Stephen Satchell wrote:

> > I am trying to figure out how to cause a character to be printed to a
> > specific place on the terminal
> > 
> > what I'm actually trying to accomplish is to make a progress bar
> > 
> > example:
> > 
> > Progress [*****                           ]  25%
> > 
> > and I want it to fill up the box with stars as my program progresses, but I
> > can't figure out how to just get c to write a single '*'  to anywhere other
> > then the end of the streak
> > I tried lseek and got no good results.
> > 
> > I'd really like any advice anyone has on this.
> 
> The really "classic" way to do what you want to do is to rewrite the entire 
> line each time you add a progress indicator.    This is the basic idea:
> 
>     int i;
>     char progress[52];
> 
>     memset(progress, 0, 52);
>     for (i = 0; i <50; i++)
>      {
>      fprintf(stderr, "%1.26s [%-50s]\r", "some.text", progress);
>      progress[i] = '*';
>      GoDoOneFiftyithOfSomething();
>      }
>     fprintf(stderr, "%1.26s [%-50s]\n", "some.text", progress);
> 
> This avoids the need to use termcap or terminfo, or the curses package.  It 
> works with all non-paper terminals,

Not quite. It doesn't work with emulators such as Emacs' shell-mode,
which just dumps everything into the buffer.

For correctness, you should use termcap/terminfo to check whether the
terminal (as specified by $TERM) has the "cr" capability before
writing '\r' to the terminal.

Also, you should check whether stderr is actually a terminal (with
isatty()) before doing this sort of thing; you don't want to be doing
it if stderr is redirected to a file.

However, using curses for this would be overkill. You only need to use
curses if you need vertical positioning.

-- 
Glynn Clements <glynn.clements@virgin.net>
