From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Read /dev/kmem failed
Date: Wed, 22 Mar 2006 16:04:18 +0000
Message-ID: <17441.30082.233664.689666@cerise.gclements.plus.com>
References: <6ff3e7140603211729s7c64b1f4n@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6ff3e7140603211729s7c64b1f4n@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: openbsd shen <openbsd.shen@gmail.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>


openbsd shen wrote:

> struct descriptor_idt {
>         unsigned short offset_low, seg_selector;
>         unsigned char reserved, flag;
>         unsigned short offset_high;
> };
> 
>        .......
> 
>         struct descriptor_idt *descriptor;
>        .......
> 
>         fd_kmem = open("/dev/kmem", O_RDWR);
>         ptr_idt = get_addr_idt();
>         descriptor = (struct descriptor_idt *) malloc(sizeof(struct descriptor_idt));
>         ......
>         readkmem(descriptor, ptr_idt + 8 * x, sizeof(struct descriptor_idt));
> 
>         ......
> 
> void readkmem(void *m, unsigned off, int size)
> {
>         int i;
>         if (lseek(fd_kmem, off, SEEK_SET) != off) {
>                 fprintf(stderr, "Error lseek. Are you root? \n");
>                 exit(-1);
>         }
>         if ((i = read(fd_kmem, m, size)) != size) {
>                 fprintf(stderr, "Error read kmem, only read %d bytes\n",i);
>                 perror("read");
>                 exit(-1);
>         }
> }
> 
> unsigned long get_addr_idt(void)
> {
>         unsigned char idtr[6];
>         unsigned long idt;
>         __asm__ volatile ("sidt %0":"=m" (idtr));
>         idt = *((unsigned long *) &idtr[2]);
>         return (idt);
> }
> ----------------------------------------------------------------------
> When run it, the output is:
> 
> Error read kmem, only read 0 bytes
> read: Success
> 
> 
> I don't know why read error?

A return value of 0 from read indicates that you are trying to read
beyond the end of the file.

In this case, it's because you are interpreting the IDT address in the
wrong address space. ptr_idt will be in the process' virtual address
space; on x86, it will be above the 3Gb mark, and your /dev/kmem
probably isn't that large (even if it was, you would be reading the
wrong data).

If you can translate it to a physical address, you can use that as an
offset into /dev/mem, but I have no idea how to perform that
translation from user-space.

-- 
Glynn Clements <glynn@gclements.plus.com>
