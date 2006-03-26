From: Mikado <mikado4vn@gmail.com>
Subject: Re: Read /dev/kmem failed
Date: Mon, 27 Mar 2006 00:32:37 +0700
Message-ID: <4426D035.8050608@gmail.com>
References: <6ff3e7140603211729s7c64b1f4n@mail.gmail.com>
Reply-To: mikado4vn@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6ff3e7140603211729s7c64b1f4n@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: openbsd shen <openbsd.shen@gmail.com>
Cc: linux-c-programming@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

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
>         descriptor = (struct descriptor_idt *) malloc(sizeof(struct
> descriptor_idt));
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

finding sys_call_table, system calls' addresses and patching kernel
on-the-fly, isn't it?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFEJtA1NWc9T2Wr2JcRAt+/AJwMnoR9grdus8ajTjjIJhuNfc8BOQCZAQhI
ESRe1fcd/1tEVD3PRakjkgs=
=H7ni
-----END PGP SIGNATURE-----
