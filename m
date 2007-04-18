From: <cyon.john@wipro.com>
Subject: RE: unable to link to a static library present alongside a shared library
Date: Wed, 18 Apr 2007 19:30:14 +0530
Message-ID: <70661EB74D51BD4889EE03CC34E733F5A766BA@blr-m2-msg.wipro.com>
References: <46260FFF.9050909@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <46260FFF.9050909@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: samjnaa@gmail.com, linux-c-programming@vger.kernel.org

Hi,

> So if libfoo depends on libgoo and libgoo.a is available (but not
> libgoo.so) I will have to specify both -static and -shared to pull the
contents of libgoo.a into libfoo.so when it is > > created?

That "-shared -static" option becomes relevant when both libgoo.so and
libgoo.a are present. By default, libfoo.so will be dynamically linked
with libgoo.so and will be a dependency. But if used "-static" along
with "-shared" while creating libfoo.so, then it will be statically
linked with libgoo.a and won't have a dependency on libfoo.so.

FYI -

I was not able to see such a statement in the man pages in my system !!!

I tried 'gcc -shared -static -o libfoo.so foo.c -L . -lgoo', but the
output libfoo.so was dynamically linked with libgoo.so though libgoo.a
was present.

Then after some googling, I tried 'gcc -shared -Wl,-static -o libfoo.so
foo.c -L . -lgoo -nostdlib' and it gave me libfoo.so which is statically
linked with libgoo.a. 

Regards,
Cyon P.J. 

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of
Shriramana Sharma
Sent: Wednesday, April 18, 2007 6:03 PM
To: linux-c-programming@vger.kernel.org
Subject: Re: unable to link to a static library present alongside a
shared library

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
-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in the body of a message to
majordomo@vger.kernel.org More majordomo info at
http://vger.kernel.org/majordomo-info.html
