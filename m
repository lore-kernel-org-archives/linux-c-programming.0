From: "J." <mailing-lists@xs4all.nl>
Subject: Re: *w[1]++ = solved... thnkx... ?
Date: Mon, 24 Feb 2003 10:35:54 +0100 (CET)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0302241032001.12074-100000@hestia>
References: <20030224110552.C21636@neutrino.particles.org>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030224110552.C21636@neutrino.particles.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Mon, 24 Feb 2003, Elias Athanasopoulos wrote:

> On Mon, Feb 24, 2003 at 08:55:16AM +0100, J. wrote:
> > > On Sun, Feb 23, 2003 at 06:37:08PM +0100, J. wrote:
> > > > I can print char by char like this: printf("%c", *w[1]++);
> > > > but I can not copy char by char like this: *w[1]++ = *k[1]++;
> > > 
> > > It works.
> > > 
> > > >  while(*w[1] != '\0')
> > > >   *k[1]++ = *w[1]++; 
> > > 
> > > You move the pointer while doing the copy, so after the loop it points to
> > > the terminated null character.
> > 
> > Yes and then everything is copy'd, including the '\0' terminator just like
> > strcpy(). So k[1] should point to the character string and *k[1] points
> > to the first charater of the string ... ? 
> 
> *k[1] points nowhere since it's not a pointer; it's a character. Your pointer
> is k[1] which is incremented in the loop, while making the contents of its
> memory cells filled up with the characters belonging to w[1].

Now I understand!!!

> Try this (after the loop):
> 
> printf ("%c\n", *(k[1]-1)); 
> 
> It should print 'a'. The last char in jehova (if I'm spelling it right), before
> the terminating '\0'.
> 
> Also, if you followed what I said, again after the loop:
> 
> printf ("%p %p\n", k[1], s);
> 
> You'll see how k[1] is different than s (remember before the loop they were pointing
> in the exact mem address).

It suddenly all falls together and it makes sense...

> Elias

Great stuff.. Thankx.. again.. I'm going to fix right away..

J.

