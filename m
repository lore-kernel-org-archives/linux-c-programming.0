From: Eric Bambach <eric@cisu.net>
Subject: Re: Signals And Chlidren
Date: Mon, 5 Jul 2004 22:33:56 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200407052233.56488.eric@cisu.net>
References: <200407051417.03410.eric@cisu.net> <16617.62535.705594.100506@cerise.nosuchdomain.co.uk>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16617.62535.705594.100506@cerise.nosuchdomain.co.uk>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org

On Monday 05 July 2004 07:37 pm, Glynn Clements wrote:
> Eric Bambach wrote:
> > I am now trying to learn about signals and signal handling and I have the
> > following situation.
> >
> > Main program-
> > 	Child of main-
> > 		1st grandchild
> > 		2nd grandchild
> >
> > These are children created by fork() and the grandchildren are created by
> > fork() exec(). I need a method to send SIGTERM to only the children and
> > not to a whole process group.
>
> In which case, you need to send the signal to each process individually.

Unfortunatly.

> > Specifically, I have a rather obvious problem
> > problem using the code below. When I use teh command
> > #kill (pid of child of main)
> > The program spits MANAGER CAUGHT TERM for quite a while until it causes
> > the whole program to exit. However, I think my code has more problems
> > because I thought SIGTERM would be blocked in a SIGTERM handler, isnt it?
>
> It depends upon how the handler was installed. If it was installed
> using sigaction() with the SA_NOMASK flag, the signal can still be
> received in the handler.

Yes. This co-incides on the documentation I read.
> The SysV version of signal() uses the SA_NOMASK flag; the BSD version
> doesn't. Whether signal() is the SysV or BSD version depends upon the
> feature-test macros which are used (if __USE_BSD is defined, it's the
> BSD version, otherwise it's the SysV version).
>
> > Most of the documentation I have read indicates that signal handlers
> > cannot be interrupted by the signals they are handling unless otherwise
> > specified, however the long loop of CAUGHT TERM messages indicates
> > otherwise.
>
> No it doesn't. The signal is *blocked* while the handler is executing.
> It isn't discarded; as soon as the signal is unblocked (i.e. when the
> handler returns), the signal will be delivered.

Ahhh I see. Silly me.

>
> If you want the signal to be discarded, you have to set the signal's
> handler to SIG_IGN.
>
> > Is there any way to send signals to ONLY the children without having to
> > explicitly know their PID?
>
> Only by putting them in a separate process group; then you can send a
> signal to the process group.

Hmmm. Interesting. I never thought of that. Is there a subset of system calls 
that can manipulate processs groups? Im not too familiar with this concept, 
or even know a concrete definition of  a process group. I am assuming a 
process group is a process and all its descendents including children, 
grandchildren etc. unless they get reparented from orphaning or something 
like that.

But, in my example, if I made the child of main the leader of a new process 
group, wouldnt it lose its child status under the original program and the 
original program's ability to wait() on it? Meaning....it would now be a 
child of init right?

In case the list was wondering, I resolved my problem by creating a linked 
list global to the file. It contains the PID of the child and the PID of the 
parent. When the process creates a child, it registers it in the list, and 
when it needs to kill a child, it finds out who its the parent for and issues 
a kill, and removes that child from the list. 

After an hour or so  of research this solution came up on some faq from a 
google search.

-- 

-EB
