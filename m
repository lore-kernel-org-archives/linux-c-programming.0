From: Elias Athanasopoulos <elathan@phys.uoa.gr>
Subject: Re: *w[1]++ = *[k[1]++; does not work .. ?
Date: Mon, 24 Feb 2003 11:05:52 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030224110552.C21636@neutrino.particles.org>
References: <20030223213034.B21636@neutrino.particles.org> <Pine.LNX.4.21.0302232200530.10835-100000@hestia>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0302232200530.10835-100000@hestia>; from mailing-lists@xs4all.nl on Mon, Feb 24, 2003 at 08:55:16AM +0100
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J." <mailing-lists@xs4all.nl>
Cc: linux-c-programming@vger.kernel.org

On Mon, Feb 24, 2003 at 08:55:16AM +0100, J. wrote:
> > On Sun, Feb 23, 2003 at 06:37:08PM +0100, J. wrote:
> > > I can print char by char like this: printf("%c", *w[1]++);
> > > but I can not copy char by char like this: *w[1]++ = *k[1]++;
> > 
> > It works.
> > 
> > >  while(*w[1] != '\0')
> > >   *k[1]++ = *w[1]++; 
> > 
> > You move the pointer while doing the copy, so after the loop it points to
> > the terminated null character.
> 
> Yes and then everything is copy'd, including the '\0' terminator just like
> strcpy(). So k[1] should point to the character string and *k[1] points
> to the first charater of the string ... ? 

*k[1] points nowhere since it's not a pointer; it's a character. Your pointer
is k[1] which is incremented in the loop, while making the contents of its
memory cells filled up with the characters belonging to w[1].

Try this (after the loop):

printf ("%c\n", *(k[1]-1)); 

It should print 'a'. The last char in jehova (if I'm spelling it right), before
the terminating '\0'.

Also, if you followed what I said, again after the loop:

printf ("%p %p\n", k[1], s);

You'll see how k[1] is different than s (remember before the loop they were pointing
in the exact mem address).

> > You should keep the original address of k[1] before the loop and use it 
> > instead. I.e.:
> 
> The original address of *k[1] is preserved, only the memory segment
> address it points to is incremented. I think...

No. *k[1] is the content of the mem address that k[1] points to. 

>  // now k[1] should be:
>  /*
>   ___      --- --- --- --- --- --- ---
>  | 0 | -> | j | e | h | o | v | a |\0|
>  |___|     --- --- --- --- --- --- ---

This is how the memory near k[1] is after the loop. But the original address
of k[1] has changed during the copy. If you subtruct the length of w[1] from
k[1] then you'll go back to the original point and do what you want to.


Elias

-- 
University of Athens			I bet the human brain 
Physics Department				is a kludge --Marvin Minsky 

	
