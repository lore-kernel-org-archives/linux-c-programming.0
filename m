From: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Subject: Re: error in system call
Date: Fri, 14 Jun 2002 17:44:57 +0530 (IST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0206141741010.3018-100000@soochak.ncst.ernet.in>
References: <15625.53237.281675.577454@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <15625.53237.281675.577454@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn.clements@virgin.net>
Cc: "Earl R. Lapus" <elapus@ntsp.nec.co.jp>, linux-c-prog <linux-c-programming@vger.kernel.org>


On Fri, 14 Jun 2002, Glynn Clements wrote:

> 
> Earl R. Lapus wrote:
> 
> > I have seen many source code and almost all code conatain something like
> > this , if the system call fails, then print the error message and quit (eg
> > fork error, malloc error etc.)
> > 
> > ####
> > 
> > if ((pid = fork()) < 0)
> > {
> > 	perror ("fork error");
> > 	exit (1);
> > }
> > ####
> > 
> > That means, if the kernel can not fork or malloc the memory then the 
> > program will simply quit. Can it be not dangerous. Suppose this sort of 
> > programs in real time working fine as daemons but after some days, it 
> > happens that the kernel is not able to allocate the memory or fork, the 
> > program will simply quit. Is it not dangerous?
> 
> If the process is unable to obtain a necessary resource, e.g. memory,
> it may not be able to do anything other than quit.
> 
> > Instead can we not write the code in a better way like the following....
> > 
> > while ( (pid = fork()) < 0 );
> > 
> > in this case it will keep on trying to fork till it succeeds. Is that a 
> > true piece of code?
> 
> How do you know that the fork() will eventually succeed?
> 
> Maybe the process table is full with processes which are waiting for a
> response from your daemon. Or maybe it's full with processes which you
> daemon has previously spawned, and which, even after they terminate,
> won't go away until their parent wait()s for them; which won't happen
> if the parent is stuck in a loop trying to fork() another process.

While waiting in the while loop to fork(), it migth happen that the kernel
releases its process entries belonging to SOME OTHER processes from the
process table and then while loop return with successful fork(); 

Is that not right?

> 
> More generally, this situation is known as deadlock. Two (or more)
> processes are stalled, each waiting for a resource which is held by
> the other. The situation will only be resolved if one of the processes
> gives up, and releases the resource which it holds without having
> obtained the resource which it desired.
> 
> In general, if a system call fails due to insufficient resources, the
> application should probably respond by releasing some resources, i.e. 
> by terminating.
> 
> 

