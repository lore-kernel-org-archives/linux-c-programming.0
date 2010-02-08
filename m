From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: How to use CRC32 of SSE 4.2 on i3/5/7?
Date: Mon, 8 Feb 2010 11:41:04 +0000 (GMT)
Message-ID: <alpine.LRH.2.00.1002081130110.11287@praktifix.dwd.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hello

In my application I use a lot of crc32 checksum calculation in a little
C function. I now have access to a system with an i7 which does have
crc32 as an instruction. How can I make use of this instruction in
my program? Most likely one can do this directly via assembler code, but
is there support for this via libc?

Can someone please show me how I could use hardware accelerated crc32
checksum calculation in my code?

Thanks,
Holger
