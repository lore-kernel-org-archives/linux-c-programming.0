From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: select: Interrupted system call
Date: Sat, 27 Apr 2002 16:28:35 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <15562.50083.333931.360178@cerise.nosuchdomain.co.uk>
References: <200204271503.g3RF3lF04667@fsn3.frontstreetnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200204271503.g3RF3lF04667@fsn3.frontstreetnetworks.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gerald Waugh <gwaugh@frontstreetnetworks.com>
Cc: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>


Gerald Waugh wrote:

> I am attempting to run a program that manages several tcp/ip connections
> It runs for a while then I get the subject error, also below
> select: Interrupted system call
> I think it may be because I am not handling any signals.

select() returns EINTR if a signal is caught and handled. If a signal
is caught but not handled, it will either do nothing, or terminate the
process, depending upon the signal.

> How do I fix it?

If select() indicates an error, check whether it is EINTR. If it is,
ignore it. Alternatively, you can block the signal (with sigprocmask())
for the duration of the call to select().

-- 
Glynn Clements <glynn.clements@virgin.net>
