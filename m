From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Newbie question on malloc()
Date: Wed, 2 Jun 2004 18:41:03 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16574.4399.288522.256729@cerise.nosuchdomain.co.uk>
References: <002d01c44897$78ae58d0$de01a8c0@qnessmphibiki>
	<1086196092.29970.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1086196092.29970.2.camel@localhost>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jtwilliams@vt.edu
Cc: Wen Guangcheng <wen.guangcheng@cnt.sp.qnes.nec.co.jp>, linux-c-programming <linux-c-programming@vger.kernel.org>


John T. Williams wrote:

> As I understand it, that is entirely up to the operation system.  Linux
> and NT Kernel systems do reclaim unfreed memory, however I believe one
> the major problems with Win98 was that it did not.
> 
> Anyone with more information feel free to correct me

I very much doubt that the above is accurate.

It may be that Win98 had some specific memory leaks, but any OS which,
in the general case, failed to recover a process' memory upon
termination would run out of memory very quickly.

-- 
Glynn Clements <glynn.clements@virgin.net>
