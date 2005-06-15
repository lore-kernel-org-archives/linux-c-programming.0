From: Ankit Jain <ankitjain1580@yahoo.com>
Subject: Re: variable length function
Date: Wed, 15 Jun 2005 16:59:26 +0100 (BST)
Message-ID: <20050615155926.76725.qmail@web52910.mail.yahoo.com>
References: <17072.4612.493709.339833@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17072.4612.493709.339833@gargle.gargle.HOWL>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

hi

i had checked up in VC++....this may not be with
respect to this mailing list but question is there

if i write the same module in it then it takes void as
the default return type...........?

ankit
--- Glynn Clements <glynn@gclements.plus.com> wrote:

> 
> Ankit Jain wrote:
> 
> > Well then i am just trying to clear my concept
> again.
> > 
> > main()
> > {
> > 
> >          printf("This is main");
> > 
> > }
> > 
> > now this simple function main according to this
> > discussion will return a int value.......Am i
> > right....
> 
> Correct.
> 
> > but is it true with any compiler?
> 
> It's true for any compiler which supports pre-ANSI C
> (aka "K&R C"). 
> ANSI C requires the return type to be specified.
> 
> > another thing........... if it returns a int value
> and
> > we have not returned any value
> explicitly.........then
> > what is the value returned ....as far as i know
> its a
> > non-zero value. but then what will that mean.....?
> 
> It's an unspecified value. It could be any "int"
> value, including
> zero. As there is only one zero but many more
> non-zero values, it
> probably won't be zero, but it isn't guaranteed.
> 
> Hopefully the compiler will issue a warning in this
> situation.
> 
> -- 
> Glynn Clements <glynn@gclements.plus.com>
> 


Send instant messages to your online friends http://uk.messenger.yahoo.com 
