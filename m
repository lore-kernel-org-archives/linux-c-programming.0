From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: what causes SIGTERMs?
Date: Tue, 8 Jul 2003 15:27:53 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16138.54505.701672.164306@cerise.nosuchdomain.co.uk>
References: <00be01c34553$57ea97a0$caba0ba4@uwe.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <00be01c34553$57ea97a0$caba0ba4@uwe.ac.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matthew Studley <matthew.studley@uwe.ac.uk>
Cc: linux-c-programming@vger.kernel.org


Matthew Studley wrote:

> I wonder whether you could help me?  I have a problem; I'm running an
> application I've written in C under Slackware 7.1  Occasionally it receives
> a SIGTERM.
> 
> * In what circumstances do processes get sent a SIGTERM?

If something raises it with kill(). Note that SIGTERM is the default
signal sent by the kill and killall commands.

> * Am I correct that this is unlikely to be issued in response to a bug in my
> code?

Correct. SIGTERM isn't sent synchronously (i.e. in response to the
actions of the process which receives it).

> * How can I find which process is issuing the SIGTERM against my code?

Install a signal handler using sigaction() with the SA_SIGINFO flag;
the sending process ID will be in the si_pid field of the siginfo_t
structure. Other fields of that structure may also contain useful
information.

-- 
Glynn Clements <glynn.clements@virgin.net>
