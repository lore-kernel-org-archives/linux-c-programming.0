From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Newbie question on malloc()
Date: Thu, 3 Jun 2004 08:59:10 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16574.55886.797709.765778@cerise.nosuchdomain.co.uk>
References: <002d01c44897$78ae58d0$de01a8c0@qnessmphibiki>
	<20040603012832.GC2562@luna.mooo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040603012832.GC2562@luna.mooo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Micha Feigin <michf@post.tau.ac.il>
Cc: linux-c-programming@vger.kernel.org


Micha Feigin wrote:

> > I have made a daemon in which dynamic memory is gotten
> > by malloc(). Does the memory get free automatically without
> > free() by the deamon  when the daemon process is killed?
> > Thanks in advance.
> 
> It does, but in general its not in good practice to count on process
> exit for freeing memory (a good way to get memory leaks).

This is incorrect.

You shouldn't make an effort to return memory to the process' heap (by
calling free()) if the program is about to terminate.

Doing so consumes CPU time (and probably disk bandwidth, given that
some of that memory will probably be swapped out) and doesn't provide
any benefit (free() won't usually return memory to the OS and, in any
case, all of the process' memory will be returned to the OS upon
exit).

The only valid reason for free()ing memory blocks upon termination is
if the structure of the program is such that it isn't practical to
avoid doing so. E.g. if data structures have matched setup/cleanup
routines, and you need to call the cleanup code for other reasons, and
the cleanup code will free the memory anyway.

Similarly, you don't need to explicitly close() file descriptors, or
release file locks (those obtained with flock/lockf/fcntl) as the OS
will do that.

The sort of actions which might make sense to perform before calling
exit() are:

+ Writing a log entry reporting shutdown
+ Deleting temporary files
+ Deleting any SysV IPC structures which aren't shared with other
  processes.
+ Informing other networked processes of termination, e.g. sending a
  "QUIT" command.
+ Killing child processes.

-- 
Glynn Clements <glynn.clements@virgin.net>
