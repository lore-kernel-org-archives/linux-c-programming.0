From: Steve Graegert <graegerts@gmail.com>
Subject: Re: union versus bit manipulation
Date: Tue, 14 Jun 2005 22:03:17 +0200
Message-ID: <6a00c8d5050614130372a5a289@mail.gmail.com>
References: <Pine.LNX.4.61.0506140858190.18849@localhost.localdomain>
Reply-To: Steve Graegert <graegerts@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0506140858190.18849@localhost.localdomain>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: linux-c-programming@vger.kernel.org

On 6/14/05, Robert P. J. Day <rpjday@mindspring.com> wrote:
> 
>   looking for advice on the following issue.  some code i've inherited
> defines an unsigned 16-bit value that's meant to be interpreted in the
> following way in terms of the internal bit structure:
> 
>   1-bit         class
>   2-bit         type
>   13-bit        value
> 
> however, in addition to needing to access the individual components of
> this object, the code (sadly) also needs to treat the whole thing as
> an unsigned 16-bit value to use as a key into a larger data structure.
> 
>   at the moment, defining the whole thing as an unsigned 16-bit object
> and using bit operations works fine, but i was considering redefining
> the type to use a union thusly:
> 
> union thing {
>         uint16_t thingval ;
>         struct S {
>                 unsigned val    : 13 ;
>                 unsigned type   : 2 ;
>                 unsigned class  : 1 ;
>         } s ;
> } ;
> 
> 
>   the major problems i see are that 1) i'd obviously need to guarantee
> that the fields in the struct are packed to make sure they still
> correspond to the appropriate 16-bit value, and 2) i need to make it
> portable across different endian architectures (i'm compiling the code
> on am x86 for a Power PC board).
> 
>   given the cautions associated with structure packing and alignment,
> as well as endianness, is it even worth the trouble to think of
> something like this?  or should i just leave the object as a uint16_t
> and stick with the bit operations?
> 
> rday
> 
> p.s.  i can guarantee that i'll be using gcc to compile, which has
> some support for forcing packing, but i'm not sure at this point it's
> worth the trouble.  thoughts?

Robert,

I can't see a benefit in a transition from uint16_t to a "union
thing".  You already mentioned important issues and since bit fields
are not universally portable I don't think its worth the effort.  Bit
operations on simple types are a convenient solution.

 
Kind Regards

    \Steve

--

Steve Graegert <graegerts@gmail.com> || <http://www.technologies.de/~sg/>
Independent Software Consultant {C/C++ && Java && .NET}
Mobile: +49 (176)  21 24 88 69
Office: +49 (9131) 71 26 40 9
