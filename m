From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: SIGTERM
Date: Wed, 22 May 2002 15:18:50 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15595.43210.911536.966345@cerise.nosuchdomain.co.uk>
References: <3CEA269D.CF8569AE@unidec.ro>
	<15594.22731.28513.237490@cerise.nosuchdomain.co.uk>
	<3CEB3890.2EEC90FE@unidec.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3CEB3890.2EEC90FE@unidec.ro>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bubulac Tatiana <bubulac@unidec.ro>
Cc: linux-c-programming@vger.kernel.org


Bubulac Tatiana wrote:

> In the parent process I have the  line no 6 where it blocks.
> 
> ...
> 1     signal (SIGTERM, die);
> 2     signal (SIGALRM, dummy);
> ...
> 3    for (min = 0; min < 15 && not_done; min++)
> 4    {
> 5         alarm ((unsigned int) 60); /* wait for 1 minute */
> 6         pid = wait (&status);    /* Wait for a process to end */
> 7         alarm ((unsigned int) 0); /* Reset alarm */
> ....
> 8    }
> 
> The problem is that the child process did not catch the signal. I put a
> printf in the child signal handler
> function.
> If I give the "kill child_pid" also nothing happens.

That suggests that the child *is* catching the signal. If the child
didn't catch SIGTERM, it would die.

Try changing the child's signal handler to call fflush(), or to use
write() instead of printf().

-- 
Glynn Clements <glynn.clements@virgin.net>
