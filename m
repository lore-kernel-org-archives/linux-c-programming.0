From: "Nanakos Chrysostomos" <nanakos@wired-net.gr>
Subject: superblock & inode's
Date: Tue, 26 Jul 2005 19:53:07 +0300 (EEST)
Message-ID: <40710.62.1.10.61.1122396787.squirrel@webmail.wired-net.gr>
References: <Pine.LNX.4.61.0507250842380.3913@praktifix.dwd.de>
    <17125.51475.763052.283552@cerise.gclements.plus.com>
    <Pine.LNX.4.61.0507260638110.22613@praktifix.dwd.de>
Reply-To: nanakos@wired-net.gr
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0507260638110.22613@praktifix.dwd.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi all,
i want to read the superblock & inode for a block device.
I dont want to use readdir to get the inode and dir name.I want to do it
like the skeleton below,can someone help me??


#include <sys/types.h>
#include <stdio.h>

int main()
{

struct what_struct d; /* What struct to use for inode*/
struct what_struct_sb sb; /*What struct to use for superblock */
int fd;

fd=open("/dev/hda1",0);
lseek(fd,4096L,0); /* Is this the first inode?? Where is the next one?*/
/*Where is the superblock allocated in the disk */
read(fd,&d,sizeof(d));
/*Retrieve information now ....*/

return 0;
}


Can i have a working example please???
Thanks in advance.




