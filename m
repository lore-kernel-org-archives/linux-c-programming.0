From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Debugging
Date: Sun, 29 Jan 2006 18:14:25 +0000
Message-ID: <17373.1537.756816.193269@cerise.gclements.plus.com>
References: <43DC5EFA.7010001@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <43DC5EFA.7010001@colannino.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Colannino <james@colannino.org>
Cc: linux-c-programming@vger.kernel.org


James Colannino wrote:

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

Debugging optimised code is hard, as many of the expressions and
variables which appear in the source code simply don't exist in the
optimised machine code.

One option is to identify exactly which optimisations are problematic
by enabling or disabling specific optimisations using the various -f
switches. That might give you some clues as to where the problems lie.

Probably the most common reasons for code breaking when optimisation
is enabled are aliasing bugs, i.e. where a storage location is
referenced in multiple ways. This is particularly common if you use
pointer type casts or "type-punning" (storing a value in one field of
a union then reading from another field with a different type). Try
using -fno-strict-aliasing to see if aliasing is the problem.

-- 
Glynn Clements <glynn@gclements.plus.com>
