From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: static or stuff like that
Date: Wed, 1 May 2002 01:12:33 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15567.13041.485353.845971@cerise.nosuchdomain.co.uk>
References: <200204281856.43955.wrazlov@gmx.net>
	<15564.28455.695486.899966@cerise.nosuchdomain.co.uk>
	<20020429110933.19f3c1af.subscript@free.fr>
	<15565.5881.728128.202346@cerise.nosuchdomain.co.uk>
	<20020430232631.046def4f.subscript@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020430232631.046def4f.subscript@free.fr>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wwp <subscript@free.fr>
Cc: linux-c-programming@vger.kernel.org


wwp wrote:

> > > > > I want to control whether a process is already running or not,
> > > > > and i don't know how without using some kind of lock-files
> > > > 
> > > > You can scan the files under /proc/<pid> to obtain details about
> > > > which processes are running. E.g. /proc/<pid>/exe is a symlink to
> > > > the program which process <pid> is executing.
> > > 
> > > Is /proc always available?
> > 
> > It's possible that /proc isn't mounted but, if it isn't, many OS
> > features won't work (e.g. modprobe). Unless you're targeting a very
> > minimal system (e.g. embedded systems), or writing code which will run
> > early in the boot sequence, it's safe to assume that /proc will be
> > available.
> [snip]
> 
> Thanx for your answers.
> I've also seen software using unix domain socket to prohibit duplicate
> launch of a program on a POSIX system.
> What do you think of this method, Glynn?

I don't see that this is any different to using a lock file.

-- 
Glynn Clements <glynn.clements@virgin.net>
