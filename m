From: Steve Graegert <graegerts@gmail.com>
Subject: Re: errno usage.
Date: Mon, 1 Aug 2005 09:22:55 +0200
Message-ID: <6a00c8d5050801002272c713e8@mail.gmail.com>
References: <42EA448D.6080904@conectiva.com.br>
	 <17131.30968.320224.626111@cerise.gclements.plus.com>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17131.30968.320224.626111@cerise.gclements.plus.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: Luiz Fernando Capitulino <lcapitulino@conectiva.com.br>, linux-c-programming@vger.kernel.org

On 7/30/05, Glynn Clements <glynn@gclements.plus.com> wrote:
> 
> Luiz Fernando Capitulino wrote:
> 
> >   I have a question about 'errno' which I'm postponing for some
> > time: is it a bad pratice to set 'errno' by hand in libraries
> > and even in ordinary programs?
> >
> > I mean, AFAIK 'errno' was created to store error codes from system
> > calls, but it's widely used by several libraries. Sometimes is even
> > helpful to set 'errno' in the program itself, something like:
> >
> > int get_foobar_info(char *value)
> > {
> >       if (!value) {
> >               errno = EINVAL;
> >               return -1;
> >       }
> >
> > ...
> >
> >       return 0;
> > }
> >
> > Is it a bad pratice? Is there a 'limit' for 'errno' usage?
> 
> No; there's no reason you can't use errno for your own purposes.

This is acceptable for most cases but is not recommended for
multithreaded applications since two or more threads may set the
globally defined errno variable to report errors, but its use may
result it nondeterministic behavior.  POSIX avoids the use of errno
and provides for mechanisms that enable access to thread-specific
errno variables.  Most POSIX.1c functions return the error code as the
return value with a value of zero indicating success.

When using errno in a multithreaded environment (which is not
explicitly recommended by POSIX but acceptable to retain
compatibility) ISO/IEC 9945:1-1996 defines that errno.h should be
included in every source file to make sure that every thread accesses
its own errno variable to check for errors.  This is crucial to create
libraries that conform to POSIX and are reentrant.
 
> Many library functions will set errno; even if they don't set it
> explicitly, they can call libc (etc) function which can set it.

When setting errno manually it is always a good idea to store its
previous value in a temporary variable to be able to restore it when
other function/library calls read it to check for errors afterwards.

Regards

        \Steve
