From: Sindunata <software@dygsp.com>
Subject: simple daemon dies
Date: Wed, 29 May 2002 15:39:38 +0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020529153938.A4699@top4>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi all,

I'm trying to write a simple daemon background process.
It connects to PostgreSQL and wait for a notify event and upon receiving
some event will invoke some URL using curl library.

I got it working already if I run it in foreground. But if I put the
process in background (using &), and then after sometime the process
will die. I think there's some signal that I need to catch, can
someone please help me?

Currently i'm trapping the following signals:

  struct sigaction act;
  
  /* set signal handler TERM (terminate by kill) & INT (keyboard break) to exit nicely */
  act.sa_flags = 0;
  act.sa_handler = mainExit;
  sigemptyset (&(act.sa_mask));
  
  sigaction (SIGTERM, &act, NULL);
  sigaction (SIGINT, &act, NULL);

  /* ignore SIGHUP  & SIGTTOU */
  act.sa_handler = SIG_IGN;
  sigaction(SIGHUP, &act, NULL);
  sigaction(SIGTTOU, &act, NULL);

TIA & regards,
Sindu
