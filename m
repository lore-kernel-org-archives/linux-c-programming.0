From: Chuck Winters <cwinters@atl.lmco.com>
Subject: Re: opening standard streams - who does that?
Date: Mon, 8 Jul 2002 13:53:29 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020708135329.A3340@atl.lmco.com>
References: <200207070223.g672NSH26418@cs.annauniv.edu> <15655.60733.125157.459144@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <15655.60733.125157.459144@cerise.nosuchdomain.co.uk>; from glynn.clements@virgin.net on Sun, Jul 07, 2002 at 08:26:53AM +0100
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On the same note, I have a program which uses another library.  Is it possible to
redirect stderr to a file, and then later set it back to stderr.  I know I can close
stderr, then reopen stderr to the file I want.  The problem is that when I run the 
following code, I get a, "No Such File or Directory" error.

#include <stdlib.h>
#include <stdio.h>

int main(void)
{
	FILE *f = NULL;

	fclose(stdout);

	if( !(f = fopen("/dev/stdout", "w+")) ) {
		perror("Opening stdout");
		exit(1);
	}

	fprintf(stdout, "Hey\n");
	exit(0);
}

Chuck Winters

On Sun, Jul 07, 2002 at 08:26:53AM +0100, Glynn Clements wrote:
> 
> Suriya Narayanan M S wrote:
> 
> > 	I want to know who opens the streams
> > stdin, stdout, stderr in file-descriptors 1, 2, 3
> 
> 0, 1, 2
> 
> > and calls the process. I know (right or wrong?)
> > that on a fork the filedescriptors are duplicated.
> 
> Yes.
> 
> > So bash or the shell can just forks a new process
> > without assinging the fds. Is it the kernel
> > which assigns 0 to the keyboard. How is this
> > done?
> 
> For terminal logins, it's done by getty[1], which is run from the
> inittab.
> 
> [1] "getty" is the generic term; the program may actually be called
> something else, e.g. agetty, mgetty, uugetty, mingetty.
> 
> For telnet/ssh/rsh etc logins, it's done by the daemon (in.telnetd,
> sshd, in.rshd etc).
> 
> Under X, terminal emulators (xterm etc) set up the descriptors. Note
> that programs which aren't run from a terminal, but from the X session
> scripts (~/.xsession, ~/.xinitrc) or from the window manager, may not
> actually have stdin/stdout/stderr assigned.
> 
> -- 
> Glynn Clements <glynn.clements@virgin.net>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
