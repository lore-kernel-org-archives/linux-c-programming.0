From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: strange segmentation fault in malloc()
Date: Wed, 8 Jan 2003 00:38:10 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15899.29426.273829.766576@cerise.nosuchdomain.co.uk>
References: <Pine.LNX.4.33.0301071646230.5493-100000@soochak.ncst.ernet.in>
	<15899.2594.867274.281756@cerise.nosuchdomain.co.uk>
	<012c01c2b6a6$9778d4e0$70ab88c1@ieeta.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <012c01c2b6a6$9778d4e0$70ab88c1@ieeta.pt>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: qhwang <qhwang@ieeta.pt>
Cc: linux-c-programming@vger.kernel.org


qhwang wrote:

> My app wants to read and then wavelet-transform image one by one. Now I got
> a strange segmentation fault in malloc().  The situation is only the first
> image can be processed successfully, but the second one fails due to the
> same call of "malloc(160*120*sizeof(float))" used in the processing of the
> first image. The return value of "malloc" is NULL . So how can I check the
> size of heap used by the system?

In bash, "ulimit -a" will report the resource limits. However, the
malloc() function in GNU libc isn't restricted to the size of the data
segment, as it can obtain memory using "anonymous mmap()".

In any case, it's unlikely that you are really running out of memory
(160*120*sizeof(float) is only 75Kb). Unusual malloc() failures (i.e. 
failures which occur when you aren't using vast amounts of memory) are
usually caused by the heap's data structures being corrupted because
part of the code modified memory outside of the allocated block.

> Or how can I set the environment varible
> "MALLOC_CHECK_"? Someone said it can be set in the rc.sysinit, but I can't
> find this file. Any suggestion will be greatly appreciated. Many Thanks!

You can set environment variables in bash using "export", e.g.

	export MALLOC_CHECK_=1

Setting an environment variable affects all process which inherit from
the shell in which it was set.

-- 
Glynn Clements <glynn.clements@virgin.net>
