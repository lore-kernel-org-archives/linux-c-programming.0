From: =?iso-8859-1?Q?rgomez=40bancomer=2Ecom?= <rgomez@bancomer.com>
Subject: =?iso-8859-1?Q?undefined=20reference=20to=20=60=5Ffxstat=27?=
Date: Fri, 26 Sep 2003 10:43:34 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F69538E00004185@mail-bcm01.alestra.net.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?iso-8859-1?Q?linux=2Dc=2Dprogramming?= <linux-c-programming@vger.kernel.org>

I'm having some problems compiling wterm.

When I make ./configure it's seems to be all ok but in the make steep I
get this:

gcc -o wterm command.o graphics.o grkelot.o main.o menubar.o misc.o netdisp.o
rmemset.o screen.o scrollbar2.o utmp.o xdefaults.o xpm.o -L/usr/X11R6/lib
 -lSM -lICE -L/usr/X11R6/lib -lXpm -lX11 -lWMaker -lutil
/usr/X11R6/lib/libXpm.so: undefined reference to `_fxstat'
collect2: ld returned 1 exit status

I'm sure I have libXpm:
[pedsgrr2@edsrgr00 wterm-6.2.9]$ ll /usr/X11R6/lib/libXpm.so 
-rwxr-xr-x 1 root root 81K sep 17 16:05 /usr/X11R6/lib/libXpm.so*

[pedsgrr2@edsrgr00 pedsgrr2]$ nm /usr/X11R6/lib/libXpm.so | grep _fxstat
         U _fxstat





