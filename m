From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: quotactl
Date: Thu, 3 Jul 2003 19:48:02 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16132.31330.576179.809295@cerise.nosuchdomain.co.uk>
References: <16131.21093.151750.179494@cerise.nosuchdomain.co.uk>
	<Pine.LNX.4.44.0307031212050.11040-100000@gpu.utcc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0307031212050.11040-100000@gpu.utcc>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Francis Lau <fkwlau@utcc.utoronto.ca>
Cc: linux-c-programming@vger.kernel.org


Francis Lau wrote:

> I have tried everything you guys suggested but am still unable to get 
> quotactl to work.  For some reason, quotactl always returns a 0.  I have 
> traced through fs/quota.c

fs/quota.c?

> and I think the code always gets to the 'return 0' part 
> in the do_quotactl function:

do_quotactl?

> case Q_GETQUOTA: {
>              struct if_dqblk idq;
> 
>             if ((ret = sb->s_qcop->get_dqblk(sb, type, id, &idq)))
>                       return ret;
>             if (copy_to_user(addr, &idq, sizeof(idq)))
>                       return -EFAULT;
>             return 0;
> }

I don't recognise this code, but looking around on the 'net suggests
that fs/quota.c and do_quotactl are from 2.5.x. I'm not using 2.5.x,
and I'm not about to download a 30Mb file to look into this.

Is this a vendor-modified kernel? Maybe the vendor has back-ported the
2.5.x quota code into their 2.4.x kernels for some reason (e.g. the
16-bit UID issue below)?

If you're using vendor-modified code, you might need to ask on a list
which is specific to that vendor's product. At the very least, you
need to give people a clue about which code you are using.

> This is the test code I am using:
> 
> #include <stdio.h>
> #include <stdlib.h>
> #include <errno.h>
> #include <linux/quota.h>
> 
> main ()
> {
> 	int i, cmd;
> 	struct mem_dqblk mydq;
> 
> 	cmd = QCMD(Q_GETQUOTA,USRQUOTA);
> 	i=quotactl (cmd, "/dev/md5", 70557, &mydq);

This won't work with the standard 2.4.x quota code; the UID has to fit
into 16 bits, otherwise the call will fail with EINVAL.

-- 
Glynn Clements <glynn.clements@virgin.net>
