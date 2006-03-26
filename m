From: Mikado <mikado4vn@gmail.com>
Subject: Re: Virtual Serial Port
Date: Sun, 26 Mar 2006 09:23:30 +0700
Message-ID: <4425FB22.7040405@gmail.com>
References: <442582B8.8040403@gmail.com> <Pine.LNX.4.61.0603251945100.29793@yvahk01.tjqt.qr>
Reply-To: mikado4vn@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0603251945100.29793@yvahk01.tjqt.qr>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: linux-c-programming@vger.kernel.org, linux-kernel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

> You could write a device driver implementing virtual serial ports. Then you 
> just add an ioctl that connects/disconnects virtual ports to real ports if 
> desired.
> I do not quite see what this would be good for, but I am sure it's 
> good for learning or for fun. :)

Hi Jan Engelhardt,

My purpose is to provide serial interfaces for debugging. My real box
acts as remote host connecting to VMWare box by a *virtual* serial cable
so that I can set up a debugging environment.

There are several solutions for this problem but they could only run on
Windows. Eg:
- - http://www.mks.zp.ua/vspdxp.php
- - http://www.virtual-serial-port.com/virtual-serial-port-kit.html

I'll buy an USB-to-Serial cable and a Serial-Serial cable to solve this
problem but it's also interesting for me to write such device driver.
I'll try it later.

Mikado
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFEJfshNWc9T2Wr2JcRAhPwAJ9d/eifASrLPvJwOy6A4sSxgzMc0gCcChrG
rSL3gqaTWernckeKhfc+wqY=
=wIb+
-----END PGP SIGNATURE-----
