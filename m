From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: error in system call
Date: Fri, 14 Jun 2002 14:33:44 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15625.61624.177650.67064@cerise.nosuchdomain.co.uk>
References: <15625.53237.281675.577454@cerise.nosuchdomain.co.uk>
	<Pine.LNX.4.33.0206141741010.3018-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0206141741010.3018-100000@soochak.ncst.ernet.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Cc: linux-c-prog <linux-c-programming@vger.kernel.org>


Mohammed Khalid Ansari wrote:

> > > I have seen many source code and almost all code conatain something like
> > > this , if the system call fails, then print the error message and quit (eg
> > > fork error, malloc error etc.)
> > > 
> > > ####
> > > 
> > > if ((pid = fork()) < 0)
> > > {
> > > 	perror ("fork error");
> > > 	exit (1);
> > > }
> > > ####
> > > 
> > > That means, if the kernel can not fork or malloc the memory then the 
> > > program will simply quit. Can it be not dangerous. Suppose this sort of 
> > > programs in real time working fine as daemons but after some days, it 
> > > happens that the kernel is not able to allocate the memory or fork, the 
> > > program will simply quit. Is it not dangerous?
> > 
> > If the process is unable to obtain a necessary resource, e.g. memory,
> > it may not be able to do anything other than quit.
> > 
> > > Instead can we not write the code in a better way like the following....
> > > 
> > > while ( (pid = fork()) < 0 );
> > > 
> > > in this case it will keep on trying to fork till it succeeds. Is that a 
> > > true piece of code?
> > 
> > How do you know that the fork() will eventually succeed?
> > 
> > Maybe the process table is full with processes which are waiting for a
> > response from your daemon. Or maybe it's full with processes which you
> > daemon has previously spawned, and which, even after they terminate,
> > won't go away until their parent wait()s for them; which won't happen
> > if the parent is stuck in a loop trying to fork() another process.
> 
> While waiting in the while loop to fork(), it migth happen that the kernel
> releases its process entries belonging to SOME OTHER processes from the
> process table and then while loop return with successful fork(); 

Sure. But:

1. If process table entries are sufficiently scarce that the fork()
failed the first time, should this particular program get the next
available entry? Or should it quit, allowing its resources to be used
by something more important?

2. There are other reasons why fork() might fail. E.g. the process
itself has caused RLIMIT_NPROC to be exceeded; in which case, fork()
will continue to fail until some child processes die and the parent
reaps them (which will only happen if it calls wait() etc).

There are two main issues in determining how to handle a failed system
call.

1. Whether the problem is transient, i.e. whether subsequent attempts
are more likely to succeed. It isn't usually possible to determine
this accurately, and any guess will be wrong at least some of the
time.

2. If the call involves allocation of some limited resource (and many
calls may require memory allocation), should the program release
resources, or keep trying to obtain more?

In the case of fork(), if the problem is related to memory
availability, you almost certainly *shouldn't* continue trying to
fork(). The fork() may well succeed once there's just enough memory to
complete the fork() but, if the VM system overcommits (as is currently
the case for linux) the child process will probably fail as soon as it
starts trying to modify memory; and you can't catch that.

More generally, if a resource allocation request fails, the program
should normally just give up. If it tries to continue, often it will
just keep encountering resource allocation failures, effectively
grinding to a halt. All of this time, it will be tying up resources
without any benefit.

Programs which need to continue running in spite of resource
starvation really need to be designed to have constant resource
requirements, and allocate all necessary resources at startup.

-- 
Glynn Clements <glynn.clements@virgin.net>
