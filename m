From: lsorense@csclub.uwaterloo.ca (Lennart Sorensen)
Subject: Re: fdisk & LBA
Date: Fri, 12 Aug 2005 17:11:58 -0400
Message-ID: <20050812211158.GQ6714@csclub.uwaterloo.ca>
References: <42FB435E.2070607@effigent.net> <Pine.LNX.4.61.0508110835480.14365@chaos.analogic.com> <47285.62.1.10.150.1123874953.squirrel@webmail.wired-net.gr> <20050812194531.GL31019@csclub.uwaterloo.ca> <40145.62.1.12.3.1123879702.squirrel@webmail.wired-net.gr>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <40145.62.1.12.3.1123879702.squirrel@webmail.wired-net.gr>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nanakos Chrysostomos <nanakos@wired-net.gr>
Cc: linux-c-programming@vger.kernel.org

On Fri, Aug 12, 2005 at 11:48:22PM +0300, Nanakos Chrysostomos wrote:
> Yes,the sector size is 512 bytes,but this is not the beginning of my
> fourth partition.Please check the code below,and if you can please test
> it..
> 
> mbr.c
> ------
> #include <fcntl.h>
> #include <stdio.h>
> #include <stdlib.h>
> #include <sys/types.h>
> 
> 
> struct mbr {
>         unsigned char boot_indicator;
>         unsigned char s_head;
>         unsigned char s_sector;
>         unsigned char s_cylinder;
>         unsigned char f_desc;
>         unsigned char e_head;
>         unsigned char e_sector;
>         unsigned char e_cylinder;
>         unsigned int rs_sector;
>         unsigned int n_sectors;
> } __attribute__((packed));
> 
> 
> 
> int main()
> {
>         int fd;
>         struct mbr s;
> 
> 
>         fd= open("/dev/hdb",O_RDONLY);
>         lseek(fd,0x01ee,SEEK_SET); /* This is the 4rth entry,extended for
> me*/
>         read(fd,&s,sizeof(struct mbr));
> 
>         printf("Partition Entry 1:\n");
>         printf("Boot Indicator: %#x\n",s.boot_indicator);
>         printf("Starting head %u, cylinder %u, sector
> %u.\n",s.s_head,((s.s_sector &
> 0xc0)<<2)+s.s_cylinder,s.s_sector&0x3f);
>         printf("Filesystem descriptor: %#x\n",s.f_desc);
>         printf("Ending head %u, cylinder %u, sector
> %u.\n",s.e_head,((s.e_sector & 0xc0)<<2)+
> s.e_cylinder,s.e_sector&0x3f);
>         printf("Starting sector: %u\n",s.rs_sector);
>         printf("Number of sectors in partition: %u\n",s.n_sectors);
> 
>         fd= open("/dev/hdb4",O_RDONLY); /* Where is this in hdb,offset??*/

It is wherever the partition entry in sector 0 of hdb says partition 4
starts.

Why didn't you just print all the partition table entries above rather
than just #1, especially since in this case it is number 4 you care
about.

Print out the start sector number for partition 4 above and you should
find the offset for the extended partition table, in the cases where
partition 4 is the extended partition.

Seek to that location, read the partition table there.  That should
contain either just a primary partition, or a primary partition and
another extended partition.

In case it had another extended partition, repeat until no more extended
partitions found.

>         lseek(fd,446L,SEEK_SET);
>         read(fd,&s,sizeof(struct mbr));
> 
>         printf("\nPartition Entry 4: Extended partition\n");
>         printf("Boot Indicator: %#x\n",s.boot_indicator);
>         printf("Starting head %u, cylinder %u, sector
> %u.\n",s.s_head,((s.s_sector &
> 0xc0)<<2)+s.s_cylinder,s.s_sector&0x3f);
>         printf("Filesystem descriptor: %#x\n",s.f_desc);
>         printf("Ending head %u, cylinder %u, sector
> %u.\n",s.e_head,((s.e_sector & 0xc0)<<2)+
> s.e_cylinder,s.e_sector&0x3f);
>         printf("Starting sector: %u\n",s.rs_sector);
>         printf("Number of sectors in partition: %u\n",s.n_sectors);
> 
>         return 0;
> }

Say you had this partition table:
         start sector    number of sectors
pri1     1               10 (hda1)
pri2     11              20 (hda2)
pri3     31              10 (hda3)
pri4     41              100 (extended)

then at sector 41 you would find another partition table:
pri1     42              9 (hda5)
pri2     51              90 (extended)

Then sector 51 contains a partition table:
pri1     52              19 (hda6)
pri2     71              70 (extended)

Then sector 71 has a partition table:
pri1     72              69 (hda7)

And no more extended entries, so you are done.

C/H/S entries are entirely ignored (or should be) on modern drives.
Only start sector and total sectors are relevant as far as I understand
things.

Len Sorensen
