From: Francis Lau <fkwlau@utcc.utoronto.ca>
Subject: Re: quotactl
Date: Thu, 3 Jul 2003 12:24:09 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0307031212050.11040-100000@gpu.utcc>
References: <16131.21093.151750.179494@cerise.nosuchdomain.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <16131.21093.151750.179494@cerise.nosuchdomain.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Glynn Clements <glynn.clements@virgin.net>
Cc: linux-c-programming@vger.kernel.org, =?ISO-8859-1?Q?Dar=EDo_Mariani?= <dmarian@fi.uba.ar>


>=20
> Dar=EDo Mariani wrote:
>=20
> >    If you did not recompile the kernel, it has quota support. Has t=
he FS=20
> > you are quering been mounted with the usrquota option?
>=20
> The mount(8) manpage says (in regard of ext2):
>=20
>        grpquota / noquota / quota / usrquota
>               These options are accepted but ignored.
>=20
> Examination of the kernel source code (fs/ext2/super.c) confirms this=
:
>=20
> 		/* Silently ignore the quota options */
> 		else if (!strcmp (this_char, "grpquota")
> 		         || !strcmp (this_char, "noquota")
> 		         || !strcmp (this_char, "quota")
> 		         || !strcmp (this_char, "usrquota"))
> 			/* Don't do anything ;-) */ ;
>=20
> Also, if quota support is disabled (i.e. "!defined(CONFIG_QUOTA)"),
> quotactl() will fail with ENOSYS rather than EINVAL (at least in
> 2.4.x).
>=20
>=20
I have tried everything you guys suggested but am still unable to get=20
quotactl to work.  For some reason, quotactl always returns a 0.  I hav=
e=20
traced through fs/quota.c and I think the code always gets to the 'retu=
rn 0' part=20
in the do_quotactl function:

case Q_GETQUOTA: {
             struct if_dqblk idq;

            if ((ret =3D sb->s_qcop->get_dqblk(sb, type, id, &idq)))
                      return ret;
            if (copy_to_user(addr, &idq, sizeof(idq)))
                      return -EFAULT;
            return 0;
}

-----------------------------------
This is the kernel I am using:

[root@setup5 fs]# uname -a
Linux setup5 2.4.20-18.9smp #1 SMP Thu May 29 06:55:05 EDT 2003 i686 i6=
86=20
i386 GNU/Linux

----------------------------------
This is the test code I am using:

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <linux/quota.h>

main ()
{
	int i, cmd;
	struct mem_dqblk mydq;

	cmd =3D QCMD(Q_GETQUOTA,USRQUOTA);
	i=3Dquotactl (cmd, "/dev/md5", 70557, &mydq);

	printf ("curspace is %i\n", mydq.dqb_curspace);
}

----------------------------------
I made sure that CONFIG_QUOTA=3Dy too.

[root@setup5 configs]# pwd
/usr/src/linux-2.4/configs
[root@setup5 configs]# grep CONFIG_QUOTA *
kernel-2.4.20-athlon.config:CONFIG_QUOTA=3Dy
kernel-2.4.20-athlon-smp.config:CONFIG_QUOTA=3Dy
kernel-2.4.20-i386-BOOT.config:# CONFIG_QUOTA is not set
kernel-2.4.20-i386-BOOT.config:# CONFIG_QUOTA is not set
kernel-2.4.20-i386.config:CONFIG_QUOTA=3Dy
kernel-2.4.20-i386-smp.config:CONFIG_QUOTA=3Dy
kernel-2.4.20-i586.config:CONFIG_QUOTA=3Dy
kernel-2.4.20-i586-smp.config:CONFIG_QUOTA=3Dy
kernel-2.4.20-i686-bigmem.config:CONFIG_QUOTA=3Dy
kernel-2.4.20-i686.config:CONFIG_QUOTA=3Dy
kernel-2.4.20-i686-smp.config:CONFIG_QUOTA=3Dy
kernel-2.4.20-x86_64.config:CONFIG_QUOTA=3Dy
kernel-2.4.20-x86_64-smp.config:CONFIG_QUOTA=3Dy

---------------------------------
I ran a strace on the binary and this is what I got:

[root@setup5 C]# strace -f ./test
execve("./test", ["./test"], [/* 21 vars */]) =3D 0
uname({sys=3D"Linux", node=3D"setup5", ...}) =3D 0
brk(0)                                  =3D 0x8049628
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -=
1,=20
0) =3D 0x40016000
open("/etc/ld.so.preload", O_RDONLY)    =3D -1 ENOENT (No such file or=20
directory)
open("/etc/ld.so.cache", O_RDONLY)      =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D59724, ...}) =3D 0
old_mmap(NULL, 59724, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x40017000
close(3)                                =3D 0
open("/lib/tls/libc.so.6", O_RDONLY)    =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0`V\1B4\0"..., 5=
12)
=3D 512
fstat64(3, {st_mode=3DS_IFREG|0755, st_size=3D1531064, ...}) =3D 0
old_mmap(0x42000000, 1257224, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) =3D=
=20
0x42000000
old_mmap(0x4212e000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED=
,=20
3, 0x12e000) =3D 0x4212e000
old_mmap(0x42131000, 7944, PROT_READ|PROT_WRITE,=20
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0x42131000
close(3)                                =3D 0
set_thread_area({entry_number:-1 -> 6, base_addr:0x400169e0,=20
limit:1048575, seg_32bit:1, contents:0, read_exec_only:0,=20
limit_in_pages:1, seg_not_present:0, useable:1}) =3D 0
munmap(0x40017000, 59724)               =3D 0
quotactl(0xd00 /* Q_??? */|USRQUOTA, "/dev/md5", 70557, {3221224176,=20
1073790467, 1073830868, 1073832832, 1, 0, 1107383425, 134513434}) =3D -=
1=20
EINVAL (Invalid argument)
fstat64(1, {st_mode=3DS_IFCHR|0620, st_rdev=3Dmakedev(136, 3), ...}) =3D=
 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, =
0)=20
=3D 0x40017000
write(1, "cmd is 851968\n", 14cmd is 851968
)         =3D 14
write(1, "i is -1\n", 8i is -1
)                =3D 8
write(1, "errno is 22\n", 12errno is 22
)           =3D 12
write(1, "curspace is 0\n", 14curspace is 0
)         =3D 14
munmap(0x40017000, 4096)                =3D 0
exit_group(14)



Thanks again.  I really appreciate it.

=46rancis

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
