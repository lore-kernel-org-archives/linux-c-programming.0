From: Eric Bambach <eric@cisu.net>
Subject: Re: Assignment  make pointers
Date: Mon, 13 Dec 2004 08:51:44 -0600
Message-ID: <200412130851.44586.eric@cisu.net>
References: <20041213_100432_025782.r_zaca@ig.com.br> <20041213101011.GO16958@lug-owl.de>
Reply-To: eric@cisu.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041213101011.GO16958@lug-owl.de>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org
Cc: Patrick <patrickC@puzzled.xs4all.nl>

On Monday 13 December 2004 04:10 am, Jan-Benedict Glaw wrote:
> On Mon, 2004-12-13 08:04:32 -0200, r_zaca <r_zaca@ig.com.br>
> wrote in message <20041213_100432_025782.r_zaca@ig.com.br>:
> Content-Description: Mail message body
>
> >   If you take a look in "man 3 basename", you'll see that basename
> > function just returns a pointer to a char. In the case above you need to
> > "cast" the pointer returned to be of type int.
> >   Like: prog_ptr = (int *) basename (argv[0]);
>
> Don't do that. Usually, you can write even quite large programs without
> using casts at all. Most of the time, a cast points to spots in your
> programs that are badly designed from the type of your variables point
> of view. If your variables are of senseful types and obey a well-thought
> structure (like using enums and unions instead of #defines and casts),
> you usually don't need to cast.
> Also, I usually suggest to compile code with "-Wall" -- that'll show you
> probably lots of odd constructs that should be written differently (or
> using proper types).

True enough. The problem intrigued me enough that I test compiled with -Wall 
and the compiler complains of an implicit declaration of basename. It seems 
he was missing #include <libgen.h>. Adding this cleared everything up.

What escapes me though is how the compiler could compile without knowing the 
definition. Isnt it REALLY presumptuous and dangerous for the compiler to 
assume function definitions? I assume basename is in the standard c library 
though or it certainly wouldnt link. Can anyone with more experience 
elaborate?

> MfG, JBG

-- 

-EB
