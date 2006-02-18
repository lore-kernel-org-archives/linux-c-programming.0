From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Cross-compiling for Windows under Linux
Date: Sat, 18 Feb 2006 18:48:17 +0000
Message-ID: <17399.27633.946663.220962@cerise.gclements.plus.com>
References: <200602181515.14801.samjnaa@gmail.com>
	<17398.63456.306627.660842@cerise.gclements.plus.com>
	<200602182120.54259.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200602182120.54259.samjnaa@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>


Shriramana Sharma wrote:

> > 	http://vmlinux.org/crash/mirror/www.objsw.com/CrossGCC/
> 
> It's far above my head. Can anyone please explain what they are doing?

The FAQ explains how to compile versions of binutils and gcc which run
on Linux but which generate binaries for other platforms (e.g. 
Windows).

The GNU tools (gcc, as (the assembler), ld (the linker) etc) can
generate code for a wide variety of platforms, including Linux and
Windows. They are written in C, and can be compiled to run on a wide
variety of platforms. The platform on which the compiler/linker/etc
runs doesn't have anything to do with the platform for which it
generates binaries.

When you run the binutils/gcc/etc configure script, you use the
--target option to tell it which platform you want it to generate code
for (if you don't use this switch, it assumes that you want it to
generate code for the platform on which the compiler runs).

E.g. if you want a compiler which generates Windows binaries, you
would use --target=i686-pc-mingw32 (this worked the last time I built
cross-gcc; check the installation instructions supplied with gcc for
an up-to-date list of target names).

> Are they suggesting GCC can be used as I have it in my system (4.02
> BTW) to create Windows binaries?

The normal gcc and binutils packages from your OS vendor won't be able
to generate Windows binaries. You need versions which were built to
generate Windows (rather than Linux) binaries.

You might be able to get pre-compiled cross-gcc/binutils binaries for
your system, otherwise you will need to build them from source.

> There is some mention of a patch. Am I to build gcc myself from
> sources after applying the patch?

You shouldn't need any patches. The one mentioned in section 3 of the
FAQ is specific to MS-DOS. You don't need it to generate Windows
binaries.

-- 
Glynn Clements <glynn@gclements.plus.com>
