From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Signals And Chlidren
Date: Tue, 6 Jul 2004 01:37:27 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16617.62535.705594.100506@cerise.nosuchdomain.co.uk>
References: <200407051417.03410.eric@cisu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200407051417.03410.eric@cisu.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: eric@cisu.net
Cc: linux-c-programming@vger.kernel.org


Eric Bambach wrote:

> I am now trying to learn about signals and signal handling and I have the 
> following situation. 
> 
> Main program-
> 	Child of main-
> 		1st grandchild
> 		2nd grandchild
> 
> These are children created by fork() and the grandchildren are created by 
> fork() exec(). I need a method to send SIGTERM to only the children and not 
> to a whole process group.

In which case, you need to send the signal to each process individually.

> Specifically, I have a rather obvious problem 
> problem using the code below. When I use teh command
> #kill (pid of child of main)
> The program spits MANAGER CAUGHT TERM for quite a while until it causes the 
> whole program to exit. However, I think my code has more problems because I 
> thought SIGTERM would be blocked in a SIGTERM handler, isnt it?

It depends upon how the handler was installed. If it was installed
using sigaction() with the SA_NOMASK flag, the signal can still be
received in the handler.

The SysV version of signal() uses the SA_NOMASK flag; the BSD version
doesn't. Whether signal() is the SysV or BSD version depends upon the
feature-test macros which are used (if __USE_BSD is defined, it's the
BSD version, otherwise it's the SysV version).

> Most of the documentation I have read indicates that signal handlers cannot be 
> interrupted by the signals they are handling unless otherwise specified, 
> however the long loop of CAUGHT TERM messages indicates otherwise.

No it doesn't. The signal is *blocked* while the handler is executing. 
It isn't discarded; as soon as the signal is unblocked (i.e. when the
handler returns), the signal will be delivered.

If you want the signal to be discarded, you have to set the signal's
handler to SIG_IGN.

> Is there any way to send signals to ONLY the children without having to 
> explicitly know their PID? 

Only by putting them in a separate process group; then you can send a
signal to the process group.

-- 
Glynn Clements <glynn.clements@virgin.net>
