From: Francis Lau <fkwlau@utcc.utoronto.ca>
Subject: Re: what causes SIGTERMs?
Date: Tue, 8 Jul 2003 09:26:46 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0307080924030.17500-100000@gpu.utcc>
References: <00be01c34553$57ea97a0$caba0ba4@uwe.ac.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <00be01c34553$57ea97a0$caba0ba4@uwe.ac.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Studley <matthew.studley@uwe.ac.uk>
Cc: linux-c-programming@vger.kernel.org

A link that gives a simple explanation on what SIGTERM and SIGKILL mean:
http://www.gnu.org/manual/glibc-2.2.5/html_node/Termination-Signals.html

> 
> I wonder whether you could help me?  I have a problem; I'm running an
> application I've written in C under Slackware 7.1  Occasionally it receives
> a SIGTERM.
> 
> * In what circumstances do processes get sent a SIGTERM?
> 
> * Am I correct that this is unlikely to be issued in response to a bug in my
> code?
> 
> * How can I find which process is issuing the SIGTERM against my code?

Perhaps use strace or gdb to see where the code is dying?

> 
> * Are there any changes I can make to the execution environment / logging /
> gcc compilation options to help me find out why this is happening?

compiel with -g for more debugging information

Hope it helps,

Francis


