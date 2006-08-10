From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: the rationale for defining macros for simple types?
Date: Thu, 10 Aug 2006 21:57:12 +0100
Message-ID: <17627.40360.947755.143415@cerise.gclements.plus.com>
References: <Pine.LNX.4.64.0608100754040.11910@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0608100754040.11910@localhost.localdomain>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>


Robert P. J. Day wrote:

>   a project that i inherited a while back contains a header file with
> the following macros:
> 
> #ifndef UCHAR
> #define UCHAR   unsigned char
> #endif
> 
> #ifndef UINT
> #define UINT    unsigned short int
> #endif
> 
> #ifndef ULONG
> #define ULONG   unsigned long int
> #endif
> 
> #ifndef BOOL
> #define BOOL    unsigned int
> #endif
> 
> #ifndef TRUE
> #define TRUE    (1>0)
> #define FALSE   !TRUE
> #endif
> 
> 
> and proceeds to, naturally, define numerous variables using those
> macros.  it's not clear why the original programmer chose to do it
> this way rather than just use <stdint.h> and things like uint8_t and
> so on.

Probably because <stdint.h> isn't in C89. It's in C99, and also
provided by some compilers which don't otherwise implement C99.

Also, macros such as the above might simply be used as shorthand, to
save typing and/or screen area (although I don't think that's the case
here). In which case, they should refer to the platform-dependent
types rather than fixed-size types. E.g. if the code used:

	LONG offset;
	...
	fseek(fp, offset, seek_set);

then LONG needs to be "long" not some fixed-width type.

>  i don't see any overwhelming need to add yet another level of
> complexity when the standard types would seem to do just fine.
> 
> also, i'm uncomfortable by the fact that "UINT" is defined as being
> "unsigned short int", which is visually misleading.  not to mention
> that "unsigned long int" is machine-dependent, no?

The fact that UINT is defined as unsigned short int leads me to
suspect that this project started out on a 16-bit system (e.g. DOS)
then was ported to 32-bit architectures.

> is there a reason for having done it this way in the first place that
> anyone knows of?  or can i just rip all that nonsense out and use
> <stdint.h> types directly?  thanks.

In this case, where the programmer appears to have specific sizes in
mind (e.g. UINT is 16 bits), you should probably use the <stdint.h>
types (although you may need to provide that file yourself; it's not
part of the C89 standard).

-- 
Glynn Clements <glynn@gclements.plus.com>
