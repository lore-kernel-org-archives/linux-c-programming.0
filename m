From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: library routine wrappers and serious overkill
Date: Mon, 6 Jun 2005 17:29:40 -0400 (EDT)
Message-ID: <Pine.LNX.4.61.0506061725380.2617@localhost.localdomain>
References: <Pine.LNX.4.61.0506051727540.5731@localhost.localdomain>
 <17059.41759.788362.757952@gargle.gargle.HOWL>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17059.41759.788362.757952@gargle.gargle.HOWL>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn@gclements.plus.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>

On Mon, 6 Jun 2005, Glynn Clements wrote:

> Robert P. J. Day wrote:
>
> >   now, i'm as big a fan as the next guy of good debugging (the
> > my_CONDITION macro is a local implementation of assert() with hooks to
> > a logging library -- yeesh) but, seriously, there has to be a limit to
> > just how much debugging you're going to apply to each and every
> > string-related library routine.  it does get kind of absurd after a
> > while:
> >
> > ===============================
> >
> > char
> > my_str_ch2upper(char const ch)
> > {
> >     DBUG_ENTER(__FUNCTION__);
> >
> >     if (isascii(ch) && islower(ch)) {
> >         DBUG_RETURN(toupper(ch));
> >     }
> >     DBUG_RETURN(ch);
> > }
> >
> >
> > ===============================
> >
> >   is this what you'd call best practice?
>
> It may be that the code was written for a platform which lacked a
> working debugger, so the program had to be able to generate its own
> stack traces etc.

in fact, that's exactly the case -- this code is for an embedded
system for which debugging capabilities are limited.  my point was
more that it seemed like overkill to add "dbug"-type wrapping around a
routine that did nothing more than convert a character to upper case.
and, on top of that, the input validation above is redundant -- the
definition of "toupper" is that it already checks whether the input
character is lower case before performing the conversion.

in any case, i have no beef with debugging code.  but i think there
are times when one gets a bit carried away.

rday
