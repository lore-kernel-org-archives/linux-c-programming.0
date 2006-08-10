From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: RE: the rationale for defining macros for simple types?
Date: Thu, 10 Aug 2006 12:06:10 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0608101201590.17399@localhost.localdomain>
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
> standard that I am aware of.  What you probably want to include for
> the int*_t types is <inttypes.h>, which found in
> /usr/(local/)?/include on most of the common *nix's out there (might
> be part of a standard like C99 too).

as a followup to my last post, i suspect i need include only
<stdint.h>, as i don't really need the additional info from
<inttypes.h>.  i'm a minimalist, and i'd just as soon include as
little as i actually need.  if some file genuinely needs the extras
from <inttypes.h>, then that file can include it explicitly.

> As a second opinion, I agree that those macros you have there are
> close to worthless, as they are just abbreviated rehashes of the
> word-size dependent native types.  Unless you have a compelling
> reason for making the code less readable with no benefit over
> inttypes.h, I'd ditch those macros.

i'd suspected as much, i just wanted to make sure there wasn't some
really tricky C idiom at work here.  so just declaring things with
"int8_t" (for example) is the way to go if i really and truly need to
get that specific.  thanks.

rday
