From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: superblock & inode's
Date: Tue, 26 Jul 2005 12:59:43 -0400 (EDT)
Message-ID: <Pine.LNX.4.63.0507261259010.31248@virtwinxp02.rdmcorp.com>
References: <Pine.LNX.4.61.0507250842380.3913@praktifix.dwd.de>   
 <17125.51475.763052.283552@cerise.gclements.plus.com>   
 <Pine.LNX.4.61.0507260638110.22613@praktifix.dwd.de>
 <40710.62.1.10.61.1122396787.squirrel@webmail.wired-net.gr>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <40710.62.1.10.61.1122396787.squirrel@webmail.wired-net.gr>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nanakos Chrysostomos <nanakos@wired-net.gr>
Cc: linux-c-programming@vger.kernel.org

On Tue, 26 Jul 2005, Nanakos Chrysostomos wrote:

> Hi all,
> i want to read the superblock & inode for a block device.
> I dont want to use readdir to get the inode and dir name.I want to do it
> like the skeleton below,can someone help me??
>
>
> #include <sys/types.h>
> #include <stdio.h>
>
> int main()
> {
>
> struct what_struct d; /* What struct to use for inode*/
> struct what_struct_sb sb; /*What struct to use for superblock */
> int fd;
>
> fd=open("/dev/hda1",0);
> lseek(fd,4096L,0); /* Is this the first inode?? Where is the next one?*/
> /*Where is the superblock allocated in the disk */
> read(fd,&d,sizeof(d));
> /*Retrieve information now ....*/
>
> return 0;
> }

your best bet is to get a copy of the kernel source and check out the
directory fs/ext3, particularly the source files super.c and inode.c.

rday
