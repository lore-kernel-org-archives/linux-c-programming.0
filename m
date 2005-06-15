From: Steve Graegert <graegerts@gmail.com>
Subject: Re: variable length function
Date: Wed, 15 Jun 2005 18:26:53 +0200
Message-ID: <6a00c8d505061509263ca76278@mail.gmail.com>
References: <17072.4612.493709.339833@gargle.gargle.HOWL>
	 <20050615155926.76725.qmail@web52910.mail.yahoo.com>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050615155926.76725.qmail@web52910.mail.yahoo.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ankit Jain <ankitjain1580@yahoo.com>
Cc: Glynn Clements <glynn@gclements.plus.com>, linux-c-programming@vger.kernel.org

On 6/15/05, Ankit Jain <ankitjain1580@yahoo.com> wrote:
> hi

[snip]

> if i write the same module in it then it takes void as
> the default return type...........?

No it does not.  When specifying no return type int is returned
implicitly.  Under Windows, even if main is void-valued, the exit
code, whatever value it may have, is converted to int.

> --- Glynn Clements <glynn@gclements.plus.com> wrote:
> 
> >
> > Ankit Jain wrote:
> >
> > > Well then i am just trying to clear my concept
> > again.
> > >
> > > main()
> > > {
> > >
> > >          printf("This is main");
> > >
> > > }
> > >
> > > now this simple function main according to this
> > > discussion will return a int value.......Am i
> > > right....
> >
> > Correct.
> >
> > > but is it true with any compiler?
> >
> > It's true for any compiler which supports pre-ANSI C
> > (aka "K&R C").
> > ANSI C requires the return type to be specified.
> >
> > > another thing........... if it returns a int value
> > and
> > > we have not returned any value
> > explicitly.........then
> > > what is the value returned ....as far as i know
> > its a
> > > non-zero value. but then what will that mean.....?
> >
> > It's an unspecified value. It could be any "int"
> > value, including
> > zero. As there is only one zero but many more
> > non-zero values, it
> > probably won't be zero, but it isn't guaranteed.
> >
> > Hopefully the compiler will issue a warning in this
> > situation.
> >
> > --
> > Glynn Clements <glynn@gclements.plus.com>
> >
>
