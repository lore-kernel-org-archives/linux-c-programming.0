From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Question about core files
Date: Wed, 7 Oct 2009 05:45:33 +0100
Message-ID: <19148.7405.580856.157196@cerise.gclements.plus.com>
References: <Pine.LNX.4.64.0910061349060.9660@praktifix.dwd.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0910061349060.9660@praktifix.dwd.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: linux-c-programming@vger.kernel.org


Holger Kiehl wrote:

> Most the time I compile my application without the -g option due to
> performance reasons.

The -g switch has absolutely no effect upon performance. It simply
causes and additional section to be added to the resulting binary. 
When the program is run normally (i.e. not under gdb), that section
won't be mapped. The only downside to -g is that it increases the size
of the file.

However: debug information isn't necessarily much help if you compile
with optimisation enabled, as the resulting machine code will bear
little resemblance to the original source code. Statements will be
re-ordered, many variables will be eliminated, etc.

> Problem is that when it hits some bug and dumps
> core, this is not very useful because there is hardly any information
> in it. Is there some way to get some useful information out of
> the core file. For example one of my program crashed and with gdb
> I see the following:

[snip]

> At least I know that the bug is in my function start_process. But is
> there some way to find out at what line it happened?

It isn't meaningful to talk about a "line" in the source code if you
compile with optimisation enabled.

However, you can tell gdb to disassemble the machine code for a
particular function, and you can print the values contained in
registers or at specific memory locations. Working out what that
information means in terms of the source code is something which needs
to be done manually.

-- 
Glynn Clements <glynn@gclements.plus.com>
