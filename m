From: Vadiraj C S <vadiraj@mail.cyberneme.com>
Subject: Re: literal constant..
Date: Tue, 3 Feb 2004 13:04:07 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040203130407.1f77d692.vadiraj@mail.cyberneme.com>
References: <20040203121616.2402884f.vadiraj@mail.cyberneme.com>
	<006601c3ea24$c694d230$ed64a8c0@descartes>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <006601c3ea24$c694d230$ed64a8c0@descartes>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "John T. Williams" <jtwilliams@vt.edu>
Cc: linux-c-programming@vger.kernel.org

On Tue, 3 Feb 2004 02:10:16 -0500
"John T. Williams" <jowillia@vt.edu> wrote:

> char *a = "a";
> means create a pointer and point it at a point in memory that contains the
> string "a"
> 
> char b[1] = "b";
> means create a constant pointer and non-dynamic memory of size 1 char ( 1
> byte ), point the pointer to the memory and assign it the value of "b"
> 
> the major difference is that in the case of 'b', 'b' is a constant pointer
> to a specific place in memory on the stack.  while 'a' can point to any
> legal memory address.
> 


  Ok this is the asm code for the array decl case  c[1]="1".....
 
.file   "temp.c"
        .section        .rodata
.LC0:
        .string "1"
        .text
        .align 2
.globl main
        .type   main,@function
main:
        pushl   %ebp
        movl    %esp, %ebp
        subl    $8, %esp
        andl    $-16, %esp
        movl    $0, %eax
        subl    %eax, %esp
        movb    .LC0, %al
        movb    %al, -1(%ebp)
        movb    $50, -1(%ebp)
        leave
        ret
.Lfe1:
        .size   main,.Lfe1-main
        .ident  "GCC: (GNU) 3.2"

----------------------------
 This is for the pointer dicleration *c = "1" 
I do 


.file   "temp.c"
        .section        .rodata
.LC0:
        .string "1"
        .text
        .align 2
.globl main
        .type   main,@function
main:
        pushl   %ebp
        movl    %esp, %ebp
        subl    $8, %esp
        andl    $-16, %esp
        movl    $0, %eax
        subl    %eax, %esp
        movl    $.LC0, -4(%ebp)
        movl    -4(%ebp), %eax
        movb    $50, (%eax)
        leave
        ret
.Lfe1:
        .size   main,.Lfe1-main
        .ident  "GCC: (GNU) 3.2"


  I do c[0]="2" in both the case, the pointer case it fails cos the values should be constant. 

the diff is only two line

<       movb    .LC0, %al
<       movb    %al, -1(%ebp)
<       movb    $50, -1(%ebp)
---
>       movl    $.LC0, -4(%ebp)
>       movl    -4(%ebp), %eax
>       movb    $50, (%eax)

  I clould not get much about it, Please help me in this...


Thanks

