From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Why does linking a.so with b.so require execs to be linked both
 -la and -lb?
Date: Tue, 12 Aug 2003 14:49:04 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16184.61520.502240.104624@cerise.nosuchdomain.co.uk>
References: <m3k79jj4av.fsf@bfnet.com>
	<tmml01xphg.ln2@thune.mrc-home.org>
	<m3vft320sv.fsf@bfnet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <m3vft320sv.fsf@bfnet.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Wuertele <dave-gnus@bfnet.com>
Cc: linux-c-programming@vger.kernel.org


David Wuertele wrote:

> I asked my friend, who is a windows programmer, whether windows had
> the same behavior.  He said absolutely not, and generated this test.
> His test is even more interesting than mine.  It does the following:
> 
> 1.  build two libraries libA and libB.  libA has one function that
>     calls a function in libB.
> 2.  link libA and libB
> 3.  Erase libB
> 4.  link a program that uses A's function with libA --- WITHOUT HAVING
>     ACCESS TO libB!
> 
> Why can't we do this on Linux?
> 
> Here's the windows demonstration:

> C:\libtest>type libA.h 
> // FILE: libA.h
> 
> extern __declspec(dllimport) void libA_func();

> C:\libtest>type libA.c 
> // FILE: libA.c
> 
> #include "libB.h"
> 
> extern __declspec(dllexport) void libA_func()
> {
>     printf("libA_func() calling libB_func()\n");
>     libB_func();
> }

So libA_func() calls libB_func(). So any program which calls
libA_func() will only work if libB.dll is available.

> C:\libtest>type prog.c 
> #include <stdio.h>
> #include "libA.h"
> 
> int main(int argc, const char ** argv)
> {
>     printf("prog.exe calling libA_func()\n");
>     libA_func();
>     printf("prog.exe exiting\n");
>     return 0;
> }

So this program requires libB.dll.

> C:\libtest>REM -- erase all of the libB output files to prove that linking 
> 
> C:\libtest>REM -- prog.c doesn't depend on libB. 
> 
> C:\libtest>erase libB.obj libB.dll libB.exp libB.lib  

> C:\libtest>REM -- compile prog.c into prog.exe 
> 
> C:\libtest>cl prog.c libA.lib 
> prog.c
> Microsoft (R) Incremental Linker Version 6.00.8447
> Copyright (C) Microsoft Corp 1992-1998. All rights reserved.
> 
> /out:prog.exe 
> prog.obj 
> libA.lib 
> 
> C:\libtest>REM -- now that prog.exe has built, re-compile and link 
> 
> C:\libtest>REM -- libB so that prog.exe will run 

So, what you are asking is why Linux requires the indirect
dependencies to be present at link time, right?

One fundamental difference between the way in which Linux and Windows
handle shared libraries is that Windows associates external references
(either from a program or from a DLL) with a specific library. E.g. 
the program will have a dependency upon "libA_func in libA.dll", while
libA.dll will have a dependency upon "libB_func in libB.dll".

OTOH, on Linux, the dependency isn't associated with a specific
library. E.g. libA.so just needs libB_func; it doesn't matter where it
comes from. If the program exported that function, you could link
against libA.so without libB.so (unless libA.so listed it as an
explicit dependency).

One consequence of this difference is that Linux allows an executable
to export symbols to a library. Thus you can create a library with
unresolved references (i.e. symbols not provided by either the library
or any of it's explicit dependencies). So long as that symbol actually
gets provided at run-time (e.g. by the executable itself), everything
works.

The fact that Windows disallows this (every import has to be provided
by a specific library, not some yet-to-be-built executable) allows it
to perform the check for a specific library when that library is
built. OTOH, Linux can't perform the check until the final link.

BTW, In most cases, it doesn't actually *need* to do it until
run-time; the run-time linker just loads everything and, so long as
there are no unresolved symbols at that point, everything works. The
one exception is that, unless you use the -E switch, the executable
will only export those symbols which are required by any of the
libraries; consequently, this complete set of libraries must be
available to the linker.

In any case: if you need libB.so to actually run the executable, why
does it matter if you need it in order to link the program?

-- 
Glynn Clements <glynn.clements@virgin.net>
