From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: offtopic
Date: Thu, 26 Jun 2003 23:43:04 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16123.30456.673529.961549@cerise.nosuchdomain.co.uk>
References: <20030625204313.GM29233@lug-owl.de>
	<Pine.LNX.4.44.0306261056040.18286-100000@ns.isi.ulatina.ac.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0306261056040.18286-100000@ns.isi.ulatina.ac.cr>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>
Cc: Jan-Benedict Glaw <jbglaw@lug-owl.de>, linux-c-programming@vger.kernel.org


Fabio Miranda Hamburger wrote:

> > > Hi, I am curious if It's possible to code in C, a small user keylloger.
> > > For exmaple, a unprivileged user log on a machine and the "user kelogger"
> > > start and all key are logged including those typed on getpass() functions.
> > > (ej: passwd) and remote connections with telnet and ssh.
> >
> > No need to do programming. Simlpy strace user's shell (and any spawned
> > processes) and look I/O to file descriptors 0 and 1.
> 
> I dont understand. How to "strace the user's shell"?
> I would like to this without root access.
> The idea is: code a program that keylog the session of oneself. "script"
> unix command doesnt work with getpass() functions.

I suggest modifying "script" to log the input instead of the output.

Essentially, any solution will involve using a pseudo-terminal (pty). 
These are described in chapter 19 of Stevens[1], or you can start with
the source code for any program which uses ptys (e.g. in.telnetd,
xterm, screen, script; of these, script is likely to be the simplest).

[1]
Advanced Programming in the Unix(R) Environment
W Richard Stevens
Addison-Wesley, 1992
0-201-56317-7

-- 
Glynn Clements <glynn.clements@virgin.net>
