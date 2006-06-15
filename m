From: Glynn Clements <glynn@gclements.plus.com>
Subject: RE: Undefined reference to 'fmod'
Date: Thu, 15 Jun 2006 01:20:17 +0100
Message-ID: <17552.42945.974091.909567@cerise.gclements.plus.com>
References: <448C59BA.2090706@colannino.org>
	<010d01c68fc8$f56e1020$0500ac0a@slider>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <010d01c68fc8$f56e1020$0500ac0a@slider>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Stevenson <james@stev.org>
Cc: 'James Colannino' <james@colannino.org>, 'Linux C Programming List' <linux-c-programming@vger.kernel.org>


James Stevenson wrote:

> > > No, fmod() is in libm, so you have to add -lm to the link command.
> > >
> > > As a general rule, anything which uses <math.h> has to link against
> > > libm.
> > 
> > Interesting.  Compiling with the argument -lm fixed my problem.  That
> > leads me to another question: why are the functions found in math.h in a
> > separate library?  I would have thought that all functions found in the
> > standard C library would be in glibc (The K&R book I'm reading said that
> > math.h is a part of the standard library.)
> 
> It cant be not all processors have floating point unit's Therefor it cannot
> be in the main standard libary

There are some functions in libc which use floating-point. Also, FP is
part of the C language itself; on processors which don't support FP in
hardware, you just emulate it.

The reason for the use of a separate math library is more likely to be
so that you can have different versions for systems with and without
FP support. Implementing FP math functions using an FP emulation
library is likely to be more efficient that relying upon generic FP
emulation.

Generic FP emulation normally works by handling "illegal instruction"
exceptions, which occur if a CPU without FP support attempts to
execute a FP instruction. The exception handler then emulates the
instruction in software. Exception handling normally adds significant
overhead, so it's more efficient to replace FP instructions with calls
to functions in an FP emulation library.

-- 
Glynn Clements <glynn@gclements.plus.com>
