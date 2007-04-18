From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: unable to link to a static library present alongside a shared
 library
Date: Wed, 18 Apr 2007 18:03:03 +0530
Message-ID: <46260FFF.9050909@gmail.com>
References: <70661EB74D51BD4889EE03CC34E733F5A76677@blr-m2-msg.wipro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <70661EB74D51BD4889EE03CC34E733F5A76677@blr-m2-msg.wipro.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

cyon.john@wipro.com wrote:

> You can use the '-static' option to gcc for forcing a static link even
> if a shared library is present.

So much for my being intelligent enough to have looked up the ld manual. 
Thanks for your pointing out and I believe your reason for preferring 
the shared libs must be the correct one.

BTW what does this mean (found it under man:ld for -static):

This option can be used with -shared. Doing so means that a shared 
library is being created but that all of the library's external 
references must be resolved by pulling in entries from static libraries.

Does it mean that while creating a shared library, static libraries 
which the shared library itself depends on must be integrated into the 
.so file?

So if libfoo depends on libgoo and libgoo.a is available (but not 
libgoo.so) I will have to specify both -static and -shared to pull the 
contents of libgoo.a into libfoo.so when it is created?

That must further mean that the default behaviour is NOT to integrate a 
static library into a shared library. Is that right? Seems somewhat 
contrary to the standard policy of integrating into the target whatever 
static libraries are linked against, no?

Thanks.

Shriramana Sharma.
