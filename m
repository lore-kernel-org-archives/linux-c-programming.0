From: Steve Graegert <graegerts@gmail.com>
Subject: Re: errno usage.
Date: Mon, 1 Aug 2005 11:46:52 +0200
Message-ID: <6a00c8d50508010246197ddabc@mail.gmail.com>
References: <42EA448D.6080904@conectiva.com.br>
	 <17131.30968.320224.626111@cerise.gclements.plus.com>
	 <6a00c8d5050801002272c713e8@mail.gmail.com>
	 <17134.184.280815.897955@cerise.gclements.plus.com>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17134.184.280815.897955@cerise.gclements.plus.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: Luiz Fernando Capitulino <lcapitulino@conectiva.com.br>, linux-c-programming@vger.kernel.org

On 8/1/05, Glynn Clements <glynn@gclements.plus.com> wrote:
> 
> Steve Graegert wrote:
> 
> > > > Is it a bad pratice? Is there a 'limit' for 'errno' usage?
> > >
> > > No; there's no reason you can't use errno for your own purposes.
> >
> > This is acceptable for most cases but is not recommended for
> > multithreaded applications since two or more threads may set the
> > globally defined errno variable to report errors, but its use may
> > result it nondeterministic behavior.
> 
> In GNU libc 2.x, errno is a macro which refers to a thread-specific
> location.

OK.  Thanks for the update.

> > When using errno in a multithreaded environment (which is not
> > explicitly recommended by POSIX but acceptable to retain
> > compatibility) ISO/IEC 9945:1-1996 defines that errno.h should be
> > included in every source file to make sure that every thread accesses
> > its own errno variable to check for errors.  This is crucial to create
> > libraries that conform to POSIX and are reentrant.
> 
> Just to clarify: if you read or set errno, you have to include
> <errno.h>; don't use "extern int errno" (which will work on some
> systems, but not with glibc).

Agree.  Lots of ancient SYSV code I have worked on a couple of months
ago caused a lot of headaches because of "extern int errno" statements
that turned out to cause even more confusion when used in
multithreaded environments.  Nice to read that glibc is properly
prepared.

Regards

        \Steve
