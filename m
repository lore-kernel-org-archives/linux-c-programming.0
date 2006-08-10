From: "Smith, Jason - VA" <JasonSmith@verisign.com>
Subject: RE: the rationale for defining macros for simple types?
Date: Thu, 10 Aug 2006 11:35:48 -0400
Message-ID: <C9D203A88CE285489324AEDC5174158604CEB983@dul1wnexmb01.vcorp.ad.vrsn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Robert P. J. Day" <rpjday@mindspring.com>, C programming list <linux-c-programming@vger.kernel.org>

Robert,

stdint.h is a part of glibc methinks, and not part of any blessed
standard that I am aware of.  What you probably want to include for the
int*_t types is <inttypes.h>, which found in /usr/(local/)?/include on
most of the common *nix's out there (might be part of a standard like
C99 too).

Typically these "convention-establishing" macros are only needed when
you need to get exact sizing for native types to compensate for word
size on multiple processor/OS/compiler combinations.  But they'll be
peppered with #ifdef wrappers for whatever dependent macro is defined
for the compiler/OS/processor you need to support.  In other words, what
inttypes.h is most likely already doing for you.

As a second opinion, I agree that those macros you have there are close
to worthless, as they are just abbreviated rehashes of the word-size
dependent native types.  Unless you have a compelling reason for making
the code less readable with no benefit over inttypes.h, I'd ditch those
macros.

Regards,
--jls 

P.S.  If you want your code to perform consistently across platforms
(and you don't care about absolute variable size), consider using the
"fast" (better speed, possible bigger size) or "least" (smaller size,
possibly slower) versions of int*_t's, such as int_fast32_t or
int_least32_t.

> -----Original Message-----
> From: linux-c-programming-owner@vger.kernel.org 
> [mailto:linux-c-programming-owner@vger.kernel.org] On Behalf 
> Of Robert P. J. Day
> Sent: Thursday, 10 August, 2006 07:58
> To: C programming list
> Subject: the rationale for defining macros for simple types?
> 
> 
>   a project that i inherited a while back contains a header 
> file with the following macros:
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
> and proceeds to, naturally, define numerous variables using 
> those macros.  it's not clear why the original programmer 
> chose to do it this way rather than just use <stdint.h> and 
> things like uint8_t and so on.  i don't see any overwhelming 
> need to add yet another level of complexity when the standard 
> types would seem to do just fine.
> 
> also, i'm uncomfortable by the fact that "UINT" is defined as 
> being "unsigned short int", which is visually misleading.  
> not to mention that "unsigned long int" is machine-dependent, no?
> 
> is there a reason for having done it this way in the first 
> place that anyone knows of?  or can i just rip all that 
> nonsense out and use <stdint.h> types directly?  thanks.
> 
> rday
> -
> To unsubscribe from this list: send the line "unsubscribe 
> linux-c-programming" in the body of a message to 
> majordomo@vger.kernel.org More majordomo info at  
> http://vger.kernel.org/majordomo-info.html
> 
> 
