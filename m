From: Daniel Souza <thehazard@gmail.com>
Subject: library calls relocation
Date: Thu, 30 Dec 2004 12:25:28 -0200
Message-ID: <e1e1d5f404123006255ad56324@mail.gmail.com>
Reply-To: Daniel Souza <thehazard@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

anyone knows any docs about how library relocations works ?
for example, i have a library called

/usr/lib/mylib.so.0

that has a function called mylib_init(), and a program that was linked
to use it, like (gcc -o test test.c -lmylib). I know that when the
program is executed, the ld-linux is called to load the required
libraries (that I believe, are listed in some ELF section). The
question is, supposing that in my binary i have a call to
mylib_init(), so it looks something like in objdump -D

pushl (%eax)
call 0x484763ec <mylib_init>

and I know that there is a symbol table that tells that 0x484763ec is
mylib_init from mylib.so.0. The question is: if i increment the
library with other things, etc, and recompile it (maybe in another
machine), the size and addresses of library symbols will get changed.
But, if I copy the compiled library back to the original system, and
run the program, it still working. If the address of mylib_init in the
library has changed, why the 'static' address 0x484763ec used in the
binary still get pointing to the mylib_init in the changed library ?

thanks guys =)
