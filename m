From: Eric <eric@cisu.net>
Subject: Re: PID's of processes and waiting.
Date: Tue, 22 Jun 2004 22:49:32 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200406222249.32523.eric@cisu.net>
References: <200406222050.48748.eric@cisu.net> <16600.63133.431912.483989@cerise.nosuchdomain.co.uk>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16600.63133.431912.483989@cerise.nosuchdomain.co.uk>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org

On Tuesday 22 June 2004 10:18 pm, Glynn Clements wrote:
> Eric wrote:
> > 	I am looking for a way to wait for a process to terminate. I have a
> > process that was executed via system() and am getting its PID from a file
> > it writes itself. I have a few questions.
> >
> > 	1. Is it possible to directly get the PID of a processes executed via
> > system()? I do not believe so that is why I am falling back to reading
> > its file.
>
> No.
>
> > 	2. I have tried to waitpid() on the process by giving waitpid the PID
> > read from the file as an argument, however it seems to return immidietly
> > because I assume the new process is not a child of the calling process.
> > Is it in fact a child of the calling process or am I abusing the
> > systemcall? I assume a child is created only via fork()/exec() varients
> > and this is the reason waitpid() is not working.
>
> system("<command>") creates a child process with fork(), then the
> child process exec()s "/bin/sh -c <command>".
>
> Whether or not the process which is actually running the command is a
> child of the process which calls system() depends upon the exact
> command, and possibly upon the implementation of /bin/sh.
>
> Brief experimentation (where /bin/sh is bash-1.x) indicates that, for
> a simple command, it is a child process.

Yes I knew that.

> OTOH, if the command is run in the background (e.g. system("foo &")),
> it won't be a child process (the child process fork()s and exit()s,
> with the grandchild process running the program). Similarly, for a
> sequence of commands (separated by ";"), or a pipeline, the child will
> be the shell with the actual commands being run in grandchild
> processes.

Ahh....so this is what I wanted to know. My process would be a grandparent so 
has little/no control. I kinda thought this, but wasn't 100% sure.

> Essentially, in order for the command to be run as a (direct) child of
> the process which called system(), the shell has to be able to exec()
> the command (as with the shell's "exec" built-in). This can only be
> done for a simple command; no sequences, pipelines, subshells,
> background commands etc.
>
> > 	3. Is waiting to see when the /proc/PID directory disappears a reliable
> > solution? Does this directory die on exit() and is handled by the kernel,
> > or is this unreliable for one reason or another?
>
> At a theoretical level:
>
> 1. /proc may not be mounted (although, as an ever-increasing amount of
> software won't work without it, this is probably a remote possibility
> nowadays).

	True. Reason #1 I knew it was shaky.
> 2. The process could die and the PID could be re-used between checks.

	Very true. I wanted to avoid this at all costs.

> On a more practical level, polling is best avoided where possible, as
> it consumes CPU time. If you poll frequently, it may use a lot of CPU
> time; if you poll less frequently, you introduce delays.

Thats an excellent tip and will surely enhance my programming-to-come. Thank 
you. I was starting to see the delay/cost tradeoff as I spun on checking 
termination by open()/close() the PID file and checking open()'s exit status.

> > 	I am aware that a race/deadlock may occur if a new process takes the PID
> > of the old process I am waiting for in between the time I poll the
> > directory, however, I am at a complete loss on how to wait on this
> > process. I need a reliable indicator that the process has stopped wether
> > gracefully or dying a horrible death. Currently I am polling its PID
> > file...but that is VERY unreliable because it is not cleaned up on a
> > SIGKILL.
> >
> > Does anyone have any ideas?
>
> In general, don't use system(). It's convenient for quick hacks, but
> like most things which are convenient for quick hacks (e.g. scripting
> languages), it makes it easy to write code which sorta-kinda-works,
> but is useless for writing code which works the way it ought to.
>
> Any non-trivial program which needs to spawn subprocesses should do
> the fork+exec+<whatever else> itself.

My program has definatly grown beyond non-trivial.

> OTOH, if it's inevitable that the process in question won't actually
> be a child of the process which initiates it (e.g. because the
> subprocess will be a daemon which needs to perform a second fork to
> detach itself from the session), it would probably be better to
> implement an explicit signalling mechanism, e.g. a pipe, socket, lock
> etc.

> The simplest mechanisms involve having the child hold a resource which
> will be released automatically (by the kernel) upon termination, and
> whose release the parent can detect.
>
> Using a pipe wouldn't require any dedicated code in the child. If the
> parent creates a pipe with the child inheriting the write end and the
> parent performing a blocking read on the other end, the parent will
> get EOF when there are no longer any writers, i.e. when the child (and
> any descendents) have died.
>
> An exclusive file lock is another option. If the child obtains a lock,
> and the parent makes a blocking attempt to obtain a conflicting lock,
> the parent will block until the child releases it (which will happen
> automatically if it dies). This has the advantage that it doesn't
> matter if the child spawns children of its own, as locks aren't
> inherited across a fork(),

Thank you. You gave an excellent response and convinced me that I need a more 
explicit way of controlling my subprocesses activity. I could see this to a 
point, but without more experience, I wasn't sure of all the different 
approaches I could take. 
