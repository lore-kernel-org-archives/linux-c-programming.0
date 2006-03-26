From: Mikado <mikado4vn@gmail.com>
Subject: Re: Virtual Serial Port
Date: Mon, 27 Mar 2006 00:09:51 +0700
Message-ID: <4426CADF.2050902@gmail.com>
References: <442582B8.8040403@gmail.com> <Pine.LNX.4.61.0603251945100.29793@yvahk01.tjqt.qr> <4425FB22.7040405@gmail.com> <Pine.LNX.4.61.0603261127580.22145@yvahk01.tjqt.qr>
Reply-To: mikado4vn@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932094AbWCZRFj@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0603261127580.22145@yvahk01.tjqt.qr>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@linux01.gwdg.de>, Glynn Clements <glynn@gclements.plus.com>
Cc: linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

>   guest writes to /dev/ttyS0
>   vmware connects its virtual S0 to the host's ttyFakeS0
>   minicom on the host to ttyFakeS0
> or even
>   vmware S0 to host's ttyS0
>   other remote machine do minicom to ttyS0
> 
> The reason for FakeS0 is that vmware does not know about ptys, 
> unfortunately.

Yes, VMWare doesn't support serial port using host's ttys any more. My
idea is:

[host - application] <- read/write -> [virtual serial port
/dev/ttyFakeS0] <- read/write over virtual null-modem serial cable ->
[host - real serial port /dev/ttyS0] <- read/write -> [VMWare - application]

But today I've just bought an USB-to-Serial converter and made for
myself a null-modem serial cable. I use this null-modem cable to connect
/dev/ttyS0 (native serial port) to /dev/tts/USB0 (USB-based serial
port). My VMWare now can use one of those devices and the host use
another one. Now above figure can be re-drawn like this:

[host - application] <- read/write -> [/dev/tts/USB0] <- read/write over
physical null-modem cable -> [/dev/ttyS0] <- read/write -> [VMWare -
application]

Anyway, later I'll try to write a device drivers act as virtual serial
ports and virtual null-modem cables.

Best regards,
Mikado.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFEJsrfNWc9T2Wr2JcRAl05AJ9Ee8zqagf0yjDk71mFAxwSskFltQCg0aM8
mELZ8uxHPaSYzLiZLM7Cxy4=
=zI/+
-----END PGP SIGNATURE-----
