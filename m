From: "Nanakos Chrysostomos" <nanakos@wired-net.gr>
Subject: Re: fdisk & LBA
Date: Fri, 12 Aug 2005 23:48:22 +0300 (EEST)
Message-ID: <40145.62.1.12.3.1123879702.squirrel@webmail.wired-net.gr>
References: <42FB435E.2070607@effigent.net>
    <Pine.LNX.4.61.0508110835480.14365@chaos.analogic.com>
    <47285.62.1.10.150.1123874953.squirrel@webmail.wired-net.gr>
    <20050812194531.GL31019@csclub.uwaterloo.ca>
Reply-To: nanakos@wired-net.gr
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050812194531.GL31019@csclub.uwaterloo.ca>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lennart Sorensen <lsorense@csclub.uwaterloo.ca>
Cc: linux-c-programming@vger.kernel.org

Yes,the sector size is 512 bytes,but this is not the beginning of my
fourth partition.Please check the code below,and if you can please test
it..

mbr.c
------
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>


struct mbr {
        unsigned char boot_indicator;
        unsigned char s_head;
        unsigned char s_sector;
        unsigned char s_cylinder;
        unsigned char f_desc;
        unsigned char e_head;
        unsigned char e_sector;
        unsigned char e_cylinder;
        unsigned int rs_sector;
        unsigned int n_sectors;
} __attribute__((packed));



int main()
{
        int fd;
        struct mbr s;


        fd= open("/dev/hdb",O_RDONLY);
        lseek(fd,0x01ee,SEEK_SET); /* This is the 4rth entry,extended for
me*/
        read(fd,&s,sizeof(struct mbr));

        printf("Partition Entry 1:\n");
        printf("Boot Indicator: %#x\n",s.boot_indicator);
        printf("Starting head %u, cylinder %u, sector
%u.\n",s.s_head,((s.s_sector &
0xc0)<<2)+s.s_cylinder,s.s_sector&0x3f);
        printf("Filesystem descriptor: %#x\n",s.f_desc);
        printf("Ending head %u, cylinder %u, sector
%u.\n",s.e_head,((s.e_sector & 0xc0)<<2)+
s.e_cylinder,s.e_sector&0x3f);
        printf("Starting sector: %u\n",s.rs_sector);
        printf("Number of sectors in partition: %u\n",s.n_sectors);

        fd= open("/dev/hdb4",O_RDONLY); /* Where is this in hdb,offset??*/
        lseek(fd,446L,SEEK_SET);
        read(fd,&s,sizeof(struct mbr));

        printf("\nPartition Entry 4: Extended partition\n");
        printf("Boot Indicator: %#x\n",s.boot_indicator);
        printf("Starting head %u, cylinder %u, sector
%u.\n",s.s_head,((s.s_sector &
0xc0)<<2)+s.s_cylinder,s.s_sector&0x3f);
        printf("Filesystem descriptor: %#x\n",s.f_desc);
        printf("Ending head %u, cylinder %u, sector
%u.\n",s.e_head,((s.e_sector & 0xc0)<<2)+
s.e_cylinder,s.e_sector&0x3f);
        printf("Starting sector: %u\n",s.rs_sector);
        printf("Number of sectors in partition: %u\n",s.n_sectors);

        return 0;
}



