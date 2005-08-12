From: "Nanakos Chrysostomos" <nanakos@wired-net.gr>
Subject: fdisk & LBA
Date: Fri, 12 Aug 2005 22:29:13 +0300 (EEST)
Message-ID: <47285.62.1.10.150.1123874953.squirrel@webmail.wired-net.gr>
References: <42FB435E.2070607@effigent.net>
    <Pine.LNX.4.61.0508110835480.14365@chaos.analogic.com>
Reply-To: nanakos@wired-net.gr
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0508110835480.14365@chaos.analogic.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi all,i want to retrieve the partition table of a primary extended
partition.
My MBR partition table ,says that the LBA Partition Start sector for the
extended partition is 10281600.It is the same that i find with my C code
and through fdisk usage.
How can i use this value to seek(lseek) to this point through the main
block file (/dev/hda or /dev/hdb) and read the partition table of the
logical partition?



Thanks in advance.

