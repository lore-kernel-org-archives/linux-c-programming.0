From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Re: unable to link to a static library present alongside a shared
 library
Date: Wed, 18 Apr 2007 23:04:21 +0530
Message-ID: <4626569D.7000200@gmail.com>
References: <70661EB74D51BD4889EE03CC34E733F5A766BA@blr-m2-msg.wipro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <70661EB74D51BD4889EE03CC34E733F5A766BA@blr-m2-msg.wipro.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cyon.john@wipro.com
Cc: linux-c-programming@vger.kernel.org

cyon.john@wipro.com wrote:

> That "-shared -static" option becomes relevant when both libgoo.so and
> libgoo.a are present. By default, libfoo.so will be dynamically linked
> with libgoo.so and will be a dependency. But if used "-static" along
> with "-shared" while creating libfoo.so, then it will be statically
> linked with libgoo.a and won't have a dependency on libfoo.so.

You are talking about the ordinary behaviour. -static always is used to 
mandate linking to a static lib and deny linking to a shared lib. 
Whether the target being built is an executable or a shared lib is 
immaterial.

> I was not able to see such a statement in the man pages in my system !!!

Dunno why. I'm using Kubuntu Edgy and my binutils version is 
2.17-1ubuntu1. The statement about using -shared and -static together is 
there in the documentation for the -static option (end of the paragraph) 
and is probably intended to clarify to the users that -static and 
-shared are not conflicting and only -static and -call_shared are 
conflicting. It could be rewritten.

> I tried 'gcc -shared -static -o libfoo.so foo.c -L . -lgoo', but the
> output libfoo.so was dynamically linked with libgoo.so though libgoo.a
> was present.
> 
> Then after some googling, I tried 'gcc -shared -Wl,-static -o libfoo.so
> foo.c -L . -lgoo -nostdlib' and it gave me libfoo.so which is statically
> linked with libgoo.a.

What's the difference? gcc will transparently pass on the -static option 
to ld if I read my man:gcc page right, and -nostdlib is to prevent 
linking to standard system libraries which libgoo is certainly not! How 
do the two commands give a different effect?

Shriramana Sharma.
