From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: about posix threads.
Date: Tue, 20 May 2003 17:12:38 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16074.21494.249431.469578@cerise.nosuchdomain.co.uk>
References: <3EC9C22B.9090100@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3EC9C22B.9090100@hq.ntsp.nec.co.jp>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Lejanson C. Go" <lejanson@ntsp.nec.co.jp>
Cc: linux-c-programming@vger.kernel.org


Lejanson C. Go wrote:

> i made a pthread program and i am quite puzzled why my program
> spawns 4 threads.. when i view it in linux console.
> 
> i used 'ps -ax | grep myprog' command to get the processes for
> my application and to my surprise it spawns 4 threads.. when i
> only expected 3.. one for main, one for event, and one for recvdata.
> 
> spawnXXXXXX functions create new threads..
> 
> i really need ur help. can anyone tell me why this occur?

If you use "ps axf", you will note that the additional thread is the
parent of all threads other than the main thread. This is just
something that the pthread library does; it doesn't indicate a bug in
your program.

I don't recall the precise reasons why the pthread library does this,
but it's related to limitations in the kernel's support for threads.

-- 
Glynn Clements <glynn.clements@virgin.net>
