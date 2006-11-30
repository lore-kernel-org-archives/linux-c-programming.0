From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Core file size?
Date: Thu, 30 Nov 2006 22:11:43 +0000
Message-ID: <17775.22303.407587.991319@cerise.gclements.plus.com>
References: <526654.3564.qm@web56508.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <526654.3564.qm@web56508.mail.re3.yahoo.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux err <linux_err@yahoo.com>
Cc: linux-c-programming@vger.kernel.org


linux err wrote:

> 
> Does anyone know what determines the size of a core
> dump? I have a process running out of memory (it
> allocates about 3GB) - but the size of core varies
> (between 2-3GB) depending on how much the process
> wrote on the allocated memory.
> 
> Also, the time it takes to write the core (same size)
> varies??
> 
> I briefly looked at elf_core_dump and get_user_pages()
> in binfmt_elf.c. Is there any documentation on this?
> Or anyone knows how it works?

The relevant function seems to be maydump() (in binfmt_elf.c); this
determines whether or not a given VM area should be dumped.

Essentially, it doesn't dump data which can be obtained elsewhere,
e.g. from an executable, shared library, unmodified mmap()d file, etc.

Primarily, this prevents dumping the .text and .rodata segments of the
executable and shared libraries, which will often account for most of
a process' address space.

-- 
Glynn Clements <glynn@gclements.plus.com>
