From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: opening standard streams - who does that?
Date: Sun, 7 Jul 2002 08:26:53 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15655.60733.125157.459144@cerise.nosuchdomain.co.uk>
References: <200207070223.g672NSH26418@cs.annauniv.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200207070223.g672NSH26418@cs.annauniv.edu>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mssnlayam@cs.annauniv.edu
Cc: linux-c-programming@vger.kernel.org


Suriya Narayanan M S wrote:

> 	I want to know who opens the streams
> stdin, stdout, stderr in file-descriptors 1, 2, 3

0, 1, 2

> and calls the process. I know (right or wrong?)
> that on a fork the filedescriptors are duplicated.

Yes.

> So bash or the shell can just forks a new process
> without assinging the fds. Is it the kernel
> which assigns 0 to the keyboard. How is this
> done?

For terminal logins, it's done by getty[1], which is run from the
inittab.

[1] "getty" is the generic term; the program may actually be called
something else, e.g. agetty, mgetty, uugetty, mingetty.

For telnet/ssh/rsh etc logins, it's done by the daemon (in.telnetd,
sshd, in.rshd etc).

Under X, terminal emulators (xterm etc) set up the descriptors. Note
that programs which aren't run from a terminal, but from the X session
scripts (~/.xsession, ~/.xinitrc) or from the window manager, may not
actually have stdin/stdout/stderr assigned.

-- 
Glynn Clements <glynn.clements@virgin.net>
