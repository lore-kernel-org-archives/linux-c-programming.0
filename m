From: Kurt Kehler <kmk@pa.net>
Subject: Re: Segmentation fault
Date: Tue, 16 Apr 2002 15:29:46 -0400 (EDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.10.10204160238150.587-100000@darkstar.example.net>
References: <1328439575.20020411104849@kgpa.ru>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1328439575.20020411104849@kgpa.ru>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Oleg,

I'm adding this back in to the list.

On Thu, 11 Apr 2002, Oleg O. Ossovitskii wrote:

> Which hardware do You use? Which system do You use (kernel, glibc)?
> Does Your computer has FPU ? Try specify switch to gcc, that talk
> them use FPU emulate library. Unfortunately I don't remember which
> switch You should use.
> 
> I try use another compiler.
> 
> P.S. sorry for my poor english

My hardware is a 200mhz Pentium MMX running Slackware 4.0 with kernel
2.2.6.  dmesg reports "Intel Pentium with F0 0F bug - workaround
enabled."  I'm not sure that is relevant.  I tried several gcc
switches (-mno-486, -mno-fp-ret-in-387, -msoft-float) which didn't
work.  When I added the -O2 switch to gcc and ran a.out under gdb
I got:

Program received signal SIGSEGV, Segmentation fault.
0x40060607 in ldiv () from /lib/libc.so.5

What did work was booting Slackware 7.1 which uses egcs-2.91.66.
So there must be a problem with Slackware 4.0's libc5?  I realize
it is time to switch to more recent software.

Thanks Oleg,
Kurt Kehler

