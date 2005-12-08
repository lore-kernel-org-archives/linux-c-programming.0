From: Steve Graegert <graegerts@gmail.com>
Subject: Re: type qualifiers on function return types?
Date: Thu, 8 Dec 2005 17:58:47 +0100
Message-ID: <6a00c8d50512080858n70ef1937n8ccc2c96b9eb799c@mail.gmail.com>
References: <Pine.LNX.4.63.0512080728490.10304@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0512080728490.10304@localhost.localdomain>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: C programming list <linux-c-programming@vger.kernel.org>

On 12/8/05, Robert P. J. Day <rpjday@mindspring.com> wrote:
>
>   i was just handed a pile of source code that, upon first build,
> complains thusly:
>
> header.h:20: warning: type qualifiers ignored on function return type
> header.h:22: warning: type qualifiers ignored on function return type
>
>   at those lines, we read:
>
>   typedef struct blah {
>     volatile void           (**start_address)(void);    <--
>     volatile char*          stack;
>     volatile void           (**manual_start_address)(void); <--
>     ...
>
> which seems to explain the warnings since i never thought you could
> add type qualifiers to function return types.  or is there something
> incredibly clever happening here that i've never seen before?  just
> wondering why someone would have coded it that way in the first place.

Since functions can only return rvalues and the type qualifiers apply
only to lvalues, it is meaningless and therefore ignored.

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultant {C/C++ && Java && .NET}
Office: +49 9131 7123988
Mobile: +49 1520 9289212
