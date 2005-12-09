From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: type qualifiers on function return types?
Date: Fri, 9 Dec 2005 19:03:23 +0000
Message-ID: <17305.54523.539369.296130@cerise.gclements.plus.com>
References: <Pine.LNX.4.63.0512080728490.10304@localhost.localdomain>
	<6a00c8d50512080858n70ef1937n8ccc2c96b9eb799c@mail.gmail.com>
	<Pine.LNX.4.63.0512081257140.7428@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0512081257140.7428@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: Steve Graegert <graegerts@gmail.com>, C programming list <linux-c-programming@vger.kernel.org>


Robert P. J. Day wrote:

> > >   i was just handed a pile of source code that, upon first build,
> > > complains thusly:
> > >
> > > header.h:20: warning: type qualifiers ignored on function return type
> > > header.h:22: warning: type qualifiers ignored on function return type
> > >
> > >   at those lines, we read:
> > >
> > >   typedef struct blah {
> > >     volatile void           (**start_address)(void);    <--
> > >     volatile char*          stack;
> > >     volatile void           (**manual_start_address)(void); <--
> > >     ...
> > >
> > > which seems to explain the warnings since i never thought you
> > > could add type qualifiers to function return types.  or is there
> > > something incredibly clever happening here that i've never seen
> > > before?  just wondering why someone would have coded it that way
> > > in the first place.
> >
> > Since functions can only return rvalues and the type qualifiers
> > apply only to lvalues, it is meaningless and therefore ignored.
> 
> that's what i thought but, since i'm still working on the intricacies
> of the language, whenever i come across something that mysterious, i
> always assume it's just some idiomatic cleverness i've never seen
> before.
> 
> of course, after that, i finally figure out it was just bad
> programming.  :-(

Did you mean to declare the pointers as "volatile", rather than the
function's return value?

Pointer qualifiers go after the "*", e.g.

	typedef struct blah {
	  void           (**volatile start_address)(void);
	  char*          volatile stack;
	  void           (**volatile manual_start_address)(void);
	  ...

-- 
Glynn Clements <glynn@gclements.plus.com>
