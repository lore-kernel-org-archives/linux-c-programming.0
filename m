From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: daemons
Date: Sun, 15 Feb 2004 07:55:16 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16431.9700.477631.484332@cerise.nosuchdomain.co.uk>
References: <Pine.LNX.4.58.0402142313510.2561@debian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0402142313510.2561@debian>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ameer armaly <ameer@charter.net>
Cc: linux-c-programming@vger.kernel.org


ameer armaly wrote:

> What do I need to do to have a program invoke as a daemon; i.e sit and ait
> for a particular event to happen, and then do something, all in the
> background?

The topic of daemon processes gets its own chapter in Stevens[1], but
the short version is:

1. Call fork(), and have the parent exit.

2. Call setsid() to create a new session and disconnect from the
   controlling terminal.

3. Call chdir() to change the current directory to the daemon's
   working directory, or the root directory if it doesn't have one.

4. Call umask(0) to reset the file permissions mask.

5. Close all unused file descriptors.

[1] Advanced Programming in the Unix(R) Environment
    W Richard Stevens
    Addison-Wesley

Depending upon what the daemon does, other useful steps may include:

6. Reset the environment to a fixed set of values.

7. Set up descriptors 0, 1 and 2 (use /dev/null if nothing else is
   appropriate).

8. Reset other aspects of the process' environment which will have
   been inherited, e.g. resource limits.

-- 
Glynn Clements <glynn.clements@virgin.net>
