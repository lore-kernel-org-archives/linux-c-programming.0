From: "Nate Jenkins" <nate@uniwest.com>
Subject: Re: type qualifiers on function return types?
Date: Thu, 8 Dec 2005 10:16:09 -0800
Message-ID: <007301c5fc23$769490f0$8e01a8c0@Nate>
References: <Pine.LNX.4.63.0512080728490.10304@localhost.localdomain> <6a00c8d50512080858n70ef1937n8ccc2c96b9eb799c@mail.gmail.com> <001401c5fc1e$d7963110$8e01a8c0@Nate> <6a00c8d50512081007v1d59190fh428935aa74d0cf9c@mail.gmail.com>
Reply-To: "Nate Jenkins" <nate@uniwest.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: C programming list <linux-c-programming@vger.kernel.org>


>> I am sure I am not the only one here wondering what "type qualifiers" 
>> are.
>> Could someone expound on what they are and why one would use them?
>
> My DEC C Compiler documentation gives a good intro to type qualifiers.
> Here is what is says:
>
> There are four type qualifiers:
>
>    * const
>    * volatile
>    * __unaligned (axp)
>    * __restrict (pointer type only) [now: restrict]
>
> "Type qualifiers were introduced by the ANSI C standard to, in part,
> give you greater control over the compiler's optimizations. The const
> and volatile type qualifiers can be applied to any type. The
> __restrict type qualifier can be applied only to pointer types.
>
> Note that because the __restrict type qualifier is not part of the
> 1989 ANSI C standard, this keyword has double leading underscores. The
> next version (9X) of the C standard is expected to adopt the keyword
> restrict with the same semantics described in this section.
>
> The use of const gives you a method of controlling write access to an
> object, and eliminates potential side effects across function calls
> involving that object. This is because a side effect is an alteration
> of an object's storage and const prohibits such alteration.
>
> Use volatile to qualify an object that can be changed by other
> processes or hardware. The use of volatile disables optimizations with
> respect to referencing the object. If an object is volatile qualified,
> it may be changed between the time it is initialized and any
> subsequent assignments. Therefore, it cannot be optimized."
>
> I hope this info was useful enough.
>
> \Steve
>
> PS: Please do not top post.  Thanks.
>
> --
>
> Steve Graegert <graegerts@gmail.com> | Blog <http://tikomi.org>
> Software Consultant {C/C++ && Java && .NET}
> Office: +49 9131 7123988
> Mobile: +49 1520 9289212
>
>

Thanks for the info Robert and Steve.  Sometimes I forget the fancy names of 
these things.  Yes, "const" is probably the most commonly used one...

Nate

