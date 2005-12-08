From: Steve Graegert <graegerts@gmail.com>
Subject: Re: type qualifiers on function return types?
Date: Thu, 8 Dec 2005 19:07:46 +0100
Message-ID: <6a00c8d50512081007v1d59190fh428935aa74d0cf9c@mail.gmail.com>
References: <Pine.LNX.4.63.0512080728490.10304@localhost.localdomain>
	 <6a00c8d50512080858n70ef1937n8ccc2c96b9eb799c@mail.gmail.com>
	 <001401c5fc1e$d7963110$8e01a8c0@Nate>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <001401c5fc1e$d7963110$8e01a8c0@Nate>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: C programming list <linux-c-programming@vger.kernel.org>

On 12/8/05, Nate Jenkins <nate@uniwest.com> wrote:
> I am sure I am not the only one here wondering what "type qualifiers" are.
> Could someone expound on what they are and why one would use them?

My DEC C Compiler documentation gives a good intro to type qualifiers.
 Here is what is says:

There are four type qualifiers:

    * const
    * volatile
    * __unaligned (axp)
    * __restrict (pointer type only) [now: restrict]

"Type qualifiers were introduced by the ANSI C standard to, in part,
give you greater control over the compiler's optimizations. The const
and volatile type qualifiers can be applied to any type. The
__restrict type qualifier can be applied only to pointer types.

Note that because the __restrict type qualifier is not part of the
1989 ANSI C standard, this keyword has double leading underscores. The
next version (9X) of the C standard is expected to adopt the keyword
restrict with the same semantics described in this section.

The use of const gives you a method of controlling write access to an
object, and eliminates potential side effects across function calls
involving that object. This is because a side effect is an alteration
of an object's storage and const prohibits such alteration.

Use volatile to qualify an object that can be changed by other
processes or hardware. The use of volatile disables optimizations with
respect to referencing the object. If an object is volatile qualified,
it may be changed between the time it is initialized and any
subsequent assignments. Therefore, it cannot be optimized."

I hope this info was useful enough.

	\Steve

PS: Please do not top post.  Thanks.

--

Steve Graegert <graegerts@gmail.com> | Blog <http://tikomi.org>
Software Consultant {C/C++ && Java && .NET}
Office: +49 9131 7123988
Mobile: +49 1520 9289212


> ----- Original Message -----
> From: "Steve Graegert" <graegerts@gmail.com>
> To: "C programming list" <linux-c-programming@vger.kernel.org>
> Sent: Thursday, December 08, 2005 8:58 AM
> Subject: Re: type qualifiers on function return types?
>
>
> > On 12/8/05, Robert P. J. Day <rpjday@mindspring.com> wrote:
> >>
> >>   i was just handed a pile of source code that, upon first build,
> >> complains thusly:
> >>
> >> header.h:20: warning: type qualifiers ignored on function return type
> >> header.h:22: warning: type qualifiers ignored on function return type
> >>
> >>   at those lines, we read:
> >>
> >>   typedef struct blah {
> >>     volatile void           (**start_address)(void);    <--
> >>     volatile char*          stack;
> >>     volatile void           (**manual_start_address)(void); <--
> >>     ...
> >>
> >> which seems to explain the warnings since i never thought you could
> >> add type qualifiers to function return types.  or is there something
> >> incredibly clever happening here that i've never seen before?  just
> >> wondering why someone would have coded it that way in the first place.
> >
> > Since functions can only return rvalues and the type qualifiers apply
> > only to lvalues, it is meaningless and therefore ignored.
> >
> > \Steve
> >
> > --
> >
> > Steve Graegert <graegerts@gmail.com>
> > Software Consultant {C/C++ && Java && .NET}
> > Office: +49 9131 7123988
> > Mobile: +49 1520 9289212
> > -
> > To unsubscribe from this list: send the line "unsubscribe
> > linux-c-programming" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
