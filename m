From: bkerin <bkerin@fastmail.fm>
Subject: malloc interposition how?
Date: Wed, 16 Jul 2008 20:55:20 -0700 (PDT)
Message-ID: <18501119.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


I'm trying to do these things simultaneously:

use glib
use gc (Hans-Boehm)
use my own library of random code

I dont want to have to do manual garbage collection at least in the
prototype stage.

However, I haven't found a way to link the above together that works.

I use the set_vtable function in glib to hopefully make it use the GC_malloc
etc. from gc

I include fcnts malloc/free/realloc in my library and the compiler/linker
doesn't complain
(presumably libc contains some special goop to not complain about these
getting redefined
in client code).  My malloc etc. of course just call GC_* fctns.

I believe I have all the right -I -L -Wl,-rpath etc. crud.

When I look at bins and my .so file with ldd everything appears to look for
the correct libraries.

When I use nm on my .so I see symbols like malloc supposedly in the text
secion (marked with T).

When I step with the debugger and a breakpoint in malloc (or realloc etc.) I
always end up in the malloc
in my library, not the system malloc.

And yet, the program always seg faults eventually in a GC_malloc.

Any ideas what I'm missing, or is the whole approach somehow fatally flawed?

I've also tried using --wrap linker option, but it seemed to only map
function defined in the source files being linked and
didn't affect the use of malloc etc. by depended-on libraries (I ultimately
need this to work for gsl (GNU scientific library as well not only glib
which provides the set_vtable functionality).

Thanks,
Britton
-- 
View this message in context: http://www.nabble.com/malloc-interposition-how--tp18501119p18501119.html
Sent from the linux-c-programming mailing list archive at Nabble.com.

