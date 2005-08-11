From: "linux-os \(Dick Johnson\)" <linux-os@analogic.com>
Subject: Re: __init()
Date: Thu, 11 Aug 2005 08:47:38 -0400
Message-ID: <Pine.LNX.4.61.0508110835480.14365@chaos.analogic.com>
References: <42FB435E.2070607@effigent.net>
Reply-To: "linux-os \(Dick Johnson\)" <linux-os@analogic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <42FB435E.2070607@effigent.net>
Content-class: urn:content-classes:message
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: raja <vnagaraju@effigent.net>
Cc: linux-c-programming@vger.kernel.org, linux-kernel@vger.kernel.org


On Thu, 11 Aug 2005, raja wrote:

> Hi,
>     Is there any way to execute my own __init() instead of default
> __init() while running an executable.
> -

Sure you link your object file with your own instead of using
the default....

     gcc -c -o myprog.o myprog.c
     as -o start.o start.S

     ld -o myprog myprog.o start.o /lib/libc.so.6
                         |       |              |___ runtime lib
                         |       |__________________ Your startup
                         |__________________________ Your program

Startup starts with a label _start. You may have to write it
in assembly. It calls main() and must never return. Instead
it calls exit() with whatever main() returned, to quit.

__init() is some M$ thing. Linux executables start with
_start().

Cheers,
Dick Johnson
Penguin : Linux version 2.6.12 on an i686 machine (5537.79 BogoMips).
Warning : 98.36% of all statistics are fiction.
.
I apologize for the following. I tried to kill it with the above dot :

****************************************************************
The information transmitted in this message is confidential and may be privileged.  Any review, retransmission, dissemination, or other use of this information by persons or entities other than the intended recipient is prohibited.  If you are not the intended recipient, please notify Analogic Corporation immediately - by replying to this message or by sending an email to DeliveryErrors@analogic.com - and destroy all copies of this information, including any attachments, without reading or disclosing them.

Thank you.
