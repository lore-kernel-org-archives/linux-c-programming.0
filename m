From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: realloc
Date: Mon, 5 Aug 2002 22:26:19 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15694.60795.709096.23045@cerise.nosuchdomain.co.uk>
References: <20020805163543.A7759@atl.lmco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020805163543.A7759@atl.lmco.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chuck Winters <cwinters@atl.lmco.com>
Cc: linux-c-programming@vger.kernel.org


Chuck Winters wrote:

> 	Anyone know why a program would freeze at realloc?

By far the most likely reasons are:

a) heap corruption, and
b) passing an invalid pointer (one which wasn't returned from malloc
(or similar), or which has since been freed.

> I thought if there was a problem, realloc would just fail.

If there is insufficient memory to satisfy a request, realloc would
fail.

OTOH, if the heap is corrupt, or if the pointer is invalid, all bets
are off; calling malloc/calloc/realloc/free etc will result in
"undefined behaviour".

-- 
Glynn Clements <glynn.clements@virgin.net>
