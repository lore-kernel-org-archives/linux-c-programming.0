From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: simple daemon dies
Date: Thu, 30 May 2002 06:24:47 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15605.47007.293615.252816@cerise.nosuchdomain.co.uk>
References: <20020529153938.A4699@top4>
	<15604.40832.369590.75158@cerise.nosuchdomain.co.uk>
	<20020530091617.A10993@top4>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020530091617.A10993@top4>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sindunata <software@dygsp.com>
Cc: linux-c-programming@vger.kernel.org


Sindunata wrote:

> > >   /* ignore SIGHUP  & SIGTTOU */
> > >   act.sa_handler = SIG_IGN;
> > >   sigaction(SIGHUP, &act, NULL);
> > 
> > Same here.
> >
> > >   sigaction(SIGTTOU, &act, NULL);
> > 
> > This will only stop the process, not terminate it.
> 
> I tought that I need to ignore SIGHUP & SIGTTOU so that my process is
> not killed/stopped when I disconnect my terminal. CMIIW.

OK; SIGHUP will kill it, SIGTTOU will stop (suspend) it.

This is normally the desired behaviour for "user" programs. For a
daemon, disassociating from the controlling terminal ensures that you
don't get these signals, so you don't need to handle them.

> > If you're trying to write a daemon (as opposed to simply running in
> > the background), the process should be entirely disassociating itself
> > from the terminal and from the process group, so it shouldn't be
> > affected by terminal-related signals.
> 
> This is exactly what I'd like to do, writing a daemon. I tought that
> it's just a normal C program which catches some signal. I'm still a
> novice in linux C programming. Perhaps someone would give me examples how
> to disassociate from the terminal and process group.

Stevens[1] gives this topic (daemon processes) its own chapter,
although the basics are:

1. Call fork(), and have the parent call exit(). This puts the command
into the background, and also ensures that it isn't a process group
leader.

2. Call setsid() to create a new session (it will also create a new
process group). The process will be the session leader, and also the
process group leader of the new process group. Furthermore, it will
have no controlling terminal, so the various terminal signals are no
longer relevant.

3. Either chdir() to a specific working directory (e.g. printer
daemons may chdir() to their spool directory), or chdir() to the root
directory. This ensures that the process doesn't inadvertently prevent
a filesystem from being unmounted.

4. If the daemon will create any files, call umask() to set the umask
to a suitable value (rather than whatever value it happened to
inherit).

5. Close all descriptors. Keeping inherited descriptors open may
interfere with other processes which share them (e.g. a socket isn't
closed until every process has closed the descriptor). This isn't
entirely straightforward, as there isn't a reliable way of determining
the maximum descriptor number. OTOH, calling close() on a non-existent
descriptor is harmless.

Also, specify O_NOCTTY when opening anything which might be a
terminal. Opening a terminal without this flag will cause it to become
the process' controlling terminal, which you probably don't want.

[1] Advanced Programming in the Unix(R) Environment
    W Richard Stevens
    Addison-Wesley

-- 
Glynn Clements <glynn.clements@virgin.net>
