From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Newbie question on malloc()
Date: Wed, 2 Jun 2004 18:18:19 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16574.3035.197139.809290@cerise.nosuchdomain.co.uk>
References: <002d01c44897$78ae58d0$de01a8c0@qnessmphibiki>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <002d01c44897$78ae58d0$de01a8c0@qnessmphibiki>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Wen Guangcheng <wen.guangcheng@cnt.sp.qnes.nec.co.jp>
Cc: linux-c-programming@vger.kernel.org


Wen Guangcheng wrote:

> I have made a daemon in which dynamic memory is gotten
> by malloc(). Does the memory get free automatically without
> free() by the deamon  when the daemon process is killed?

All memory which has been allocated to a process is released when the
process terminates.

-- 
Glynn Clements <glynn.clements@virgin.net>
