From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: how to implement routines that return general strings?
Date: Sat, 12 Aug 2006 05:36:51 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0608120534250.5194@localhost.localdomain>
References: <Pine.LNX.4.64.0608101004460.13097@localhost.localdomain> 
 <20060810171238.GC778@drmemory.local> <fa1e4ce70608111306k5bdb728an4a4d72f642030306@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <fa1e4ce70608111306k5bdb728an4a4d72f642030306@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kelly Burkhart <kelly@kkcsm.net>
Cc: linux-c-programming@vger.kernel.org

On Fri, 11 Aug 2006, Kelly Burkhart wrote:

> On 8/10/06, Scott <drmemory@3rivers.net> wrote:
> > With the caveat that I haven't done any serious programming in C for
> > many years:  As I recall, I always used a protocol halfway between
> > these, as:
> >
> > char *func(size_t bufsiz)
> > {
> >         char *retval = malloc (bufsiz);
> >         if (retval == NULL) return (NULL);
> >         /* whatever */
> >         return (retval);
> > }
>
> This code is to live in a shared library and you wish for it to be
> portable then you may want to keep in mind the difficulties on some
> platforms of allocating memory in one shared library and freeing in
> another.  If this concern is relevant to you, the above must be
> paired with void funcCleanup(char*).

obviously, if i chose to do it this way, i'd first check if a malloc()
had already been done, so i don't keep malloc()ing unnecessarily
(keeping a static pointer, naturally).

that would seem to be functionally equivalent to just declaring a
static array of characters within that routine, anyway.

rday
