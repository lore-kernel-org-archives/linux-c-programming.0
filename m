From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Implementation of read( )
Date: Mon, 26 Jan 2004 22:51:34 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16405.39414.329911.489827@cerise.nosuchdomain.co.uk>
References: <20040126201655.DBEB51E447@xprdmailfe25.nwk.excite.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040126201655.DBEB51E447@xprdmailfe25.nwk.excite.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: vintya@excite.com
Cc: linux-c-programming@vger.kernel.org


Vineet Joglekar wrote:

> I dont know if this question is relevant on this mailing list, but
> please do help me out if you can.
> 
> For my project, I need to trace the read() function call till the VFS
> level. I have read that read() makes the kernel invoke sys_read() and
> I want to do the same thing with some additional functionalities. 
> Where can i get the implementation of the read() function so that on
> the parallel lines I will be able to write my own my_read() function
> which in turn will call the sys_read() too?

read() is part of libc. However, it's just a trivial wrapper around
the corresponding system call; the "source code" in
sysdeps/unix/syscalls.list is just:

read		-	read		i:ibn	__libc_read	__read read

The glibc build system generates the corresponding read.c file from
the above line using the sysdeps/unix/make-syscalls.sh script.

If you want to see the code, the simplest solution is to build glibc.

-- 
Glynn Clements <glynn.clements@virgin.net>
