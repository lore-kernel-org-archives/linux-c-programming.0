From: crincon@et.com.mx (Cesar Rincon)
Subject: accept() and signals
Date: Wed, 31 Mar 2004 14:59:30 -0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040331205930.GC24581@et.com.mx>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi.

I have a program that installs a handler for SIGINT and SIGTERM (using
signal(), not sigaction()).  This handler only sets a global flag and
returns.  The flag is checked elsewhere to initiate a graceful
shutdown.  The program is not multithreaded.

When the program is blocked on a call to accept(), and a signal is
received, I would expect my handler to execute, and also accept() to
return immediately with EINTR, allowing me to check my flag, etc.
Actually, when compiled in AIX, it behaves precisely that way.

However, in Linux (2.6.3), the handler is in fact executed, but
accept() does not seem to unblock.  Thus my program does not shutdown
until a new connection is accepted.

I feel like I fell into some obvious and documented gotcha, but I
really can not see what it is that I'm doing wrong, and Google is not
helping.  Is this the expected behaviour of accept(), in Linux?

 -CR

-- 
Ceterum censeo: SCO delenda est.
