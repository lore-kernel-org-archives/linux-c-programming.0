From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: SIGTERM
Date: Tue, 21 May 2002 15:25:15 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15594.22731.28513.237490@cerise.nosuchdomain.co.uk>
References: <3CEA269D.CF8569AE@unidec.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3CEA269D.CF8569AE@unidec.ro>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bubulac Tatiana <bubulac@unidec.ro>
Cc: linux-c-programming@vger.kernel.org


Bubulac Tatiana wrote:

>     I want to terminate a parent process that attach several shared
> memory segments
> with kill(pid, SIGTERM) but it fails to terminate.
>     Even if I give the command from command line it fails to terminate.
>     If I give kill -9 pid it terminates but the shred memory segments
> remains.
>     Why I cannot terminate it with  SIGTERM signal?

Presumably the receiver has either blocked, ignored or caught SIGTERM.

>     "....
>     status = kill ((pid_t)pid, SIGTERM);
>      printf("status = %d\n", status);
>     ...."
> The status is 0. The pid is correct.

That only tells you that the signal was sent. It doesn't tell you what
the receiving process did as a result; the receiving process may not
have even received the signal by the time that kill() returns.

-- 
Glynn Clements <glynn.clements@virgin.net>
