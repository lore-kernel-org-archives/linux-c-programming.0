From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: I'm really starting to dislike stdio
Date: Thu, 19 Jun 2003 18:39:10 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16113.62782.26942.569698@cerise.nosuchdomain.co.uk>
References: <011801c33580$48425aa0$e764a8c0@fesnel.noip.org>
	<003c01c335c7$a7f437b0$3d6405d5@carlos>
	<004001c33635$21f3d3a0$e764a8c0@fesnel.noip.org>
	<20030619112617.GV6353@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030619112617.GV6353@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "John T. Williams" <jtwilliams@vt.edu>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>, Jan-Benedict Glaw <jbglaw@lug-owl.de>


Jan-Benedict Glaw wrote:

> > I really appricated the help with the progress bar.
> > 
> > I have another problem
> > 
> > I am trying to read in a password from the stdin, but I don't want it to
> > display to the screen as the person types it in.
> > I either like to mock su, and take input w/o any output, or output a *  for
> > each typed character, and I cannot figure out how to get this to work
> 
> > and I tried getc from the curses library.
> > The problem with all of these is that they only actually do the read part
> > after I've hit the <enter> key.  I want it to process each character as it
> > is typed.  Anyone who has any ideas or can tell me a better way to read
> > characters w/o displaying it to the screen and I'd be greatful.
> 
> Terminals are serial equipment with special characteristics:) First, a
> call to read() will only return after the user pressed his Enter key
> _until_ you fiddle with serial settings:
> 
> struct termios termio;
> tcgetattr(STDIN_FILENO, &termio);
> termio.c_cc[V_MIN] = 1; /* Return after one byte */
> tcsetattr(STDIN_FILENO, &termio);
> tcflush(STDIN_FILENO, TCIOFLUSH);

Note: tcsetattr() takes 3 arguments.

Alternatively:

	tcgetattr(STDIN_FILENO, &termio);
	termio.c_lflag &= ~ICANON;
	tcsetattr(STDIN_FILENO, TCSANOW, &termio);

This will disable the terminal driver's line-buffering altogether. It
also disables the processing of special characters (backspace, Ctrl-C,
Ctrl-Z etc).

For this particular situation (reading passwords), setting c_cc[V_MIN]
is probably preferable, but for fully "raw" I/O you need to clear the
ICANON flag.

If you want to use ANSI I/O, you also need:

	setbuf(stdin, NULL);

This will disable the line buffering within the stdio library.

> (Of course, you need a second struct termios to memcpy() all the old
> values to be able to restore the previous state which you're expected to
> do.)

If you want to be really sure about restoring the previous state, you
need to install some signal handlers in case the program dies suddenly
(SIGINT, SIGQUIT, etc). If you don't disable SIGTSTP (Ctrl-Z), you
should restore the terminal state on SIGTSTP then re-enable the
changes on SIGCONT.

-- 
Glynn Clements <glynn.clements@virgin.net>
