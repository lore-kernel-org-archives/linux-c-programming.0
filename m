From: Scott <drmemory@3rivers.net>
Subject: Re: how to implement routines that return general strings?
Date: Mon, 14 Aug 2006 12:15:29 -0600
Message-ID: <20060814181529.GA1143@drmemory.local>
References: <Pine.LNX.4.64.0608101004460.13097@localhost.localdomain> <20060810171238.GC778@drmemory.local> <fa1e4ce70608111306k5bdb728an4a4d72f642030306@mail.gmail.com> <Pine.LNX.4.64.0608120534250.5194@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0608120534250.5194@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Sat, Aug 12, 2006 at 05:36:51AM -0400, Robert P. J. Day wrote:
> On Fri, 11 Aug 2006, Kelly Burkhart wrote:
> 
> > On 8/10/06, Scott <drmemory@3rivers.net> wrote:
> > > With the caveat that I haven't done any serious programming in C for
> > > many years:  As I recall, I always used a protocol halfway between
> > > these, as:
> > >
> > > char *func(size_t bufsiz)
> > > {
> > >         char *retval = malloc (bufsiz);
> > >         if (retval == NULL) return (NULL);
> > >         /* whatever */
> > >         return (retval);
> > > }
> >
> > This code is to live in a shared library and you wish for it to be
> > portable then you may want to keep in mind the difficulties on some
> > platforms of allocating memory in one shared library and freeing in
> > another.  If this concern is relevant to you, the above must be
> > paired with void funcCleanup(char*).
> 
> obviously, if i chose to do it this way, i'd first check if a malloc()
> had already been done, so i don't keep malloc()ing unnecessarily
> (keeping a static pointer, naturally).
> 
> that would seem to be functionally equivalent to just declaring a
> static array of characters within that routine, anyway.

I guess I assumed that the caller of a library routine like this would
*want* a brand-new array. And of course with that want comes the
responsibilty for taking care of it and letting it swim back into the
memory pool when you are finished with it. Use a static (whether array
or pointer) and you are back to problems with re-entrancy.

Scott Swanson
