From: "Sandro Dangui" <sdangui@nortelnetworks.com>
Subject: RE: literal constant..
Date: Tue, 3 Feb 2004 09:41:11 -0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <31E38B53D182D51195FA00508BE3A334033CA936@zwnbc004.cala.nortel.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vadiraj C S <vadiraj@mail.cyberneme.com>
Cc: linux-c-programming@vger.kernel.org


The main difference (while programming) between variable "a" and "b" is that
you cannot use "b" in string operations. I mean, "b" does not contain the
character '\0' at the end, and if you use functions like strcmp(), strcpy(),
etc., you will have problems...
If you look the contents of "a" in memory you will see "a\0" (2 bytes). And
"b" in memory will be "b" (just one byte).

Sandro.


-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of Vadiraj C S
Sent: Tuesday, February 03, 2004 5:34 AM
To: John T. Williams
Cc: linux-c-programming@vger.kernel.org
Subject: Re: literal constant..


On Tue, 3 Feb 2004 02:10:16 -0500
"John T. Williams" <jowillia@vt.edu> wrote:

> char *a = "a";
> means create a pointer and point it at a point in memory that contains 
> the string "a"
> 
> char b[1] = "b";
> means create a constant pointer and non-dynamic memory of size 1 char 
> ( 1 byte ), point the pointer to the memory and assign it the value of 
> "b"
> 
> the major difference is that in the case of 'b', 'b' is a constant 
> pointer to a specific place in memory on the stack.  while 'a' can 
> point to any legal memory address.
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


  I do c[0]="2" in both the case, the pointer case it fails cos the values
should be constant. 

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

-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

