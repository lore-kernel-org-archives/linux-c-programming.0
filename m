From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: error programming
Date: Fri, 14 Jan 2005 21:48:54 +0000
Message-ID: <16872.15942.283936.933958@gargle.gargle.HOWL>
References: <20050113_192122_098065.r_zaca@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050113_192122_098065.r_zaca@ig.com.br>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: r_zaca <r_zaca@ig.com.br>
Cc: linux-c-programming@vger.kernel.org


r_zaca wrote:

>   Can anybody sugest me a good documentation about how all the functions 
> related to "error treatment" on linux work? 
>   I know there is a "variable" called errno that is set when a error about 
> something happens and that I can read this value through perror, (at least I 
> think it works that way) but how it really works I have no idea. So any tip 
> on this subject will be nice. 

If you need to check for specific errors, you can just check the value
of errno, e.g.

	#include <errno.h>

	...

	if (do_something() == -1)
		if (errno != EAGAIN)
			perror("...");

The man page for a function should tell you which errors can occur.

Most of the time, you only care about whether an error occurred, not
which error.

The most common errors to check for are EAGAIN and EINTR, which
indicate "transient" errors (i.e. if you try again, the call may
succeed). EAGAIN occurs when you try to read() from a non-blocking
descriptor when no data is available. EINTR occurs if a system call is
interrupted by a signal.

If you just want to report the details to the user, you can use
perror() to print an error message to stderr which includes a
description of the last error. If you can't use perror() (e.g. if
you're reporting the error via syslog(), you can use strerror() to
obtain the description string for a given error).

In most situations, you can treat errno as a simple integer variable;
you can read its value, assign a new value, or take its address. 
However, with glibc 2.x, it's actually a macro:

	#define errno (*__errno_location ())

The reason for this is that, with multi-threaded programs, each thread
has its own "copy" of errno.

One consequence of this is that you can't take its address at compile
time, i.e.:

	static int *errno_p = &errno;

won't work.

-- 
Glynn Clements <glynn@gclements.plus.com>
