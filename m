From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: getch()
Date: Thu, 7 Nov 2002 17:19:51 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15818.41143.242454.812537@cerise.nosuchdomain.co.uk>
References: <200211071046.24987.abulfazl@juniv.edu>
	<200211072135.59164.abulfazl@juniv.edu>
	<20021107200436.C1136@neutrino.particles.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20021107200436.C1136@neutrino.particles.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Elias Athanasopoulos <eathan@otenet.gr>
Cc: Progga <abulfazl@juniv.edu>, linux-c-programming@vger.kernel.org


Elias Athanasopoulos wrote:

> >   Is there any way to get a character without pressing return in a simple
> >  console application ( something like getch() of ncurses ) ? It's needed in
> >  a test shell for getting the arrow keypresses for using the history list.
> >  TIA.
> 
> Yes. Test it before, it is old code...
> 
> Using the code below, I had a loop (it is from a console game I
> was trying to write 4-5 years before):

This is basically the right approach (i.e. use tcsetattr() to disable
canonical mode).

However, I'll just mention a couple of other points:

>     while (ch! = 'q') {

>       fflush (stdin);

fflush() is only applicable to output streams; using it on input
streams seems to be a common programming "superstition".

> And, what was _UP and _LEFT? Hmm... 
> 
> [anteater@neutrino berserkers]$ grep _UP *.h
> #define _UP 65
> [anteater@neutrino berserkers]$ grep _LEFT *.h
> #define TOP_LEFT 51
> #define BOT_LEFT 52
> #define _LEFT 68

IOW, 'A', 'B', 'C', 'D'. I doubt that you were actually using those
keys; more likely, assuming that the cursor keys generated particular
sequences and ignoring most of the sequence.

If you want to use extended keys (those which generate sequences
rather than individual codes, e.g. cursor keys, function keys, numeric
keypad, etc), use termcap/terminfo. Or just use curses; when someone
wants getch(), they often want the other stuff which curses provides.

> struct termios saved_attrib;
> 
> void reset_input_mode(void)
> {
> 	tcsetattr(STDIN_FILENO, TCSANOW, &saved_attrib);
> }

[snip]

> 	atexit(reset_input_mode);

To be safe, you should also install signal handlers which restore the
terminal mode.

-- 
Glynn Clements <glynn.clements@virgin.net>
