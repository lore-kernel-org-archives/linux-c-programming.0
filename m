From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: User mode linux- kernel module
Date: Mon, 19 Jul 2010 09:12:40 +0530
Message-ID: <AANLkTimqzZDJ4iYtar-1qBTrhIjg8m6KOwcUY0Eftw6L@mail.gmail.com>
References: <AANLkTin-xKyGFy9pFAtXs-PTJYWLvQ66zdHA7Wvv8bSq@mail.gmail.com>
	<AANLkTinu9kIwkPmdiXN5VI1ENaj97JZTelMkt2NxFCTl@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-newbie-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=SKjhFz5CHqaxmrcBMmiYwTCs8A1Pz458Ceq1SA5B22Y=;
        b=NTloA4eNK5u++CoO0bfix0mGAIBxSB182kakPSxO1IadGl/nCtkgdNJi5H8ukfmYDM
         SQ2ZhHP8if1HNlo6f9tL+epEo8LtEzzMb0NNfPLEK6eqdvU09IRDvLUZRJJ0vgQNGIQU
         ZK2zTk4nx8ynBPZL2jc+F7UxmeSAiyEfvyCEc=
In-Reply-To: <AANLkTinu9kIwkPmdiXN5VI1ENaj97JZTelMkt2NxFCTl@mail.gmail.com>
Sender: linux-newbie-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: linux-c-programming@vger.kernel.org, linux-newbie@vger.kernel.org

Below command works fine .

 make -C /home/fox/workspace3/linux-2.6.32/ M=3D`pwd` modules ARCH=3Dum
SUBARCH=3Di386



On Sun, Jul 18, 2010 at 9:24 PM, ratheesh k <ratheesh.ksz@gmail.com> wr=
ote:
> root@dasaradham-laptop:/home/fox/workspace#
> root@dasaradham-laptop:/home/fox/workspace# make =A0-C
> /home/fox/workspace3/linux-2.6.32/ M=3D`pwd` modules ARCH=3Dum
> make: Entering directory `/home/fox/workspace3/linux-2.6.32'
> =A0CC [M] =A0/home/fox/workspace/hello.o
> In file included from
> /home/fox/workspace3/linux-2.6.32/arch/um/include/asm/ptrace-generic.=
h:13,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/ptrace.h:14,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/include/asm/processor-gener=
ic.h:13,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/processor.h:=
54,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/prefetch.h:14,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/list.h:6,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/module.h:9,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/fox/workspace/hello.c:2:
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/shared/sysdep/pt=
race.h:43:1:
> warning: "HOST_DS" redefined
> In file included from
> /home/fox/workspace3/linux-2.6.32/arch/um/include/shared/skas_ptregs.=
h:4,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/shared/sysdep/pt=
race.h:17,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/include/asm/ptrace-generic.=
h:13,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/ptrace.h:14,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/include/asm/processor-gener=
ic.h:13,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/processor.h:=
54,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/prefetch.h:14,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/list.h:6,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/module.h:9,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/fox/workspace/hello.c:2:
> /home/fox/workspace3/linux-2.6.32/arch/um/include/shared/user_constan=
ts.h:25:1:
> warning: this is the location of the previous definition
> In file included from
> /home/fox/workspace3/linux-2.6.32/arch/um/include/asm/ptrace-generic.=
h:13,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/ptrace.h:14,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/include/asm/processor-gener=
ic.h:13,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/processor.h:=
54,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/prefetch.h:14,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/list.h:6,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/module.h:9,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/fox/workspace/hello.c:2:
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/shared/sysdep/pt=
race.h:44:1:
> warning: "HOST_ES" redefined
> In file included from
> /home/fox/workspace3/linux-2.6.32/arch/um/include/shared/skas_ptregs.=
h:4,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/shared/sysdep/pt=
race.h:17,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/include/asm/ptrace-generic.=
h:13,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/ptrace.h:14,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/include/asm/processor-gener=
ic.h:13,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/processor.h:=
54,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/prefetch.h:14,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/list.h:6,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/module.h:9,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/fox/workspace/hello.c:2:
> /home/fox/workspace3/linux-2.6.32/arch/um/include/shared/user_constan=
ts.h:27:1:
> warning: this is the location of the previous definition
> In file included from
> /home/fox/workspace3/linux-2.6.32/arch/um/include/asm/ptrace-generic.=
h:13,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/ptrace.h:14,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/include/asm/processor-gener=
ic.h:13,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/processor.h:=
54,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/prefetch.h:14,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/list.h:6,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/module.h:9,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/fox/workspace/hello.c:2:
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/shared/sysdep/pt=
race.h:45:1:
> warning: "HOST_FS" redefined
> In file included from
> /home/fox/workspace3/linux-2.6.32/arch/um/include/shared/skas_ptregs.=
h:4,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/shared/sysdep/pt=
race.h:17,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/include/asm/ptrace-generic.=
h:13,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/ptrace.h:14,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/include/asm/processor-gener=
ic.h:13,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/processor.h:=
54,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/prefetch.h:14,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/list.h:6,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/module.h:9,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/fox/workspace/hello.c:2:
> /home/fox/workspace3/linux-2.6.32/arch/um/include/shared/user_constan=
ts.h:26:1:
> warning: this is the location of the previous definition
> In file included from
> /home/fox/workspace3/linux-2.6.32/arch/um/include/asm/ptrace-generic.=
h:13,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/ptrace.h:14,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/include/asm/processor-gener=
ic.h:13,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/processor.h:=
54,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/prefetch.h:14,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/list.h:6,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/module.h:9,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/fox/workspace/hello.c:2:
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/shared/sysdep/pt=
race.h:46:1:
> warning: "HOST_GS" redefined
> In file included from
> /home/fox/workspace3/linux-2.6.32/arch/um/include/shared/skas_ptregs.=
h:4,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/shared/sysdep/pt=
race.h:17,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/include/asm/ptrace-generic.=
h:13,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/ptrace.h:14,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/include/asm/processor-gener=
ic.h:13,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from
> /home/fox/workspace3/linux-2.6.32/arch/um/sys-x86_64/asm/processor.h:=
54,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/prefetch.h:14,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/list.h:6,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/module.h:9,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/fox/workspace/hello.c:2:
> /home/fox/workspace3/linux-2.6.32/arch/um/include/shared/user_constan=
ts.h:28:1:
> warning: this is the location of the previous definition
> In file included from include/linux/bitmap.h:8,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/nodemask.h:95,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/mmzone.h:16,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/gfp.h:4,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/kmod.h:22,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/module.h:13,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/fox/workspace/hello.c:2:
> include/linux/string.h:101: warning: conflicting types for built-in
> function =91__builtin_memcmp=92
> In file included from include/net/sock.h:60,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from include/linux/tcp.h:177,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from /home/fox/workspace/hello.c:9:
> include/net/dst.h: In function =91dst_hold=92:
> include/net/dst.h:157: error: negative width in bit-field =91<anonymo=
us>=92
> make[1]: *** [/home/fox/workspace/hello.o] Error 1
> make: *** [_module_/home/fox/workspace] Error 2
> make: Leaving directory `/home/fox/workspace3/linux-2.6.32'
> root@dasaradham-laptop:/home/fox/workspace#
>
>
>
>
>
> On Sat, Jul 17, 2010 at 10:13 PM, ratheesh k <ratheesh.ksz@gmail.com>=
 wrote:
>> Hi ,
>>
>> =A0i have ubuntu linux =A0on my 64 bit machine . I have successully =
built
>> and =A0up an instance of UML =A0which is 32 bit . I am able to estab=
lish
>> networking also .
>>m
>> =A0I would like to build a simple hello world kernel module on host =
64
>> bit machine , which should be loaded in UML . How do i build the sam=
e
>> ?
>>
>> Thanks,
>> Ratheesh
>>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-newbie"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at http://www.linux-learn.org/faqs
