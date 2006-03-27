From: Mikado <mikado4vn@gmail.com>
Subject: Re: Virtual Serial Port
Date: Mon, 27 Mar 2006 10:29:48 +0700
Message-ID: <44275C2C.9010507@gmail.com>
References: <442582B8.8040403@gmail.com> <Pine.LNX.4.61.0603251945100.29793@yvahk01.tjqt.qr> <4425FB22.7040405@gmail.com> <Pine.LNX.4.61.0603261127580.22145@yvahk01.tjqt.qr> <4426CADF.2050902@gmail.com> <4426E303.9000701@vc.cvut.cz>
Reply-To: mikado4vn@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751551AbWC0DZb@vger.kernel.org>
In-Reply-To: <4426E303.9000701@vc.cvut.cz>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Petr Vandrovec <vandrove@vc.cvut.cz>
Cc: Jan Engelhardt <jengelh@linux01.gwdg.de>, Glynn Clements <glynn@gclements.plus.com>, linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Petr Vandrovec wrote:
> Although it is quite irrelevant to LKML (you may want to visit
> www.vmware.com/community/index.jspa and ask there...), you can connect
> guest's serial port also to Unix socket - and in such situation you need
> virtual serial port driver only if 'host - application' does not know
> how to use /dev/tty* (for unix socket <-> /dev/ptyp* app look at
> http://platan.vc.cvut.cz/ftp/pub/vmware/serpipe.tar.gz).
>                                 Petr


Thank Petr. It also works well. That program acts as a data proxy
between unix socket and /dev/ptyp*. Yesterday I wrote a similar program
that read/write vmware's server unix sock then forward/backward data
to/from /dev/ptyp0 but it didn't work. Maybe my program has problem.
Thanks again.

Mikado
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFEJ1wsNWc9T2Wr2JcRArmmAJ483BmLFrY+aIR71u/BQH+XCs8tIQCfZGs1
uTwfbeYTsFg0Iq9/FL/82I4=
=dgch
-----END PGP SIGNATURE-----
