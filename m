From: "John T. Williams" <jowillia@vt.edu>
Subject: Re: Newbie question on malloc()
Date: Thu, 03 Jun 2004 18:25:55 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1086301555.22497.0.camel@localhost>
References: <002d01c44897$78ae58d0$de01a8c0@qnessmphibiki>
	 <20040603012832.GC2562@luna.mooo.com>
	 <16574.55886.797709.765778@cerise.nosuchdomain.co.uk>
Reply-To: jtwilliams@vt.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16574.55886.797709.765778@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn.clements@virgin.net>
Cc: Micha Feigin <michf@post.tau.ac.il>, linux-c-programming <linux-c-programming@vger.kernel.org>


I think this is may be a somewhat misleading statement. Not freeing
memory before normal termination decreases re-usability of your code.
You never know when your main function might be reused verbatim as
another sub function. Failing to free memory before all reference leave
scope can lead to massive memory leeks. Further, the more memory your
program is holding at any given moment of operation the more pages it
holds, the more pages it holds the more likely any particular call to a
memory location will lead to a page fault, and page faults are
expensive. Freeing memory allows malloc to reassign that memory next
time its called. Now I know that this was a question about freeing
memory before termination, and therefore unless we are talking about a
situation where your code is being reused my last two arguments hold no
weight, but I believe that it is simply good practice to always be aware
of memory you have dynamically allocated and always free it after you no
more use for it. In this way you don't get used to saying well if I miss
it the operating system will clean it up for me. Please note I do not
suggest that one should go to out of the way to free memory on abnormal
termination, but its simply good practice to free memory when it is no
longer being used in the normal behavior of your code. 



On Thu, 2004-06-03 at 03:59, Glynn Clements wrote:
> Micha Feigin wrote:
> 
> > > I have made a daemon in which dynamic memory is gotten
> > > by malloc(). Does the memory get free automatically without
> > > free() by the deamon  when the daemon process is killed?
> > > Thanks in advance.
> > 
> > It does, but in general its not in good practice to count on process
> > exit for freeing memory (a good way to get memory leaks).
> 
> This is incorrect.
> 
> You shouldn't make an effort to return memory to the process' heap (by
> calling free()) if the program is about to terminate.
> 
> Doing so consumes CPU time (and probably disk bandwidth, given that
> some of that memory will probably be swapped out) and doesn't provide
> any benefit (free() won't usually return memory to the OS and, in any
> case, all of the process' memory will be returned to the OS upon
> exit).
> 
> The only valid reason for free()ing memory blocks upon termination is
> if the structure of the program is such that it isn't practical to
> avoid doing so. E.g. if data structures have matched setup/cleanup
> routines, and you need to call the cleanup code for other reasons, and
> the cleanup code will free the memory anyway.
> 
> Similarly, you don't need to explicitly close() file descriptors, or
> release file locks (those obtained with flock/lockf/fcntl) as the OS
> will do that.
> 
> The sort of actions which might make sense to perform before calling
> exit() are:
> 
> + Writing a log entry reporting shutdown
> + Deleting temporary files
> + Deleting any SysV IPC structures which aren't shared with other
>   processes.
> + Informing other networked processes of termination, e.g. sending a
>   "QUIT" command.
> + Killing child processes.

