From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: x86 and linux stack layout
Date: Mon, 22 Nov 2004 03:50:16 +0000
Message-ID: <16801.25080.296482.584911@cerise.gclements.plus.com>
References: <e1e1d5f40411210533b3d5ae4@mail.gmail.com>
	<16800.59320.31823.656094@cerise.gclements.plus.com>
	<e1e1d5f4041121120770c77ebd@mail.gmail.com>
	<16801.475.290968.318682@cerise.gclements.plus.com>
	<e1e1d5f404112115076e67ff03@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <e1e1d5f404112115076e67ff03@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Souza <thehazard@gmail.com>
Cc: linux-c-programming@vger.kernel.org


Daniel Souza wrote:

> Tks Gkynn... Good... well, there's a way to 'recover' stripped
> binaries ? any fingerprint that identifies where a function starts in
> an executable (like you mentioned, a sequence of stack pushing and esp
> decreasing) ? there's a safer way to 'detect' functions ?

Exported functions exist in the symbol table regardless of whether the
executable has been stripped. Stripping removes the debug information,
but exported functions must still be identifiable in case they are
required for linking.

Note that "nm" normally displays the debug information, while "nm -D"
displays the symbol table used for linking.

As for detecting function boundaries, any address which is the target
of a CALL instruction is likely to be the start of a function. I don't
think that there's a more reliable way to detect the end of a
function.

> How runtime loadable libraries are linked to the executable ? the
> functions used from that libraries needs to be realocatted ?

Calls to functions in shared libraries are implemented using indirect
jumps, so only the table of addresses needs to be relocated. 
Performing relocations directly on the text sections would prevent the
memory from being shared between multiple processes.

The situation is complicated by lazy binding, where the addresses
initially point into the loader; the first time that a function is
called, the loader finds the actual address then replaces the indirect
address.

If you want the exact details, use "objdump -d ..." to disassemble the
binary, or use gdb's "disassemble" command (and the "stepi"
instruction to step by machine code instructions rather than by C
statements).

> PS: elf sessions are sessions within a elf binary, like, .ctors,
> .dtors, etc, ( like, rum "objdump -d /bin/cat", or with the argument
> to display all info, that i cant remember right now)

Those are called "sections" (or sometimes "segments").

-- 
Glynn Clements <glynn@gclements.plus.com>
