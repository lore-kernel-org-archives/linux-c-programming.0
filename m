From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: "static const" attribute in C++ (How to ?)
Date: Wed, 30 Jun 2004 23:31:49 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16611.16213.876963.610967@cerise.nosuchdomain.co.uk>
References: <40E09FC4.50800@ig.com.br>
	<16608.44836.384260.844173@cerise.nosuchdomain.co.uk>
	<20040629143238.GD6335@luna.mooo.com>
	<16609.43579.336662.194984@cerise.nosuchdomain.co.uk>
	<20040630013316.GF9412@luna.mooo.com>
	<40E32513.1090502@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <40E32513.1090502@comcast.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Richard Moser <nigelenki@comcast.net>
Cc: Micha Feigin <michf@post.tau.ac.il>, linux-c-programming <linux-c-programming@vger.kernel.org>


John Richard Moser wrote:

> |>It doesn't matter. A #include directive simply inserts the contents of
> |>the header file directly into the source code which is fed to the
> |>compiler. The compiler doesn't care which file a given piece of code
> |>comes from.
> |>
> |
> | It is a problem since a header can be included more then once, and
> 
> Umm.
> 
> #import "foo.h"
> 
> This includes only one time.  I'd only use this with Objective-C though.
> 
> For C, and in general, you should use:
> 
> #ifndef __FOO_H__
> #define __FOO_H__
> 
> ....
> 
> #endif /*__FOO_H__*/

That only prevents against the header being included multiple times
within a given compilation unit, which isn't the issue which was being
discussed. The issue was that, if an lvalue is defined (as opposed to
declared) in a header file, it will exist in every object file whose
source code included the header.

The key point is that C++ appears to treat initialised "static const"
members as compile-time constants, not as lvalues. Thus, they don't
exist in any object file, and so the problem of them existing in
multiple object files doesn't arise.

-- 
Glynn Clements <glynn.clements@virgin.net>
