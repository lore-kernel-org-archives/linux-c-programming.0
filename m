From: linux err <linux_err@yahoo.com>
Subject: Re: Core file size?
Date: Fri, 1 Dec 2006 07:46:02 -0800 (PST)
Message-ID: <149400.32583.qm@web56501.mail.re3.yahoo.com>
References: <17775.22303.407587.991319@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17775.22303.407587.991319@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


This patch fixed it.

http://lkml.org/lkml/2005/6/13/204

The ELF core dump code has one use of off_t when
writing out segments.  Some of the segments may be
passed the 2GB limit of an off_t, even on a 32-bit
system, so it's important to use loff_t instead.  This
fixes a corrupted core dump in the bigcore test in
GDB's testsuite.

Signed-off-by: Daniel Jacobowitz
<dan@codesourcery.com>

Index: linux-2.6.11/fs/binfmt_elf.c
===================================================================
--- linux-2.6.11.orig/fs/binfmt_elf.c	2005-06-09
16:38:17.000000000 -0400
+++ linux-2.6.11/fs/binfmt_elf.c	2005-06-10
00:10:52.000000000 -0400
@@ -1125,7 +1125,7 @@ static int dump_write(struct
file *file,
 	return file->f_op->write(file, addr, nr,
&file->f_pos) == nr;
 }
 
-static int dump_seek(struct file *file, off_t off)
+static int dump_seek(struct file *file, loff_t off)
 {
 	if (file->f_op->llseek) {
 		if (file->f_op->llseek(file, off, 0) != off)






--- Glynn Clements <glynn@gclements.plus.com> wrote:

> 
> linux err wrote:
> 
> > 
> > Does anyone know what determines the size of a
> core
> > dump? I have a process running out of memory (it
> > allocates about 3GB) - but the size of core varies
> > (between 2-3GB) depending on how much the process
> > wrote on the allocated memory.
> > 
> > Also, the time it takes to write the core (same
> size)
> > varies??
> > 
> > I briefly looked at elf_core_dump and
> get_user_pages()
> > in binfmt_elf.c. Is there any documentation on
> this?
> > Or anyone knows how it works?
> 
> The relevant function seems to be maydump() (in
> binfmt_elf.c); this
> determines whether or not a given VM area should be
> dumped.
> 
> Essentially, it doesn't dump data which can be
> obtained elsewhere,
> e.g. from an executable, shared library, unmodified
> mmap()d file, etc.
> 
> Primarily, this prevents dumping the .text and
> .rodata segments of the
> executable and shared libraries, which will often
> account for most of
> a process' address space.
> 
> -- 
> Glynn Clements <glynn@gclements.plus.com>
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> 



 
____________________________________________________________________________________
Do you Yahoo!?
Everyone is raving about the all-new Yahoo! Mail beta.
http://new.mail.yahoo.com
