From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: simple daemon dies
Date: Wed, 29 May 2002 10:29:36 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15604.40832.369590.75158@cerise.nosuchdomain.co.uk>
References: <20020529153938.A4699@top4>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020529153938.A4699@top4>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sindunata <software@dygsp.com>
Cc: linux-c-programming@vger.kernel.org


Sindunata wrote:

> I'm trying to write a simple daemon background process.
> It connects to PostgreSQL and wait for a notify event and upon receiving
> some event will invoke some URL using curl library.
> 
> I got it working already if I run it in foreground. But if I put the
> process in background (using &), and then after sometime the process
> will die.

In which case, the shell will tell you why it died.

Exited normally with zero status:

	[1]+  Done                    prog

Exited normally with non-zero status:

	[1]+  Exit 1                  prog

Terminated due to SIGTERM:

	[1]+  Terminated              prog

Terminated due to SIGIOT (aka SIGABRT):

	[1]+  Aborted                 (core dumped) prog

Terminated due to SIGKILL:

	[1]+  Killed                  prog

... and so on.

> I think there's some signal that I need to catch, can
> someone please help me?

You don't necessarily *need* to catch any signals. Most of the signals
which terminate a process (e.g. SIGHUP, SIGTERM, SIGINT) are *meant*
to terminate the process. When a program catches one of these signals,
it's normally so that it can "clean up" before it terminates, not to
prevent termination altogether.

> Currently i'm trapping the following signals:

>   sigaction (SIGTERM, &act, NULL);
>   sigaction (SIGINT, &act, NULL);

These are meant to kill the process; there's no reason to catch them.

>   /* ignore SIGHUP  & SIGTTOU */
>   act.sa_handler = SIG_IGN;
>   sigaction(SIGHUP, &act, NULL);

Same here.

>   sigaction(SIGTTOU, &act, NULL);

This will only stop the process, not terminate it.

If you're trying to write a daemon (as opposed to simply running in
the background), the process should be entirely disassociating itself
from the terminal and from the process group, so it shouldn't be
affected by terminal-related signals.

-- 
Glynn Clements <glynn.clements@virgin.net>
