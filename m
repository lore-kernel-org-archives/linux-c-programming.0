From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: TRUE FALSE
Date: Sun, 23 Jun 2002 04:02:41 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15637.14929.975497.394653@cerise.nosuchdomain.co.uk>
References: <200206230221.g5N2L8x28617@fsn3.frontstreetnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200206230221.g5N2L8x28617@fsn3.frontstreetnetworks.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gerald Waugh <gwaugh@frontstreetnetworks.com>
Cc: linux-c-programming@vger.kernel.org


Gerald Waugh wrote:

> Oh, I know this is dumb
> But where is TRUE and FALSE defined

They aren't defined in any standard header; if you want them to be
defined, you have to define them yourself.

However, you should allow for the possibility that some other header
may define them, so only define them if they are undefined, i.e.

	#ifndef TRUE
	#define TRUE 1
	#endif

-- 
Glynn Clements <glynn.clements@virgin.net>
