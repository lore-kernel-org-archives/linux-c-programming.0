From: Steve Graegert <graegerts@gmail.com>
Subject: Re: relationship between standard C and gcc compiler suite?
Date: Wed, 3 Aug 2005 19:12:31 +0200
Message-ID: <6a00c8d5050803101241bcceb5@mail.gmail.com>
References: <Pine.LNX.4.63.0508030942160.7360@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0508030942160.7360@localhost.localdomain>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>

On 8/3/05, Robert P. J. Day <rpjday@mindspring.com> wrote:
> 
>   according to my 5th ed. of H&S, C99 introduced the unsigned integer
> type "_Bool" and refers to the corresponding header file stdbool.h.
> but on my linux system, that header file is not in the standard
> /usr/include directory, where i would have expected it.
> 
>   rather, it's included with gcc-4.0.1, and it's in this directory:
> 
> /usr/lib/gcc/i386-redhat-linux/4.0.1/include
> 
> i'm sure the end result is the same in that i can just
> 
>   #include <stdbool.h>
> 
>  but is there some kind of overall rationale as to what "standard"
> header files would actually be supplied by gcc itself?  just trying to
> figure out the pattern here.  obviously, this question generalizes to
> more than just asking about the boolean file.

Since C++ provides bool as a true boolean type <stdbool.h> is provided
to allow C code being compiled as C++ and to prevent name clashes. 
Some C programs #define "bool" and/or "true" and "false" possibly
causing compatibility problems when compiled as C++.

In case of GCC, including <stdbool.h> cleans up #defines and allows
C++ compilation.  It is therefore recommended to #define these
identifiers only when _needed_ and after including <stdbool.h>.
<stdbool.h> is provided as an extension and, for this reason, not
placed into the include directory of the C standard library.
 
Regards

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultancy {C/C++ && Java && .NET}
Mobile: +49 (176)  21248869
Office: +49 (9131) 7126409
