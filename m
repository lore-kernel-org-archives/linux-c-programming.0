From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Dynamic linking library
Date: Fri, 21 Jan 2011 01:17:01 +0000
Message-ID: <19768.56973.483737.705910@cerise.gclements.plus.com>
References: <AANLkTinrAZgHcpjbdYt53y+wqK4F9OBUH8PtMyxvwXEO@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <AANLkTinrAZgHcpjbdYt53y+wqK4F9OBUH8PtMyxvwXEO@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: linux-c-programming@vger.kernel.org


ratheesh k wrote:

> Suppose there are two executable elf . say A, B . And these two are
> using  libctest.so.
> When A is executed  libctest.so is loaded into RAM

No, it is *mapped* into the process' address space (virtual memory). 
Data is loaded into physical RAM on demand by the kernel.

> and linear address is correctly mapped.
> 
> If we execute program B after A ,  will library will be loaded again ?

It will be mapped into B's address space.

> else, how OS know that libctest is already loaded into physical page ?
> (so it can  map linear address to it )

Mapping a file into a process' address space sets up structures within
the kernel recording the fact that specific pages of the process'
address space correspond to specific blocks of a specific device.

Initially, the MMU will consider those pages as unmapped, so accessing
those addresses will cause the CPU to generate an exception (page
fault). The kernel handles the exception by ensuring that the
appropriate disk block is loaded into physical RAM, updating the MMU
so that the virtual memory page is mapped to the appropriate physical
memory page, then restarting the instruction.

When cached blocks are discarded from physical RAM, any the MMU
mappings are removed so that a subsequent access will raise an
exception.

-- 
Glynn Clements <glynn@gclements.plus.com>
