From: kaushal <kaushal@rocsys.com>
Subject: Boot code in C
Date: 05 Jul 2004 19:19:29 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1089035369.7299.48.camel@kaushal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Hello  all,
          I want to know if there is a way to  generate a binary file,
from  a C program(Not from an assembly code)(can use any Linux
tools)that can be burned on to a floppy and which ,say--  just prints a
string on to the screen.
I tried out to the following:


1.[kaushal@linuxbox]#cc Hello.c -static -o Hello
  [kaushal@linuxbox]#strip Hello
  [kaushal@linuxbox]#objcopy -O binary Hello Hello.bin
  [kaushal@linuxbox]#dd if=Hello.bin of=/dev/floppy


2.[kaushal@linuxbox]#cc Hello.c -S 
  [kaushal@linuxbox]#as Hello.s -o Hello
  [kaushal@linuxbox]#strip Hello
  [kaushal@linuxbox]#objcopy -O binary Hello Hello.bin
  [kaushal@linuxbox]#dd if=Hello.bin of=/dev/floppy

In the second case (2.)(Even if I don't give a "-static" switch for the
first one(1.)) the Hello size is MUCH less than its counterpart of case
(1.)
Either way it did not work.I think the problem occurs because of absence
of OS at boot time.So is there any way of atleast generating the
required assembly code from the C code(The optimised one).


