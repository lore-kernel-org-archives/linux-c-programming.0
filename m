From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: About combined console/X11 programs (was: question about gcc and keyboard hadling)
Date: Tue, 6 Aug 2002 23:07:59 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15696.18623.378185.959744@cerise.nosuchdomain.co.uk>
References: <02080504255200.24029@linux>
	<15694.36614.996185.222692@cerise.nosuchdomain.co.uk>
	<20020806061907.GP758@lug-owl.de>
	<15695.63457.98209.624871@cerise.nosuchdomain.co.uk>
	<20020806180852.GX758@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020806180852.GX758@lug-owl.de>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: linux-c-programming@vger.kernel.org


Jan-Benedict Glaw wrote:

> > > Even better question: I'd like to work on a text-based application and
> > > I'd like to act on simply pressing eg. Ctrl (change some context menu).
> > > I can do this with the hack I just posted nicely, but it will fail when
> > > running under X11. Is there any possibility in getting a callback
> > > registered called everytime an event occures which affects my terminal
> > > emulation's window?
> > 
> > No, there isn't.
> > 
> > An application which uses terminal I/O is inherently limited by the
> > set of actions for which the terminal actually generates input.
> 
> Think different. Think of linking mentioned application against
> xlibs/gtk+/whatever.

Then you're talking about an X/GTK+/whatever application. In which
case, you may as well use X/GTK+/whatever for all user I/O.

> Then, if(getenv("DISPLAY")) you could init the X11
> client side. This way, you can work on console (using so far Linux'isms)
> _and_ you can work under X11 within _one_ binary.

This is basically what Emacs does. But the two interfaces are
separate; while you can have both X frames and tty frames within the
same process, X frames receive input as X events, and tty frames
receive input as character sequences.

The down side is that, unless you link statically against the X/GTK+
libraries, you can't even run the application on a terminal unless the
system has the necessary X/GTK+ shared libraries installed.

> What now is the point
> is to fetch all the events which are ment to out xterm's window.

These events "belong" to xterm. While X allows an application to
select events for windows which it didn't create itself, there are
some problems here. E.g., only one client may select
Button{Press,Release} events at any given time, and xterm already
selects these itself.

> So, if you're running on console (!getenv("DISPLAY")), you initialize
> your input routine using ioctl(), but if running under X11, you
> initialize needed xlibs. The remaining problems then is to fetch the
> right events. I currently see no easy way in doing this, but there of
> course must be some:-}

Note that, even if you're running in an xterm, and $DISPLAY is set,
the value of $DISPLAY isn't necessarily the display on which the xterm
is running. The program may not even be able to access the display on
which the xterm is running.

The core problem is that what you are trying to do cannot, in general,
be done with a terminal. There may be specific types of terminal where
it's possible to implement specific solutions (e.g. ioctl(KDSKBMODE)
for the Linux console, X11 API calls for xterm, etc), but there isn't
any solution which will work in general.

The main advantage of "terminal" programs is their portability. They
run on anything which appears as a terminal, e.g. a hardware terminal
(vt100 etc) connected to a serial port (either directly or via a
modem), a terminal emulator (e.g. HyperTerminal) connected to a serial
port (either directly or via a modem), in an xterm, on a Linux
console, via telnet/rsh/ssh/etc.

Personally, I don't consider features which are specific to one
particular environment to be of much use. If you have access to a VT,
you have physical access, so you may as well run an X server and use
the X API. If you can run an xterm, you are already running an X
server, and so may as well use the X API.

Terminal programs are most useful when your only connection with the
system is a single byte stream (modem link, serial cable, TCP
connection etc). In which case, your input is limited to the sequences
which travel across that link.

-- 
Glynn Clements <glynn.clements@virgin.net>
