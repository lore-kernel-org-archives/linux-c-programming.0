From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: User mode linux- kernel module
Date: Sun, 18 Jul 2010 21:24:21 +0530
Message-ID: <AANLkTinu9kIwkPmdiXN5VI1ENaj97JZTelMkt2NxFCTl@mail.gmail.com>
References: <AANLkTin-xKyGFy9pFAtXs-PTJYWLvQ66zdHA7Wvv8bSq@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-newbie-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=fiPW2AZRtGcxbECrBHKbm1WXEPSWzOWCYk+R1mnqgzg=;
        b=ZCFRcgf9PffgILFaN8DfZxvPCcjAO0FS2FV9/YsuivUsIj7Fu+38I5U31fVkKMy9LG
         enKc8vd0xG8+/SsI890hJ4GGrX+5z33jVQpfNVX0f/kjU4L5ihAp4gzDZibPOcOsXN3E
         QRv5FYga5/aZ9h4+HQsRbAy5aQ9LAoRWvR4uk=
In-Reply-To: <AANLkTin-xKyGFy9pFAtXs-PTJYWLvQ66zdHA7Wvv8bSq@mail.gmail.com>
Sender: linux-newbie-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: linux-c-programming@vger.kernel.org, linux-newbie@vger.kernel.org

root@dasaradham-laptop:/home/fox/workspace#
root@dasaradham-laptop:/home/fox/workspace# make  -C
/home/fox/workspace3/linux-2.6.32/ M=3D`pwd` modules ARCH=3Dum
make: Entering directory `/home/fox/workspace3/linux-2.6.32'
  CC [M]  /home/fox/workspace/hello.o
In file included from
/home/fox/workspace3/linux-2.6.32/arch/um/include/asm/ptrace-generic.h:=
13,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/ptrace.h:14,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/include/asm/processor-generic=
=2Eh:13,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/processor.h:54=
,
                 from include/linux/prefetch.h:14,
                 from include/linux/list.h:6,
                 from include/linux/module.h:9,
                 from /home/fox/workspace/hello.c:2:
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/shared/sysdep/ptra=
ce.h:43:1:
warning: "HOST_DS" redefined
In file included from
/home/fox/workspace3/linux-2.6.32/arch/um/include/shared/skas_ptregs.h:=
4,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/shared/sysdep/ptra=
ce.h:17,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/include/asm/ptrace-generic.h:=
13,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/ptrace.h:14,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/include/asm/processor-generic=
=2Eh:13,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/processor.h:54=
,
                 from include/linux/prefetch.h:14,
                 from include/linux/list.h:6,
                 from include/linux/module.h:9,
                 from /home/fox/workspace/hello.c:2:
/home/fox/workspace3/linux-2.6.32/arch/um/include/shared/user_constants=
=2Eh:25:1:
warning: this is the location of the previous definition
In file included from
/home/fox/workspace3/linux-2.6.32/arch/um/include/asm/ptrace-generic.h:=
13,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/ptrace.h:14,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/include/asm/processor-generic=
=2Eh:13,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/processor.h:54=
,
                 from include/linux/prefetch.h:14,
                 from include/linux/list.h:6,
                 from include/linux/module.h:9,
                 from /home/fox/workspace/hello.c:2:
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/shared/sysdep/ptra=
ce.h:44:1:
warning: "HOST_ES" redefined
In file included from
/home/fox/workspace3/linux-2.6.32/arch/um/include/shared/skas_ptregs.h:=
4,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/shared/sysdep/ptra=
ce.h:17,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/include/asm/ptrace-generic.h:=
13,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/ptrace.h:14,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/include/asm/processor-generic=
=2Eh:13,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/processor.h:54=
,
                 from include/linux/prefetch.h:14,
                 from include/linux/list.h:6,
                 from include/linux/module.h:9,
                 from /home/fox/workspace/hello.c:2:
/home/fox/workspace3/linux-2.6.32/arch/um/include/shared/user_constants=
=2Eh:27:1:
warning: this is the location of the previous definition
In file included from
/home/fox/workspace3/linux-2.6.32/arch/um/include/asm/ptrace-generic.h:=
13,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/ptrace.h:14,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/include/asm/processor-generic=
=2Eh:13,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/processor.h:54=
,
                 from include/linux/prefetch.h:14,
                 from include/linux/list.h:6,
                 from include/linux/module.h:9,
                 from /home/fox/workspace/hello.c:2:
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/shared/sysdep/ptra=
ce.h:45:1:
warning: "HOST_FS" redefined
In file included from
/home/fox/workspace3/linux-2.6.32/arch/um/include/shared/skas_ptregs.h:=
4,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/shared/sysdep/ptra=
ce.h:17,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/include/asm/ptrace-generic.h:=
13,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/ptrace.h:14,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/include/asm/processor-generic=
=2Eh:13,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/processor.h:54=
,
                 from include/linux/prefetch.h:14,
                 from include/linux/list.h:6,
                 from include/linux/module.h:9,
                 from /home/fox/workspace/hello.c:2:
/home/fox/workspace3/linux-2.6.32/arch/um/include/shared/user_constants=
=2Eh:26:1:
warning: this is the location of the previous definition
In file included from
/home/fox/workspace3/linux-2.6.32/arch/um/include/asm/ptrace-generic.h:=
13,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/ptrace.h:14,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/include/asm/processor-generic=
=2Eh:13,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/processor.h:54=
,
                 from include/linux/prefetch.h:14,
                 from include/linux/list.h:6,
                 from include/linux/module.h:9,
                 from /home/fox/workspace/hello.c:2:
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/shared/sysdep/ptra=
ce.h:46:1:
warning: "HOST_GS" redefined
In file included from
/home/fox/workspace3/linux-2.6.32/arch/um/include/shared/skas_ptregs.h:=
4,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/shared/sysdep/ptra=
ce.h:17,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/include/asm/ptrace-generic.h:=
13,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/ptrace.h:14,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/include/asm/processor-generic=
=2Eh:13,
                 from
/home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/processor.h:54=
,
                 from include/linux/prefetch.h:14,
                 from include/linux/list.h:6,
                 from include/linux/module.h:9,
                 from /home/fox/workspace/hello.c:2:
/home/fox/workspace3/linux-2.6.32/arch/um/include/shared/user_constants=
=2Eh:28:1:
warning: this is the location of the previous definition
In file included from include/linux/bitmap.h:8,
                 from include/linux/nodemask.h:95,
                 from include/linux/mmzone.h:16,
                 from include/linux/gfp.h:4,
                 from include/linux/kmod.h:22,
                 from include/linux/module.h:13,
                 from /home/fox/workspace/hello.c:2:
include/linux/string.h:101: warning: conflicting types for built-in
function =91__builtin_memcmp=92
In file included from include/net/sock.h:60,
                 from include/linux/tcp.h:177,
                 from /home/fox/workspace/hello.c:9:
include/net/dst.h: In function =91dst_hold=92:
include/net/dst.h:157: error: negative width in bit-field =91<anonymous=
>=92
make[1]: *** [/home/fox/workspace/hello.o] Error 1
make: *** [_module_/home/fox/workspace] Error 2
make: Leaving directory `/home/fox/workspace3/linux-2.6.32'
root@dasaradham-laptop:/home/fox/workspace#





On Sat, Jul 17, 2010 at 10:13 PM, ratheesh k <ratheesh.ksz@gmail.com> w=
rote:
> Hi ,
>
> =A0i have ubuntu linux =A0on my 64 bit machine . I have successully b=
uilt
> and =A0up an instance of UML =A0which is 32 bit . I am able to establ=
ish
> networking also .
>m
> =A0I would like to build a simple hello world kernel module on host 6=
4
> bit machine , which should be loaded in UML . How do i build the same
> ?
>
> Thanks,
> Ratheesh
>
--
To unsubscribe from this list: send the line "unsubscribe linux-newbie"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at http://www.linux-learn.org/faqs
