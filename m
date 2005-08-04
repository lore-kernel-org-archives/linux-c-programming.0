From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: relationship between standard C and gcc compiler suite?
Date: Thu, 4 Aug 2005 12:06:17 +0100
Message-ID: <17137.63145.546985.316567@cerise.gclements.plus.com>
References: <Pine.LNX.4.63.0508030942160.7360@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0508030942160.7360@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>


Robert P. J. Day wrote:

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

The rationale is essentially making things work on systems where the
system's libc isn't GNU libc.

If a header is in gcc's private include directory, it usually
indicates that the OS installs its own copy of the header in
/usr/include, but that header won't work with gcc. gcc searches its
private include directory before /usr/include, so gcc-specific headers
override the system's versions.

-- 
Glynn Clements <glynn@gclements.plus.com>
