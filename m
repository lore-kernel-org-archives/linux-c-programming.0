From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: type qualifiers on function return types?
Date: Thu, 8 Dec 2005 12:58:44 -0500 (EST)
Message-ID: <Pine.LNX.4.63.0512081257140.7428@localhost.localdomain>
References: <Pine.LNX.4.63.0512080728490.10304@localhost.localdomain>
 <6a00c8d50512080858n70ef1937n8ccc2c96b9eb799c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d50512080858n70ef1937n8ccc2c96b9eb799c@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Graegert <graegerts@gmail.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>

On Thu, 8 Dec 2005, Steve Graegert wrote:

> On 12/8/05, Robert P. J. Day <rpjday@mindspring.com> wrote:
> >
> >   i was just handed a pile of source code that, upon first build,
> > complains thusly:
> >
> > header.h:20: warning: type qualifiers ignored on function return type
> > header.h:22: warning: type qualifiers ignored on function return type
> >
> >   at those lines, we read:
> >
> >   typedef struct blah {
> >     volatile void           (**start_address)(void);    <--
> >     volatile char*          stack;
> >     volatile void           (**manual_start_address)(void); <--
> >     ...
> >
> > which seems to explain the warnings since i never thought you
> > could add type qualifiers to function return types.  or is there
> > something incredibly clever happening here that i've never seen
> > before?  just wondering why someone would have coded it that way
> > in the first place.
>
> Since functions can only return rvalues and the type qualifiers
> apply only to lvalues, it is meaningless and therefore ignored.

that's what i thought but, since i'm still working on the intricacies
of the language, whenever i come across something that mysterious, i
always assume it's just some idiomatic cleverness i've never seen
before.

of course, after that, i finally figure out it was just bad
programming.  :-(

rday

p.s.  i'm not *trying* to ask dumb questions.  i am merely succeeding.
