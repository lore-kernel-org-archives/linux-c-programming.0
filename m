From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: superblock & inode's
Date: Wed, 27 Jul 2005 08:24:58 +0100
Message-ID: <17127.14026.575904.182205@cerise.gclements.plus.com>
References: <Pine.LNX.4.61.0507250842380.3913@praktifix.dwd.de>
	<17125.51475.763052.283552@cerise.gclements.plus.com>
	<Pine.LNX.4.61.0507260638110.22613@praktifix.dwd.de>
	<40710.62.1.10.61.1122396787.squirrel@webmail.wired-net.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <40710.62.1.10.61.1122396787.squirrel@webmail.wired-net.gr>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: nanakos@wired-net.gr
Cc: linux-c-programming@vger.kernel.org


Nanakos Chrysostomos wrote:

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

The layout of a filesystem depends entirely upon the filesystem type
(ext2, vfat etc).

You should look at the source code for filesystem specific tools (e.g.
e2fsprogs, dosfstools etc) for example code.

-- 
Glynn Clements <glynn@gclements.plus.com>
