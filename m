From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: question on select.
Date: Thu, 18 Dec 2003 03:53:26 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16353.9398.996015.454122@cerise.nosuchdomain.co.uk>
References: <3FE10020.6050200@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3FE10020.6050200@hq.ntsp.nec.co.jp>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Lejanson C. Go" <lejanson@ntsp.nec.co.jp>
Cc: linux-c-programming@vger.kernel.org


Lejanson C. Go wrote:

> i have a question about the select()
> function.
> 
> when should we set timeout parameter
> into NULL? what is the difference of
> putting timeout (0, 0) OR putting NULL
> as parameter?

Passing NULL for the timeout parameter will cause select() to wait
indefinitely. It won't return until either one of the descriptors is
ready or it's interrupted by a signal. The return value will never be
zero (it will return a positive value if a descriptor is ready or -1
if it is interrupted).

Passing a pointer to a zero interval (tv_sec == tv_usec == 0) will
cause select() to return immediately, even if no descriptors are ready
(in which case, the return value will be zero and all of the
descriptor sets will be empty).

-- 
Glynn Clements <glynn.clements@virgin.net>
