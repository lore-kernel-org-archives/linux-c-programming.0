From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Sound Programming and Signals
Date: Thu, 13 Jun 2002 22:48:00 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15625.4880.647809.617013@cerise.nosuchdomain.co.uk>
References: <20020613154108.A26285@atl.lmco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20020613154108.A26285@atl.lmco.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chuck Winters <cwinters@atl.lmco.com>
Cc: linux-c-programming@vger.kernel.org


Chuck Winters wrote:

> I am trying to write a program which get a SIGIO signal from a
> sound device, and then selects on the fd to decide if the device
> can accept write, read, exception data.  The problem is that
> it doesn't seem like the device every raises a SIGIO signal.  If
> I do a kill -SIGIO <test_pid>, my handler runs.  Anyone have any ideas?

1. Did you set the O_ASYNC flag on the descriptor, either in the call
to open(), or with a subsequent call to fcntl(fd, F_SETFL, O_ASYNC)?

2. Did you set the target process ID with fcntl(fd, F_SETOWN, pid)?

If you have done both of these, but you still don't receive SIGIO,
then I would suspect that it's a limitation of the sound card driver.

-- 
Glynn Clements <glynn.clements@virgin.net>
