From: Eric <eric@cisu.net>
Subject: Re: Multithreaded /sbin.init? Is it possible?
Date: Sun, 14 Sep 2003 13:59:50 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200309141359.50596.eric@cisu.net>
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

> However, I've done a little test with my laptop (P2-266, 128MB RAM).
> Groupwise parallelized, taking rc2 (not rcS) takes 5sec, vs. 20sec for
> the non-parallelized traversal. But screen output now is even less
> readable than before (Ever seen HP-UX starting?)...

	I just had tought after sending my previous e-mail. Would it be possible to 
capture the output of the programs being run? Like each thread would capture 
the output of the program it runs without being printed to the screen and 
then when the thread terminates the main program writes it to the screen. 
That would make the entire message of the program being run atomic and thus 
eliminate odd echo's out of place and done messages conflicting with others. 
Although the messages from each group might be printed in an undefined order, 
you would still get the complete message.
	

----------------------
Eric Bambach   
Eric (at) CISU (dot) net 
----------------------
