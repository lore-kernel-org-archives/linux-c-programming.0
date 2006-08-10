From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: RE: the rationale for defining macros for simple types?
Date: Thu, 10 Aug 2006 11:45:58 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0608101142570.17196@localhost.localdomain>
References: <C9D203A88CE285489324AEDC5174158604CEB983@dul1wnexmb01.vcorp.ad.vrsn.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <C9D203A88CE285489324AEDC5174158604CEB983@dul1wnexmb01.vcorp.ad.vrsn.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Smith, Jason - VA" <JasonSmith@verisign.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>

On Thu, 10 Aug 2006, Smith, Jason - VA wrote:

> Robert,
>
> stdint.h is a part of glibc methinks, and not part of any blessed
> standard that I am aware of.

my copy of harbison and steele lists <stdint.h> as part of C99.  am i
somehow reading that incorrectly?

> What you probably want to include for the int*_t types is
> <inttypes.h>, which found in /usr/(local/)?/include on most of the
> common *nix's out there (might be part of a standard like C99 too).

again, from my copy of H&S, inttypes.h includes stdint.h, so i guess
either one would work fine.  i'm guessing inttypes.h would be the
better choice since it's more all-encompassing.  thanks.

rday
