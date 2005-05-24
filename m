From: "lk" <linux_kernel@patni.com>
Subject: Re: Good book
Date: Tue, 24 May 2005 10:36:21 +0530
Message-ID: <000801c5601e$5612b880$5e91a8c0@patni.com>
References: <20050524034750.70100.qmail@web51307.mail.yahoo.com>
Reply-To: "lk" <linux_kernel@patni.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ram S <linux_guy_76@yahoo.com>, linux-c-programming@vger.kernel.org

>I am a new to linux. While going through the kernel
>code, I saw couple of routines beginning with __ e.g
> __init free_all_bootmem_core (in mm/bootmem.c). Any
>specific reason why it is so ?

usually the methods starting with __ are the core routines & there would be
some wrapper to it..
say do_page_fault();  is a wrapper which internally calls __do_page_fault();

The __init token in the definition may look a little strange; it is a hint
to the kernel that the given function is
used only at initialization time. The module loader drops the initialization
function after the module is loaded, making its memory available for other
uses.
There is a similar tag (__initdata)for data used only during initialization.

You may also encounter __devinit and __devinitdata in the kernel source;
these translate to __init and __initdata only if the kernel has not been
configured for
hotpluggable devices.

>I know this may be a
>very basic thing that I am asking and I need to to
>read more. Can you point to me some good book which
>I can refer and get some of the basic doubts
>clarified ?

1] "Understanding the linux kernel" by "Bovet & Cesati " is a good book to
get the insight of kernel...
you can also look at some ebooks like..
2] Linux Kernel 2.4 Internals by Tigran Aivazian tigran@veritas.com
http://www.linuxdoc.org/guides.html
3]Linux Kernel Hackers Guide..

regqrds
lk


