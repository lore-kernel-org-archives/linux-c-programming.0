From: Eric Bambach <eric@cisu.net>
Subject: Signals And Chlidren
Date: Mon, 5 Jul 2004 14:17:03 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200407051417.03410.eric@cisu.net>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello,

	I am now trying to learn about signals and signal handling and I have the 
following situation. 

Main program-
	Child of main-
		1st grandchild
		2nd grandchild

These are children created by fork() and the grandchildren are created by 
fork() exec(). I need a method to send SIGTERM to only the children and not 
to a whole process group. Specifically, I have a rather obvious problem 
problem using the code below. When I use teh command
#kill (pid of child of main)
The program spits MANAGER CAUGHT TERM for quite a while until it causes the 
whole program to exit. However, I think my code has more problems because I 
thought SIGTERM would be blocked in a SIGTERM handler, isnt it?

Most of the documentation I have read indicates that signal handlers cannot be 
interrupted by the signals they are handling unless otherwise specified, 
however the long loop of CAUGHT TERM messages indicates otherwise.

Is there any way to send signals to ONLY the children without having to 
explicitly know their PID? 

If the child recieves SIGTERM, I want to SIGTERM the grandchildren to make 
sure they stop+cleanup instead of continuing and being reparented to init.

I probably have other problems too ;). Let me know if you need more 
information.
-----------------CODE-------------

void SigTermHandler(int value)
{

#ifdef DEBUG
  cerr << "MANAGER CAUGHT TERM" << endl;
#endif
  kill((pid_t)0,SIGTERM); 
}
-----------------END CODE-------------

Thank you for your time.

-- 
-EB
