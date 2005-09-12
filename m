From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Confusing Prototype
Date: Mon, 12 Sep 2005 18:36:04 +0200
Message-ID: <6a00c8d5050912093622607b44@mail.gmail.com>
References: <432470B7.7050609@colannino.org> <dg3sd3$cd7$1@sea.gmane.org>
Reply-To: graegerts@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <dg3sd3$cd7$1@sea.gmane.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: _z33 <timid.Gentoo@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On 9/12/05, _z33 <timid.Gentoo@gmail.com> wrote:
> James Colannino wrote:
> > Hey everyone.  I was looking at the prototype for fgets and noticed the
> > following:
> >
> > char *fgets(char *s, int size, FILE *stream);
> >
> > I'm confused because it says that it returns a pointer to a character,
> > but at the same time it stores a string at the address pointed to by
> > char *s, so why does it also need to return a pointer?  I'm confused.
> 
>   please correct me if I'm wrong. As far as I know, you need a
> mechanism to find out if fgets, executed perfectly or not, and that's
> the primary reason it returns a value. When fgets fails to read from the
> stream specified it returns a null pointer to indicate the error. The
> string in the argument list of the function however, will have the value
> till which execution proceeded without error. (hope I'm right about this)
> 
>   If in case the returning pointer, was avoided, then the error
> couldn't be properly indicated. And the only way will be to modify the
> input string container itself. This could create an ambiguity, if the
> input file or stream had nothing but a null value. The programmer might
> not be able to differentiate whether an error occured or whether input
> was null.

Sorry, I do not fully agree.  NULL is also returned when the system
encountered EOF.   SUSv3 says that if EOF or an error occurred the
stream's EOF/error indicator is set, which means that to make sure
what happened you will have to call ferror and feof anyway.  In both
cases the buffer is left unchanged.

From this point of view, returning an int indicating an error and EOF
with a value of 0 and the number of bytes read otherwise would be
sufficient.  One could then write

	while (fgets(buf, BUFSIZE, stream) > 0)  { /* do some stuff */ }

For me, it is an academic discussion and I can live with the current
solution quite well.  Besides this, I have had the opportunity to
implement parts of an IO library for an embedded project and we have
chosen not to return a pointer to the input buffer but the number of
bytes actually read or 0 on EOF or error.  It was possible since
everything was written from scratch, so nothing broke.

Regards

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultancy {C/C++ && Java && .NET}
Mobile: +49 (176)  21248869
Office: +49 (9131) 7126409
