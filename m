From: Daniel Souza <thehazard@gmail.com>
Subject: Re: x86 and linux stack layout
Date: Sun, 21 Nov 2004 20:07:20 -0300
Message-ID: <e1e1d5f404112115076e67ff03@mail.gmail.com>
References: <e1e1d5f40411210533b3d5ae4@mail.gmail.com>
	 <16800.59320.31823.656094@cerise.gclements.plus.com>
	 <e1e1d5f4041121120770c77ebd@mail.gmail.com>
	 <16801.475.290968.318682@cerise.gclements.plus.com>
Reply-To: Daniel Souza <thehazard@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16801.475.290968.318682@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Tks Gkynn... Good... well, there's a way to 'recover' stripped
binaries ? any fingerprint that identifies where a function starts in
an executable (like you mentioned, a sequence of stack pushing and esp
decreasing) ? there's a safer way to 'detect' functions ?

How runtime loadable libraries are linked to the executable ? the
functions used from that libraries needs to be realocatted ? like...
supose that:

/home/daniel/example1.c
void main(void)
{
   libfoo_init();
}
is compiled and linked to use a runtime library like /lib/libfoo.so.

The executable code of example1 will look like

.....
0x80de4fe8 CALL 0xd3ff483e <libfoo_init>
......

as the executable code will need to be build with a fixed function
address in the CALL opcode... and lets suppose that the address was
0xd3ff483e. Running the same binary in another system, with the same
version of libfoo, but another compilation (i.e., the size of library
and addresses are different), the program will run sucessfuly. The
question is: who realocates the addresses of CALLs ? (if things really
works like that way that im supposing to work)

The addresses along the executable code needs to be rewriten by
something, or there is a "table" where the program finds the desired
function address, and only that table needs to be "reallocated" or
readressable ? like... instead of

.....
0x80de4fe8 CALL 0xd3ff483e <libfoo_init>
......

we have

.....
0x80de4fe8 CALL libfoo_init <libfoo+0x3ef>
......

and a table that tells that libfoo_init is at address 0xYYYYYYYY in
libfoo, or, something else ? when the program starts, something before
the main() (ld.linux) loads all external libraries in the process
address space by mmap'ing the libraries. So, lets supose that libfoo
got mapped at some address AFTER 0xd3ff483e, that is the address in
CALLs. Who will tell the CALLs that libfoo_init() is in another
address ? where these 'tables' are stored on ?

PS: elf sessions are sessions within a elf binary, like, .ctors,
.dtors, etc, ( like, rum "objdump -d /bin/cat", or with the argument
to display all info, that i cant remember right now)

Tks a lot =)

Daniel
