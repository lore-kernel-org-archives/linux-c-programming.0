From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: select: Interrupted system call
Date: Sun, 28 Apr 2002 00:20:16 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15563.12848.736860.137599@cerise.nosuchdomain.co.uk>
References: <200204271503.g3RF3lF04667@fsn3.frontstreetnetworks.com>
	<200204271602.g3RG24F07174@fsn3.frontstreetnetworks.com>
	<15562.64140.625327.285565@cerise.nosuchdomain.co.uk>
	<200204272037.g3RKb1F18623@fsn3.frontstreetnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200204272037.g3RKb1F18623@fsn3.frontstreetnetworks.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gerald Waugh <gwaugh@frontstreetnetworks.com>
Cc: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>


Gerald Waugh wrote:

> I would really like to know why select()
> gets that  Interrupted system call

If you have "strace", that should show which signal is being caught.

-- 
Glynn Clements <glynn.clements@virgin.net>
