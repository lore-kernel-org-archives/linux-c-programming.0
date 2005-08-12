From: lsorense@csclub.uwaterloo.ca (Lennart Sorensen)
Subject: Re: fdisk & LBA
Date: Fri, 12 Aug 2005 15:45:31 -0400
Message-ID: <20050812194531.GL31019@csclub.uwaterloo.ca>
References: <42FB435E.2070607@effigent.net> <Pine.LNX.4.61.0508110835480.14365@chaos.analogic.com> <47285.62.1.10.150.1123874953.squirrel@webmail.wired-net.gr>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <47285.62.1.10.150.1123874953.squirrel@webmail.wired-net.gr>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nanakos Chrysostomos <nanakos@wired-net.gr>
Cc: linux-c-programming@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Aug 12, 2005 at 10:29:13PM +0300, Nanakos Chrysostomos wrote:
> Hi all,i want to retrieve the partition table of a primary extended
> partition.
> My MBR partition table ,says that the LBA Partition Start sector for the
> extended partition is 10281600.It is the same that i find with my C code
> and through fdisk usage.
> How can i use this value to seek(lseek) to this point through the main
> block file (/dev/hda or /dev/hdb) and read the partition table of the
> logical partition?

Multiply by the sector size (probably 512 bytes).

Len Sorensen
