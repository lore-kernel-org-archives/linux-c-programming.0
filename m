From: Stefano Bonifazi <stefboombastic@gmail.com>
Subject: URGENT R_PPC_REL24 relocation at ... for symbol out of range
Date: Wed, 16 Feb 2011 10:45:55 +0100
Message-ID: <ijg6ci$cnp$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi!
  I am working on a project using powerpc binaries I create myself.
I am creating the binaries using Debian 6 kernel 2.6.32.5 powerpc 
running in a qemu VM, with gcc 4.4.5-8, binutils 2.20.1 eglibc 2.11.2-10
My binaries are someway special being compiled with -fPIC and linked 
with -pie (gcc -Wl,-pie) as I need full relocatable PIC executables.
These binaries are in fact loaded by qemu-user in different memory 
addresses.
My project (open source, as it is a university project) works fine when 
I do not use libgcc (using gcc -nostartfiles) for creating my powerpc 
executable, but it is impossible to build useful binaries without using it.
When I compile without "-nostartfiles", having libgcc added to my binary 
I get the following error at runtime:

 > R_PPC_REL24 relocation [...] __libc_start_main' out of range


I tried to link my binaries as static but I get the following:


 >   R_PPC_REL24 relocation at ... for symbol __nptl_deallocate_tsd out 
of range
In some old thread I read it is related to non PIC code being linked 
together with PIC code. But the code producing the problem seems libgcc.

Is there a way for fixing this problem? Is there anybody able of explain 
fine what happens?
I have got a very strict deadline, but I can't understand fine what the 
problem is, I keep trying to install different debian versions hoping 
they would fix it..
Thank you very much in advance!
Stefano B.

