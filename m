From: "Amit Dang" <amit_dang@intersolutions.stpn.soft.net>
Subject: Re: library calls relocation
Date: Fri, 31 Dec 2004 09:47:22 +0530
Message-ID: <011701c4eeef$a3455180$9736a8c0@ispl091>
References: <e1e1d5f404123006255ad56324@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Souza <thehazard@gmail.com>, linux-c-programming@vger.kernel.org

Hi Daniel, you can get more detail about code relocation, dynamic linking
etc .... from the Book Linkers and Loaders By Morgan-Kaufman. Soft copy of
this book is available at http://www.iecc.com/linker/. Refer Chapter 7
Relocation , Chapter 8 Shared Libraries and Chapter 9 Dynamic Linking and
Loading. I hope this will give you a detailed knowledge.

Thanks,
Amit Dang
----- Original Message ----- 
From: "Daniel Souza" <thehazard@gmail.com>
To: <linux-c-programming@vger.kernel.org>
Sent: Thursday, December 30, 2004 7:55 PM
Subject: library calls relocation


> anyone knows any docs about how library relocations works ?
> for example, i have a library called
>
> /usr/lib/mylib.so.0
>
> that has a function called mylib_init(), and a program that was linked
> to use it, like (gcc -o test test.c -lmylib). I know that when the
> program is executed, the ld-linux is called to load the required
> libraries (that I believe, are listed in some ELF section). The
> question is, supposing that in my binary i have a call to
> mylib_init(), so it looks something like in objdump -D
>
> pushl (%eax)
> call 0x484763ec <mylib_init>
>
> and I know that there is a symbol table that tells that 0x484763ec is
> mylib_init from mylib.so.0. The question is: if i increment the
> library with other things, etc, and recompile it (maybe in another
> machine), the size and addresses of library symbols will get changed.
> But, if I copy the compiled library back to the original system, and
> run the program, it still working. If the address of mylib_init in the
> library has changed, why the 'static' address 0x484763ec used in the
> binary still get pointing to the mylib_init in the changed library ?
>
> thanks guys =)
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

