From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: clear the screen
Date: Wed, 23 Feb 2005 00:16:52 +0000
Message-ID: <16923.52084.408249.817998@gargle.gargle.HOWL>
References: <1108969688.5088.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1108969688.5088.12.camel@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kaushal@rocsys.com
Cc: linux-c <linux-c-programming@vger.kernel.org>


kaushal wrote:

> 	Sorry for a very basic question.I would like to know how to clear the
> screen from within a c program without using system("clear") or any of
> the ncurses functions.Can we do this using printf?My program is in raw
> mode so is there any feature available by which I can use the termios
> structure for clearing the screen if it is not possible with printf.Long
> ago when I used work in the dos platform I used conio.h and clrscr()
> rourine.I guess I have to write that clrscr() routine's code itself.Im
> working on a linux machine now.

Unix systems don't have a "screen", they have terminals. Historically,
these would be physical terminals (e.g. vt220s) connected via serial
ports. The Linux kernel uses the keyboard and the graphics card's text
mode to emulate a number of terminals, as well as supporting physical
terminals connected to a serial port (either directly or via modems)
and pseudo-terminals (used by programs which emulate terminals, e.g. 
telnetd, xterm, screen etc).

To clear the terminal's screen (assuming that it's a video terminal;
hardcopy terminals don't have a screen), you have to send the
appropriate control sequence. The exact sequence depends upon the type
of terminal (which can be determined from the value of the TERM
environment variable).

To obtain the correct control sequence, use the terminfo library to
obtain the sequence for the "clear" capability, then send that
sequence to the terminal (i.e. stdout).

See the manpage for setupterm() and tigetstr() for more information.

-- 
Glynn Clements <glynn@gclements.plus.com>
