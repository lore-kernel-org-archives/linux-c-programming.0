From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: the rationale for defining macros for simple types?
Date: Thu, 10 Aug 2006 07:58:18 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0608100754040.11910@localhost.localdomain>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: C programming list <linux-c-programming@vger.kernel.org>


  a project that i inherited a while back contains a header file with
the following macros:

#ifndef UCHAR
#define UCHAR   unsigned char
#endif

#ifndef UINT
#define UINT    unsigned short int
#endif

#ifndef ULONG
#define ULONG   unsigned long int
#endif

#ifndef BOOL
#define BOOL    unsigned int
#endif

#ifndef TRUE
#define TRUE    (1>0)
#define FALSE   !TRUE
#endif


and proceeds to, naturally, define numerous variables using those
macros.  it's not clear why the original programmer chose to do it
this way rather than just use <stdint.h> and things like uint8_t and
so on.  i don't see any overwhelming need to add yet another level of
complexity when the standard types would seem to do just fine.

also, i'm uncomfortable by the fact that "UINT" is defined as being
"unsigned short int", which is visually misleading.  not to mention
that "unsigned long int" is machine-dependent, no?

is there a reason for having done it this way in the first place that
anyone knows of?  or can i just rip all that nonsense out and use
<stdint.h> types directly?  thanks.

rday
