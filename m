From: crincon@et.com.mx (Cesar Rincon)
Subject: Re: accept() and signals
Date: Wed, 31 Mar 2004 17:54:24 -0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040331235424.GE24581@et.com.mx>
References: <20040331205930.GC24581@et.com.mx> <16491.17543.318847.34527@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16491.17543.318847.34527@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org

Ipsissima verba Glynn Clements:
> The default behaviour of signal() in GNU libc 2.x is the BSD
> behaviour, i.e. interrupted system calls are automatically
> restarted, and the handler isn't reset upon receipt of a signal. If
> you want system calls such as accept() to be interrupted, you should
> use sigaction() without the SA_RESTART flag.

Which works perfectly, thank you very much.

> More generally, the safest approach is to always use sigaction()
> rather than to assume a particular behaviour from signal().

And it says that much in the manual, duh.  It's just that I was using
Spanish-translated dev manpages, which are, now I know, ahem, a bit
outdated.  E.g., sigaction(2) says that SA_RESETHAND is the default
behaviour of signal()...

Oh, well.  Firing up a mail to the translators.

Thanks again.

 -CR

-- 
Ceterum censeo: SCO delenda est.
