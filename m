From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: static or stuff like that
Date: Mon, 29 Apr 2002 10:48:41 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15565.5881.728128.202346@cerise.nosuchdomain.co.uk>
References: <200204281856.43955.wrazlov@gmx.net>
	<15564.28455.695486.899966@cerise.nosuchdomain.co.uk>
	<20020429110933.19f3c1af.subscript@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020429110933.19f3c1af.subscript@free.fr>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wwp <subscript@free.fr>
Cc: linux-c-programming@vger.kernel.org


wwp wrote:

> > > I want to control whether a process is already running or not, and i don't 
> > > know how without using some kind of lock-files
> > 
> > You can scan the files under /proc/<pid> to obtain details about which
> > processes are running. E.g. /proc/<pid>/exe is a symlink to the
> > program which process <pid> is executing.
> 
> Is /proc always available?

It's possible that /proc isn't mounted but, if it isn't, many OS
features won't work (e.g. modprobe). Unless you're targeting a very
minimal system (e.g. embedded systems), or writing code which will run
early in the boot sequence, it's safe to assume that /proc will be
available.

> (if not, how to do what Wrazlov asked?)

Without /proc, the only way in which you could obtain information on
other processes is by examining the kernel data structures via
/dev/kmem.

BTW, /dev/kmem is the traditional mechanism for implementing "ps", but
it has a number of drawbacks (e.g. requiring root privilege, having to
modify "ps" if the format of the relevant kernel data structures
changes).

-- 
Glynn Clements <glynn.clements@virgin.net>
