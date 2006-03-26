From: Petr Vandrovec <vandrove@vc.cvut.cz>
Subject: Re: Virtual Serial Port
Date: Sun, 26 Mar 2006 20:52:51 +0200
Message-ID: <4426E303.9000701@vc.cvut.cz>
References: <442582B8.8040403@gmail.com> <Pine.LNX.4.61.0603251945100.29793@yvahk01.tjqt.qr> <4425FB22.7040405@gmail.com> <Pine.LNX.4.61.0603261127580.22145@yvahk01.tjqt.qr> <4426CADF.2050902@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4426CADF.2050902@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: mikado4vn@gmail.com
Cc: Jan Engelhardt <jengelh@linux01.gwdg.de>, Glynn Clements <glynn@gclements.plus.com>, linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org

Mikado wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> 
>>  guest writes to /dev/ttyS0
>>  vmware connects its virtual S0 to the host's ttyFakeS0
>>  minicom on the host to ttyFakeS0
>>or even
>>  vmware S0 to host's ttyS0
>>  other remote machine do minicom to ttyS0
>>
>>The reason for FakeS0 is that vmware does not know about ptys, 
>>unfortunately.
> 
> 
> Yes, VMWare doesn't support serial port using host's ttys any more. My
> idea is:
> 
> [host - application] <- read/write -> [virtual serial port
> /dev/ttyFakeS0] <- read/write over virtual null-modem serial cable ->
> [host - real serial port /dev/ttyS0] <- read/write -> [VMWare - application]

Although it is quite irrelevant to LKML (you may want to visit 
www.vmware.com/community/index.jspa and ask there...), you can connect guest's 
serial port also to Unix socket - and in such situation you need virtual serial 
port driver only if 'host - application' does not know how to use /dev/tty* (for 
unix socket <-> /dev/ptyp* app look at 
http://platan.vc.cvut.cz/ftp/pub/vmware/serpipe.tar.gz).
								Petr

