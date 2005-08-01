From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: errno usage.
Date: Mon, 1 Aug 2005 12:00:08 +0100
Message-ID: <17134.184.280815.897955@cerise.gclements.plus.com>
References: <42EA448D.6080904@conectiva.com.br>
	<17131.30968.320224.626111@cerise.gclements.plus.com>
	<6a00c8d5050801002272c713e8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d5050801002272c713e8@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Graegert <graegerts@gmail.com>
Cc: Luiz Fernando Capitulino <lcapitulino@conectiva.com.br>, linux-c-programming@vger.kernel.org


Steve Graegert wrote:

> > > Is it a bad pratice? Is there a 'limit' for 'errno' usage?
> > 
> > No; there's no reason you can't use errno for your own purposes.
> 
> This is acceptable for most cases but is not recommended for
> multithreaded applications since two or more threads may set the
> globally defined errno variable to report errors, but its use may
> result it nondeterministic behavior.

In GNU libc 2.x, errno is a macro which refers to a thread-specific
location.

> When using errno in a multithreaded environment (which is not
> explicitly recommended by POSIX but acceptable to retain
> compatibility) ISO/IEC 9945:1-1996 defines that errno.h should be
> included in every source file to make sure that every thread accesses
> its own errno variable to check for errors.  This is crucial to create
> libraries that conform to POSIX and are reentrant.

Just to clarify: if you read or set errno, you have to include
<errno.h>; don't use "extern int errno" (which will work on some
systems, but not with glibc).

-- 
Glynn Clements <glynn@gclements.plus.com>
