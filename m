From: Bubulac Tatiana <bubulac@unidec.ro>
Subject: Re: SIGTERM
Date: Wed, 22 May 2002 09:20:00 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3CEB3890.2EEC90FE@unidec.ro>
References: <3CEA269D.CF8569AE@unidec.ro> <15594.22731.28513.237490@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org

That's right.

In the parent process I have the  line no 6 where it blocks.

...
1     signal (SIGTERM, die);
2     signal (SIGALRM, dummy);
...
3    for (min = 0; min < 15 && not_done; min++)
4    {
5         alarm ((unsigned int) 60); /* wait for 1 minute */
6         pid = wait (&status);    /* Wait for a process to end */
7         alarm ((unsigned int) 0); /* Reset alarm */
....
8    }

The problem is that the child process did not catch the signal. I put a
printf in the child signal handler
function.
If I give the "kill child_pid" also nothing happens. Of course if I give
"kill -9 child_pid" the child is killed
and the parent will display "Normal termination".


Glynn Clements wrote:

> Bubulac Tatiana wrote:
>
> >     I want to terminate a parent process that attach several shared
> > memory segments
> > with kill(pid, SIGTERM) but it fails to terminate.
> >     Even if I give the command from command line it fails to terminate.
> >     If I give kill -9 pid it terminates but the shred memory segments
> > remains.
> >     Why I cannot terminate it with  SIGTERM signal?
>
> Presumably the receiver has either blocked, ignored or caught SIGTERM.
>
> >     "....
> >     status = kill ((pid_t)pid, SIGTERM);
> >      printf("status = %d\n", status);
> >     ...."
> > The status is 0. The pid is correct.
>
> That only tells you that the signal was sent. It doesn't tell you what
> the receiving process did as a result; the receiving process may not
> have even received the signal by the time that kill() returns.
>
> --
> Glynn Clements <glynn.clements@virgin.net>

