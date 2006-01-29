From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Debugging
Date: Sun, 29 Jan 2006 17:21:38 +0100
Message-ID: <6a00c8d50601290821q38b1b38esc773ccf1125c3c1f@mail.gmail.com>
References: <43DC5EFA.7010001@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <43DC5EFA.7010001@colannino.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 1/29/06, James Colannino <james@colannino.org> wrote:
> Hey everyone.  I have a small program that I had written a while ago in
> C to help me study for my Spanish class.  I decided to rewrite some code
> recently being that I have a little more experience, and found that the
> program does not function properly when I compile with -O2 optimizations
> (I'm using GCC.)  It works as it should, however, when there are no
> optimizations.  How exactly should I go about debugging this and
> figuring out what code is causing the problem?  I could compile it with
> the -g option and feed it to GDB, but then doesn't debugging not work
> very well when you've done optimizations?  Is -O2 a low enough level of
> optimization that I shouldn't have a problem?  Debugging is one of the
> many things I know extremely little about, so I'm very in the dark
> here.  Any input would be greatly appreciated :)  Thanks very much in
> advance.

James,

debugging optimized code is very difficult for the following reasons
(to name a few):

   - due to a technique known as "common subexpression elimination"
you may not be able to stop on certain statements, although you think
it should be possible.,
   - instruction scheduling causes statements (typically those
resulting in load/store operations as found in computations of values)
to be moved around, i.e. move them close to the location where they
are used,
   - sometimes similar code fragments are merged so that the program
counter jumps to unexpected locations (often seen with return or break
statements).

There are other anomalies you may encounter when debugging optimized
code and I therefore recommend to increase the level of optimization
step by step beginning with -O0 and then to debug at each level to
check for unexpected values of variables and other bogus behavior.  I
am sure the GCC/gdb manual will reveal some helpful information about
debugging.

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultant {C/C++ && Java && .NET}
Office: +49 9131 7123988
Mobile: +49 1520 9289212
