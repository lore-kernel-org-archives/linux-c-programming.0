From: Micha Feigin <michf@post.tau.ac.il>
Subject: Re: "static const" attribute in C++ (How to ?)
Date: Thu, 1 Jul 2004 06:22:27 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040701032226.GB3419@luna.mooo.com>
References: <40E09FC4.50800@ig.com.br> <16608.44836.384260.844173@cerise.nosuchdomain.co.uk> <20040629143238.GD6335@luna.mooo.com><16609.43579.336662.194984@cerise.nosuchdomain.co.uk>
 <20040630013316.GF9412@luna.mooo.com> <40E32513.1090502@comcast.net> <16611.16213.876963.610967@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16611.16213.876963.610967@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming <linux-c-programming@vger.kernel.org>

On Wed, Jun 30, 2004 at 11:31:49PM +0100, Glynn Clements wrote:
> 
> John Richard Moser wrote:
> 
> > |>It doesn't matter. A #include directive simply inserts the contents of
> > |>the header file directly into the source code which is fed to the
> > |>compiler. The compiler doesn't care which file a given piece of code
> > |>comes from.
> > |>
> > |
> > | It is a problem since a header can be included more then once, and
> > 
> > Umm.
> > 
> > #import "foo.h"
> > 
> > This includes only one time.  I'd only use this with Objective-C though.
> > 
> > For C, and in general, you should use:
> > 
> > #ifndef __FOO_H__
> > #define __FOO_H__
> > 
> > ....
> > 
> > #endif /*__FOO_H__*/
> 
> That only prevents against the header being included multiple times
> within a given compilation unit, which isn't the issue which was being
> discussed. The issue was that, if an lvalue is defined (as opposed to
> declared) in a header file, it will exist in every object file whose
> source code included the header.
> 
> The key point is that C++ appears to treat initialised "static const"
> members as compile-time constants, not as lvalues. Thus, they don't
> exist in any object file, and so the problem of them existing in
> multiple object files doesn't arise.

That can't be true; What happens if the static int value is defined in
another file? it's value won't be known at compile time, only at link
time. What g++ may be doing is ignoring the problem of multiple
definitions if they have the same value.

It does allow initializing array size using static const, unlike gcc, I
don't know the mechanism, but I believe it also requires linker
support, not only compiler.

I compiled a sample program with a static const int val = 10; and then
ran nm on it and in the output:

a.out:080484c4 r val

so the value is in the object, read only data if I recall the section
symbols correctly.

> 
> -- 
> Glynn Clements <glynn.clements@virgin.net>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  
>  +++++++++++++++++++++++++++++++++++++++++++
>  This Mail Was Scanned By Mail-seCure System
>  at the Tel-Aviv University CC.
> 
