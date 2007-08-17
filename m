From: Per Jessen <per@computer.org>
Subject: Re: String comparison for fixed strings
Date: Fri, 17 Aug 2007 09:49:22 +0200
Message-ID: <46C55302.2050209@computer.org>
References: <9870a8150708150406x6297b877u473bfbbc62949f10@mail.gmail.com>	<200708150918.52599.kratzers@pa.net>	<18115.4550.134335.647087@cerise.gclements.plus.com>	<3493.84.157.36.125.1187198815.squirrel@viridian.dnsalias.net>	<18115.44021.857573.892223@cerise.gclements.plus.com>	<46C3FCF9.7030102@computer.org> <18116.37866.145972.803283@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <18116.37866.145972.803283@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Glynn Clements wrote:

> In particular, branch instructions are dealt with by dedicated logic
> circuitry which does nothing but process branch instructions. This
> enables speculative execution to work handle branches even when the
> calculation of the branch condition hasn't completed.

Yep, I understand all that - it doesn't even have to be a particularly
modern CPU, even IBMs S390 architecture did this in the early '90s.
Speculative execution and branch prediction etc. have both been around
for a while, just not in the Intel world.

Regardless, I still wouldn't say "branches don't normally take any CPU
cycles", but maybe that's splitting hairs.

> The actual cost of a code cache miss varies depending upon the
> relative speed of the CPU and RAM, but 400 cycles is typical. You
> would need to have a lot of additional instructions before their cost
> outweighs that of a cache miss.

Very true, but given the size of L1 cache these days, you also have a
lot more leeway than you did e.g. in the 90s.  A typical memcmp() for
short strings is unrolled by default by gcc.  (at least I'm fairly
certain it does that).


/Per
