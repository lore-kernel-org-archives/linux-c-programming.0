From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: functions to determine dementions of console?
Date: Mon, 24 May 2004 03:09:55 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16561.22899.864812.981913@cerise.nosuchdomain.co.uk>
References: <Pine.LNX.4.58.0405231854400.11050@debian>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0405231854400.11050@debian>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ameer armaly <ameer@charter.net>
Cc: linux-c-programming@vger.kernel.org


ameer armaly wrote:

> I was wondering if there are a set of functions/system calles to let =
me
> know what someone's set their tty length and heighth too?  I do this
> because I don't want to presume 80x25 in case someone's got it set
> otherwise.

There are two options:

1. Ask the kernel:

	#include <sys/ioctl.h>

	...

	struct winsize ws;
	int rows, cols;

	ioctl(STDIN_FILENO, TIOCGWINSZ, &ws);
	rows =3D ws.ws_row;
	cols =3D ws.ws_col;

If the terminal size changes (e.g. resizing an xterm), the process
will receive SIGWINCH.

However, this requires that the kernel actually knows what the
terminal's dimensions are. That is likely to be the case for emulators
(e.g. xterm, telnet) and possibly for the Linux console, but not
necessarily for hardware terminals (e.g. a vt220 connected to a serial
port).

2. Examine the termcap/terminfo entry for $TERM.

	#include <curses.h>
	#include <term.h>

	...

	int rows, cols;

	setupterm(NULL, 1, NULL);
	/* lines and columns are global variables defined by curses */
	rows =3D lines;
	cols =3D columns;

According to the curs_terminfo manpage:

> 	The terminfo variables lines and
> 	columns  are  initialized  by  setupterm  as  follows:  If
> 	use_env(FALSE)  has  been  called,  values  for  lines and
> 	columns specified in terminfo are used.  Otherwise, if the
> 	environment  variables LINES and COLUMNS exist, their val=AD
> 	ues are used.  If these environment variables do not exist
> 	and the program is running in a window, the current window
> 	size is used.  Otherwise, if the environment variables  do
> 	not  exist,  the values for lines and columns specified in
> 	the terminfo database are used.

--=20
Glynn Clements <glynn.clements@virgin.net>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
