From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: String comparison for fixed strings
Date: Thu, 16 Aug 2007 19:14:02 +0100
Message-ID: <18116.37866.145972.803283@cerise.gclements.plus.com>
References: <9870a8150708150406x6297b877u473bfbbc62949f10@mail.gmail.com>
	<200708150918.52599.kratzers@pa.net>
	<18115.4550.134335.647087@cerise.gclements.plus.com>
	<3493.84.157.36.125.1187198815.squirrel@viridian.dnsalias.net>
	<18115.44021.857573.892223@cerise.gclements.plus.com>
	<46C3FCF9.7030102@computer.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <46C3FCF9.7030102@computer.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Per Jessen <per@computer.org>
Cc: linux-c-programming@vger.kernel.org


Per Jessen wrote:

> > No, but Stephen mentioned that strcmp() "uses a do/while loop".
> > On a modern CPU, branches don't normally take any CPU cycles.
> 
> I would have thought everything takes CPU cycles, modern CPU or not?

The Intel architecture from the Pentium Pro onwards has a great deal
of parallelism. It can commence and complete up to 3 instructions per
CPU cycle, but in practice it will almost never be able to sustain
that rate continuously. Adding another instruction will only require
additional CPU cycles if the instruction delays processing of
subsequent instructions.

In particular, branch instructions are dealt with by dedicated logic
circuitry which does nothing but process branch instructions. This
enables speculative execution to work handle branches even when the
calculation of the branch condition hasn't completed.

The end result is that the only difference between a loop and an
unrolled loop is that the unrolled loop results in the branch
processing logic remaining idle.

More generally, duplicating blocks of code (e.g. unrolling loops or
having multiple specialised versions of a routine instead of one
generalised version) is usually a net loss on modern architectures, as
cache coherence (particularly for code) has a far greater impact than
the total number of instructions executed, due to the fact that the
CPU is much faster than the RAM.

The actual cost of a code cache miss varies depending upon the
relative speed of the CPU and RAM, but 400 cycles is typical. You
would need to have a lot of additional instructions before their cost
outweighs that of a cache miss.

-- 
Glynn Clements <glynn@gclements.plus.com>
