From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: the rationale for redefining integral types?
Date: Wed, 3 Aug 2005 08:14:10 -0400 (EDT)
Message-ID: <Pine.LNX.4.63.0508030810120.4744@localhost.localdomain>
References: <Pine.LNX.4.63.0508030750250.4376@localhost.localdomain>
 <6a00c8d505080305045ad09980@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d505080305045ad09980@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Graegert <graegerts@gmail.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>

On Wed, 3 Aug 2005, Steve Graegert wrote:

> On 8/3/05, Robert P. J. Day <rpjday@mindspring.com> wrote:

> >  in this legacy code, one of the previous authors took it upon
> > himself to redefine some of the basic integral types, such as
> > int8, int16, int32 ... that sort of thing.
>
> Sounds weird, indeed, but I suspect the code to be pre-POSIX (before
> 1989).

nope, the code is at most 4 years old.

> >  there doesn't appear to be any benefit to these internally
> > redefined types over the ones in the standard library, so i can't
> > see why it would have been done.
>
> The only reason I could think of is that the developer wanted to
> introduce some kind of portability by masking underlying types (and
> probably their size) transparently.  Is this particular piece of
> code part of a library?  Do the headers contain some #ifdefs to
> allow conditional compilation for certain systems?

nope and nope.  i'm just going to assume i can replace it with
standard C types.  if something breaks, well, then i'll have my
answer, i guess.  thanks.

rday
