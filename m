From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Blocking malloc
Date: Fri, 12 Apr 2002 14:45:58 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15542.58646.38077.906892@cerise.nosuchdomain.co.uk>
References: <OFB9F55B95.377592BA-ON65256B98.00203191@pune.tcs.co.in>
	<3CB53B3D.7CA9ABFB@cs.unt.edu>
	<OFAFF88BC7.76BF951B-ON65256B99.0042F7D4@pune.tcs.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <OFAFF88BC7.76BF951B-ON65256B99.0042F7D4@pune.tcs.co.in>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: hemantm@pune.tcs.co.in
Cc: linux-c-programming@vger.kernel.org


Hemant Mohan wrote:

> Using strace I got some clue.
> 
> strace output shows a Segmentation fault when malloc is called. That means 
> that the stack size is smaller than what is required, and kernel is unable to 
> extend the stack size.

No. malloc() allocates from the heap, not the stack. If the segfault
occurs within malloc() (rather than malloc() returning NULL and the
program trying to read/write address zero), then the heap has become
corrupted.

> As I am not trapping any signals in my thread so it I 
> am unable to trace it otherwise.

> Is there any way I can calulate the stack size required. Currently I am 
> letting the system decide the stack size. Is it possible to change the stack 
> size of the  thread dynamically during runtime.

No. Thread stacks are automatically extended upon demand, up to a hard
limit of 2Mb.

-- 
Glynn Clements <glynn.clements@virgin.net>
