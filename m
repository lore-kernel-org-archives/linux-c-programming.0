From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Signals And Chlidren
Date: Tue, 6 Jul 2004 06:28:32 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16618.14464.909321.549605@cerise.nosuchdomain.co.uk>
References: <200407051417.03410.eric@cisu.net>
	<16617.62535.705594.100506@cerise.nosuchdomain.co.uk>
	<200407052233.56488.eric@cisu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200407052233.56488.eric@cisu.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: eric@cisu.net
Cc: linux-c-programming@vger.kernel.org


Eric Bambach wrote:

> > > Is there any way to send signals to ONLY the children without having to
> > > explicitly know their PID?
> >
> > Only by putting them in a separate process group; then you can send a
> > signal to the process group.
> 
> Hmmm. Interesting. I never thought of that. Is there a subset of system calls 
> that can manipulate processs groups?

setpgid, getpgid, setpgrp, and getpgrp. Some of the other syscalls
also understand process groups (e.g. kill() with a negative PID sends
a signal to a process group).

> Im not too familiar with this concept, 
> or even know a concrete definition of  a process group. I am assuming a 
> process group is a process and all its descendents including children, 
> grandchildren etc. unless they get reparented from orphaning or something 
> like that.

No. Process groups are explicitly created by setpgid() or setpgrp().
New processes belong to the same process group as their parent
initially, but can "detach" into a new process group by using one of
those functions.

The main use of process groups is for job control in shells. Each
"job" (command, pipeline etc) is run in a separate process group. If
you run commands in the background (e.g. by appending "&" to the
command, or by suspending a command with Ctrl-Z then using the "bg"
command), there may be multiple process groups descended from the
shell.

At any given time, at most one of those process groups will be the
"foreground" process group. The foreground process group receives
SIGINT, SIGQUIT, SIGTSTP etc in response to Ctrl-C etc.

> But, in my example, if I made the child of main the leader of a new process 
> group, wouldnt it lose its child status under the original program and the 
> original program's ability to wait() on it? Meaning....it would now be a 
> child of init right?

No; it would still be a child of its parent so long as its parent
remains alive.

-- 
Glynn Clements <glynn.clements@virgin.net>
