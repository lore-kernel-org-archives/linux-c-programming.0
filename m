From: Nat Ersoz <nat.ersoz@myrio.com>
Subject: Re: inb outb in C ...
Date: Tue, 10 Jun 2003 14:07:15 -0700
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3EE64883.9090509@myrio.com>
References: <20030605152609.43655.qmail@web21507.mail.yahoo.com>
Reply-To: nat.ersoz@myrio.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030605152609.43655.qmail@web21507.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Maharajan Veerabag <maha_prog@yahoo.com>
Cc: linux-c-programming@vger.kernel.org

See chapter 16 of "PCI System Architecture" Mindshare, Inc.

For x86 and PowerPC, configuration utilizes 2 32 bit I/O ports located 
at 0x0cf8 (address config) and 0x0cfc (data config):

To access a PCI function's config port:

1. Write the target bus number, physical device number, function number, 
... to the configuration address port (0x0cf8).
2. Read or Write the I/O port data (0x0cfc)

Make note that these I/O ports are 32 bits wide (really groups of 4 bit 
ports, organized as little endian).

Anyway, I don't feel like typing the book's chapter, nor would Mindshare 
appreciated it.  You could use the 0x0cf8 as an aid to searching the web...

Also, you can get ALSA driver code from the national developer's site 
(http://wwwd.national.com/national/developer.nsf/home/welcome.htm) which 
is an example of PCI configuration without calling the linux PCI config 
functions (and it is ugly).

Also, take a look at the following kernel files:

linux/include/asm-x86_64/pci-direct.h
./arch/x86_64/kernel/pci-pc.c
./arch/i386/kernel/pci-pc.c

Among others...

Nat

Maharajan Veerabag wrote:

>Hi all,
> i am in the process of writing a linux device driver
>in C. is it possible to access the pci local I/O
>address space with inb,outb  instructions... directly
>or is any request of space is required. What is the
>exact power of the inb family of instructions.. 
>   can somebody explain this. 
>thank you.
>
>regards,
>Maharajan Veerabag.
>
>__________________________________
>Do you Yahoo!?
>Yahoo! Calendar - Free online calendar with sync to Outlook(TM).
>http://calendar.yahoo.com
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  
>

-- 
_________________________________________
Nat Ersoz             nat.ersoz@myrio.com  -o) 
Myrio Corporation     Phone: 425.897.7278  /\\
3500 Carillon Point   Cell:  425.417.5182 _\_V
Kirkland, WA 98033    Fax:   425.897.5600



