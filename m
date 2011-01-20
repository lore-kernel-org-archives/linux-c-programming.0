From: "Michal Nazarewicz" <mina86@mina86.com>
Subject: Re: Dynamic linking library
Date: Thu, 20 Jan 2011 15:50:36 +0100
Message-ID: <op.vpl3imhx3l0zgt@mnazarewicz.zrh.corp.google.com>
References: <AANLkTinrAZgHcpjbdYt53y+wqK4F9OBUH8PtMyxvwXEO@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:content-type:to:subject:references:date
         :mime-version:content-transfer-encoding:from:organization:message-id
         :in-reply-to:user-agent;
        bh=e8fCk3odO1rLMu/fDhRQKUV4ZxEfZwxgyer/EfVYtwM=;
        b=jwV0no70hy+grd6U8g2oFpXvI34oRTJRiex6i+L/GwcRYQABTIUtx4DzkKiagfaX69
         zqnM5NSe0h+Z0Zc6e+jB661rsAlaHCsIFNUGQ0wPFyLARJ70ice4/xsVXYS3wmwuqjEy
         HDqJr5jQtrfB9skRST33Ytr+vA+UwPsFuKGok=
In-Reply-To: <AANLkTinrAZgHcpjbdYt53y+wqK4F9OBUH8PtMyxvwXEO@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: linux-c-programming@vger.kernel.org, ratheesh k <ratheesh.ksz@gmail.com>

On Thu, 20 Jan 2011 12:37:25 +0100, ratheesh k <ratheesh.ksz@gmail.com>  
wrote:

> Suppose there are two executable elf . say A, B . And these two are
> using  libctest.so.
> When A is executed  libctest.so is loaded into RAM and linear address
> is  correctly mapped.
>
> If we execute program B after A ,  will library will be loaded again ?

When A is executed dynamic loader opens the library and then mmap(2)s it
into virtual address space.

When B is executed, from user space (ie. dynamic loader) point of view the
very same thing happens: dynamic loader opens the library and mmap(2)s it
into virtual address space.

What happens behind the scene, is that when the libctest.so is opened, file
system figures out it's inode and then opens file with given inode number.
The first time this is done, system creates all bunch of structures for
the file, however, the second time, system sees that a file with given  
inode
number is already opened so some data can be shared between the two  
instances.
