From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: accept() and signals
Date: Wed, 31 Mar 2004 23:21:59 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16491.17543.318847.34527@cerise.nosuchdomain.co.uk>
References: <20040331205930.GC24581@et.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040331205930.GC24581@et.com.mx>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Cesar Rincon <crincon@et.com.mx>
Cc: linux-c-programming@vger.kernel.org


Cesar Rincon wrote:

> I have a program that installs a handler for SIGINT and SIGTERM (using
> signal(), not sigaction()).  This handler only sets a global flag and
> returns.  The flag is checked elsewhere to initiate a graceful
> shutdown.  The program is not multithreaded.
> 
> When the program is blocked on a call to accept(), and a signal is
> received, I would expect my handler to execute, and also accept() to
> return immediately with EINTR, allowing me to check my flag, etc.
> Actually, when compiled in AIX, it behaves precisely that way.
> 
> However, in Linux (2.6.3), the handler is in fact executed, but
> accept() does not seem to unblock.  Thus my program does not shutdown
> until a new connection is accepted.
> 
> I feel like I fell into some obvious and documented gotcha, but I
> really can not see what it is that I'm doing wrong, and Google is not
> helping.  Is this the expected behaviour of accept(), in Linux?

There are two distinct flavours of signal() semantics: BSD and SysV. 
The BSD version is equivalent to using sigaction() with an sa_flags
value of SA_RESTART, while the SysV version is equivalent to using
sigaction() with an sa_flags value of SA_RESETHAND|SA_NODEFER.

The default behaviour of signal() in GNU libc 2.x is the BSD
behaviour, i.e. interrupted system calls are automatically restarted,
and the handler isn't reset upon receipt of a signal. If you want
system calls such as accept() to be interrupted, you should use
sigaction() without the SA_RESTART flag.

More generally, the safest approach is to always use sigaction()
rather than to assume a particular behaviour from signal().

-- 
Glynn Clements <glynn.clements@virgin.net>
