From: "John T. Williams" <jowillia@vt.edu>
Subject: Re: Boot code in C
Date: Mon, 05 Jul 2004 13:36:05 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1089048965.8347.16.camel@localhost>
References: <1089035369.7299.48.camel@kaushal>
Reply-To: jtwilliams@vt.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1089035369.7299.48.camel@kaushal>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kaushal <kaushal@rocsys.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

there are a couple of issues involved.
1.  when you compile C programs they are linked against the at least the
C library on your computer.  You can take care of that by using the
-static directive with either the linker or the gcc, but you have to
have already installed the static version all libraries you link
against. which you can find out using the ldd tool
2.  System calls are part of The OS, so if you want a program to execute
w/o first loading the kernel, you can't make any system calls.  This
includes every input output function that I know of.  
3.  you need a boot loader.  The BIOS will load the bootsector of a
floppy into memory, and if your program is small enough to fit in the
boot sector, then you have no problem, otherwise you have to write code
to open your disk's filesystem, find your program, load it into memory
and then start executing it.  

In short, if you really want a program which runs off a floppy, and does
anything useful, you need to learn a little assembly.

	



On Mon, 2004-07-05 at 09:49, kaushal wrote:
> Hello  all,
>           I want to know if there is a way to  generate a binary file,
> from  a C program(Not from an assembly code)(can use any Linux
> tools)that can be burned on to a floppy and which ,say--  just prints a
> string on to the screen.
> I tried out to the following:
> 
> 
> 1.[kaushal@linuxbox]#cc Hello.c -static -o Hello
>   [kaushal@linuxbox]#strip Hello
>   [kaushal@linuxbox]#objcopy -O binary Hello Hello.bin
>   [kaushal@linuxbox]#dd if=Hello.bin of=/dev/floppy
> 
> 
> 2.[kaushal@linuxbox]#cc Hello.c -S 
>   [kaushal@linuxbox]#as Hello.s -o Hello
>   [kaushal@linuxbox]#strip Hello
>   [kaushal@linuxbox]#objcopy -O binary Hello Hello.bin
>   [kaushal@linuxbox]#dd if=Hello.bin of=/dev/floppy
> 
> In the second case (2.)(Even if I don't give a "-static" switch for the
> first one(1.)) the Hello size is MUCH less than its counterpart of case
> (1.)
> Either way it did not work.I think the problem occurs because of absence
> of OS at boot time.So is there any way of atleast generating the
> required assembly code from the C code(The optimised one).
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

