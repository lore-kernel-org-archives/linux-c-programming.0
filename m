From: Sindunata <software@dygsp.com>
Subject: Re: simple daemon dies
Date: Thu, 30 May 2002 09:16:17 +0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020530091617.A10993@top4>
References: <20020529153938.A4699@top4> <15604.40832.369590.75158@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <15604.40832.369590.75158@cerise.nosuchdomain.co.uk>; from glynn.clements@virgin.net on Wed, May 29, 2002 at 10:29:36AM +0100
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org

Hi Glynn & All,

Thanks for the explanation. I found the bug in my code:
  printf("%s", CURLreturn);
while it should be
  printf("%d", CURLreturn);

This cause a segmentation fault. Anyway when I tried running it in the
background and disconnect my terminal, it seems good now.

> You don't necessarily *need* to catch any signals. Most of the signals
> which terminate a process (e.g. SIGHUP, SIGTERM, SIGINT) are *meant*
> to terminate the process. When a program catches one of these signals,
> it's normally so that it can "clean up" before it terminates, not to
> prevent termination altogether.

Yupe, I'm catching those signals (SIGTERM & SIGINT) to cleanly and
politely :) disconnecting from postgresql only.

> >   /* ignore SIGHUP  & SIGTTOU */
> >   act.sa_handler = SIG_IGN;
> >   sigaction(SIGHUP, &act, NULL);
> 
> Same here.
>
> >   sigaction(SIGTTOU, &act, NULL);
> 
> This will only stop the process, not terminate it.

I tought that I need to ignore SIGHUP & SIGTTOU so that my process is
not killed/stopped when I disconnect my terminal. CMIIW.

> If you're trying to write a daemon (as opposed to simply running in
> the background), the process should be entirely disassociating itself
> from the terminal and from the process group, so it shouldn't be
> affected by terminal-related signals.

This is exactly what I'd like to do, writing a daemon. I tought that
it's just a normal C program which catches some signal. I'm still a
novice in linux C programming. Perhaps someone would give me examples how
to disassociate from the terminal and process group.

TIA & best regards,
Sindu
