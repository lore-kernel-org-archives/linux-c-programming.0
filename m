From: Eric <eric@cisu.net>
Subject: Re: Multithreaded /sbin.init? Is it possible?
Date: Sun, 14 Sep 2003 13:59:43 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200309141359.43121.eric@cisu.net>
References: <200309141240.55800.eric@cisu.net> <20030914182509.GZ12661@lug-owl.de>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030914182509.GZ12661@lug-owl.de>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On Sunday 14 September 2003 01:25 pm, Jan-Benedict Glaw wrote:
> On Sun, 2003-09-14 12:40:55 -0500, Eric <eric@cisu.net>
>
> wrote in message <200309141240.55800.eric@cisu.net>:
> > Hello,
> > 	Wouldn't the Linux Boot process be speeded up if the init program was
> > multithreaded? I know a little about threads.. and I think there might be
>
> Not really if they *run*, but if they sleep...
>
True. But I remember seeing my entire boot process halt if a script doesnt 
terminate. Or are you talking about something else. I know that init scripts 
often start other programs in the background. Is this what you mean by sleep?

> > 	 Each group would only take as long and the slowest script instead of
> > the sum of the execution time of the scripts. The init would start with
> > the S1 scripts and maybe fork 3 times, wait for each to finish...., then
> > fork maybe twice for the S2 group if there are two scripts, wait for them
> > to finish...etc....
>
> Well, if each group would only take to run as long as it's longest
> running member, you'd need the CPU power to run them in parallel.
> Threads (or multiple, concurrently running /etc/initd./ scripts) would
> need several processors to really run in parallel. If you only have one
> CPU, all processes/threads would get time slices to run in.
>
> That is, in theory, their behaviour for *running*. However, init scripts
> don't "run" all the time. Some of them actually sleep. Sleeping can even
> be parallelized in a good manner with less CPUs than processes, so you
> may gain a little speed, but from sleeping-in-parallel, not from
> running-in-parallel. On the other hand, you hit the system with greater
> memory consumption which, for low-RAM machines, may force you into swap,
> which will really make you slow...
	I wasn't really concerned about RAM consumption. Im talking about speeding 
things up for a reasonably recent system such as a user desktop box which 
gets rebooted alot instead of a p133 router which never reboots.
>
> > 	Is this even possible?
>
> Well, threads (on their own) are a great thing iff
>
> 	- you've got many (identical) tasks to _do_ in parallel while
> 	  having about the same number of CPUs.
> 	- you need to wait for rare events (ie. read from serial
> 	  interfaces and the like).
>
> Threads in their own don't speed a well-written program up. They even
> have the capacity to slow you down (by requiring unneccessary task
> switches).
>
	True, I do know this much. So far its just a theory that parallelizing will 
speed up boot time on a UniProcessor machine.
	I have a SMP AthlonMP w/ 512MB ram box so running the boot in parallel is 
particularly interesting and useful to me.

> However, I've done a little test with my laptop (P2-266, 128MB RAM).
> Groupwise parallelized, taking rc2 (not rcS) takes 5sec, vs. 20sec for
> the non-parallelized traversal. But screen output now is even less
> readable than before (Ever seen HP-UX starting?)...
>
> MfG, JBG
	Lol, yea I completely understood at the outset that a simple modification of 
init would make the boot process unreadable. However I am taking it in simple 
steps and theorizing about the possible speed benifits, not the actual 
usability yet.  Could you please send me the source or a more descriptive 
e-mail on how you groupwise-parallelized init 2?  Did you modify the init 
source or did you do a little quick hacking and just run the scripts in 
parallel with bash or something?

----------------------
Eric Bambach   
Eric (at) CISU (dot) net 
----------------------
