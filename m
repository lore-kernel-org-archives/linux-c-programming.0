From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: SEGFAULT
Date: Wed, 20 Aug 2003 20:35:38 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16195.52618.542642.288213@cerise.nosuchdomain.co.uk>
References: <3F3D20F3.7030304@fi.uba.ar>
	<001301c3674c$bc7dc3c0$ed64a8c0@descartes>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <001301c3674c$bc7dc3c0$ed64a8c0@descartes>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "John T. Williams" <jtwilliams@vt.edu>
Cc: linux-c-programming@vger.kernel.org


John T. Williams wrote:

>     I can't figure out why this code sigfaults when it exits.
> gdb only tells me
> 
> Program received signal SIGSEGV
> 0xda64a8c0 in ? ()
> 
> and shows the step as being the final "}"  in main ().

Sandro has already pointed out some likely causes of the segfault.

However, the above GDB output suggests that you compiled the program
either without debug info (without -g), or without a frame pointer
(with -fomit-frame-pointer), or that you subsequently stripped the
debug info (e.g. with the -s linker switch).

If you want to be able to debug a program, use the -g switch for both
compilation and linking, and don't use any optimisation switches.

-- 
Glynn Clements <glynn.clements@virgin.net>
