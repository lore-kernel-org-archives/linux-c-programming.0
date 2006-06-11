From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Undefined reference to 'fmod'
Date: Sun, 11 Jun 2006 21:20:54 +0200
Message-ID: <6a00c8d50606111220t3eeee679u8b6ef5b707fb6a59@mail.gmail.com>
References: <448B9DA5.7050708@colannino.org>
	 <17547.46674.360830.637227@cerise.gclements.plus.com>
	 <448C59BA.2090706@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <448C59BA.2090706@colannino.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

On 6/11/06, James Colannino <james@colannino.org> wrote:
> Glynn Clements wrote:
>
> > No, fmod() is in libm, so you have to add -lm to the link command.
> >
> > As a general rule, anything which uses <math.h> has to link against
> > libm.
>
> Interesting.  Compiling with the argument -lm fixed my problem.  That
> leads me to another question: why are the functions found in math.h in a
> separate library?  I would have thought that all functions found in the
> standard C library would be in glibc (The K&R book I'm reading said that
> math.h is a part of the standard library.)

The functions in libm allow to create portable programs with
well-defined and standard-compliant behavior, e.g. when numerical
errors occur, and provide the application with a means to control
their behavior in abnormal cases via the matherr callback.
Additionally, they almost never rely on the features specific to
processor architectures and are thus slower and sometimes slightly
less accurate than the functions from libc.

libc functions OTOH are written for speed and exploitation of
CPU-specific features; they do not call matherr, and are therefore
much faster and, due to the extended 80-bit precision with which the
Intel FPUs carry their calculations, sometimes more accurate.

	\Steve
