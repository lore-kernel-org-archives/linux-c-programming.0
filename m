From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: unable to link to a static library present alongside a shared library
Date: Wed, 18 Apr 2007 16:12:16 +0100
Message-ID: <17958.13648.425008.752038@cerise.gclements.plus.com>
References: <46260A74.90309@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <46260A74.90309@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Shriramana Sharma wrote:

> I read recently that someone was not able to link statically to a 
> library which was placed alongside a shared library. Having gained some 
> knowhow from the good people on this list I checked first the ld manpage 
> and found this:
> 
> ld will search a directory for a library with an extension of .so before 
> searching for one with an extension of .a.
> 
> Does anyone know of a way to subvert this behaviour and force linking to 
> the static library?

You can force all libraries to be linked statically using -static. If
you try to use a library for which only a shared library is present,
the link will fail.

If you want to link against a mixture of static and shared libraries,
you can use e.g.

	gcc ... -Wl,-static -lfoo -Wl,-dy -lbar

This will link against libfoo.a (static) and libbar.so (shared).

> BTW what does this mean (found it under man:ld for -static):
> 
> This option can be used with -shared. Doing so means that a shared 
> library is being created but that all of the library's external 
> references must be resolved by pulling in entries from static libraries.
> 
> Does it mean that while creating a shared library, static libraries 
> which the shared library itself depends on must be integrated into the 
> .so file?

Yes.

> So if libfoo depends on libgoo and libgoo.a is available (but not 
> libgoo.so) I will have to specify both -static and -shared to pull the 
> contents of libgoo.a into libfoo.so when it is created?

Note that the compiler will do this even without -static. Using
-static simply means that shared libraries will not be considered when
linking.

When you create a shared library with "gcc -shared ...", and you
specify -l switches, any shared libraries will be listed as
dependencies and any static libraries will have the relevant code
embedded in the target.

> That must further mean that the default behaviour is NOT to integrate a 
> static library into a shared library. Is that right?

No. If you specify a -l switch which refers to a static library, the
relevant code will be embedded in the shared library.

> Seems somewhat 
> contrary to the standard policy of integrating into the target whatever 
> static libraries are linked against, no?

Code which is contained in a shared library should be
position-independent (i.e compiled with -fPIC) so that the library can
actually be shared.

Code which isn't position-independent needs to be relocated at
run-time, which requires modifying the in-memory copy of the library,
which means that the memory cannot be shared.

The code in static libraries often isn't position-independent. This
doesn't matter when using it in an executable, as the position is
fixed at compile time and run-time relocation isn't required.

But for a shared library, the end result will be a library which
cannot actually be shared: effectively just a DLL (dynamically-linked
library) rather than a *shared* library.

Also, on SELinux systems, you typically need to modify the security
policy to allow such libraries to be used, as the default security
policy will prevent the loader from performing the relocation (the
default security policy prohibits memory which has been mapped as
writable from being subsequently mapped as executable).

-- 
Glynn Clements <glynn@gclements.plus.com>
