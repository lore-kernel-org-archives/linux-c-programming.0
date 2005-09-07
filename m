From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: weird structure definition in header file
Date: Wed, 7 Sep 2005 02:20:37 +0100
Message-ID: <17182.16485.673249.957074@cerise.gclements.plus.com>
References: <Pine.LNX.4.63.0509061510210.24485@vericenter>
	<20050906192324.GA10879@hmsreliant.homelinux.net>
	<Pine.LNX.4.63.0509061526130.24776@vericenter>
	<Pine.LNX.4.63.0509061538530.24984@vericenter>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0509061538530.24984@vericenter>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: nhorman@tuxdriver.com, C programming list <linux-c-programming@vger.kernel.org>


Robert P. J. Day wrote:

> also, i'm assuming that some source file must eventually include an
> actual definition of a "Widget" for the purposes of linking, as in:
> 
>   #include "widgets.h"
>   ...
>   Widgets Widget ;

Correct.

> however, given the inclusion of the header file, doesn't this give me
> both a referencing declaration and a defining declaration of that
> object in the same file?

It gives you both a declaration and a definition in the same
compilation unit.

> is there no problem with that?

No.

If there was, you wouldn't be able to have forward declarations, and
thus wouldn't be able to define mutually-recursive functions.

>  i was under
> the impression that common practise was to have a single defining
> declaration and all the *remaining* be referencing declarations.

You shouldn't define a symbol more than once in any compilation unit,
but you can declare it as many times as you like.

-- 
Glynn Clements <glynn@gclements.plus.com>
