From: "RMD" <rmd@altec.com.ar>
Subject: boot freezes
Date: Thu, 27 Jun 2002 14:47:50 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <002901c21e02$c1bca9d0$580a020a@rmdlaptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Hi all.
I have an odd behaviour on a linux system to be used in an embedded sys=
tem
(no vga, 4 serials)
The problem is:
booting on a standard pc, using syslinux as the loader, with syslinux.c=
fg as
follows:

    serial 0 38400
    default linux
    prompt 0
    label linux
        kernel=3Dvmlinuz
        append console=3DttyS0,38400n8 console=3Dtty0 root=3D/dev/hdc2 =
rw

it starts ok, I can read all kernel messages on the attached terminal,
ending with:

    Freeing unused kernel memory: 176k freed
    serial console detected.  Disabling virtual terminals

and then runs Busybox v0.6.2 as init.
the rcS file in /etc/init.d initializes an LCD display, and /etc/initta=
b
runs an application that writes on that display.
the inittab file is as this:

    ::sysinit:/etc/init.d/rcS
    ::once:myapplication

All works fine on a PC
But when I try this disk (it=B4s really a flashcard) on a SBC (x86 too)=
 system
(no vga), and attaching a terminal to ttyS0, I can see it loads the ker=
nel,
with all of it=B4s hardware and initializing messages, and the last mes=
sage
is:

    Freeing unused kernel memory: 176k freed

and the system freezes forever and ever...
What else can I do to solve this issue? I=B4m using a 2.4.2 kernel, com=
piled
with support for serial consoles, (it works ok on a pc...)
May be something related to /dev/console??

Thanx very much






Ricardo Derbes
Altec SE
Albarrac=EDn 157 - San Carlos de Bariloche
+54-2944-426892
rmd@altec.com.ar

Ricardo Derbes
Altec SE
Albarrac=EDn 157 - San Carlos de Bariloche
+54-2944-426892
rmd@altec.com.ar

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
