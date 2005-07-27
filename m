From: sumit kalra <i_am_sumit_kalra@yahoo.com>
Subject: Re: superblock & inode's
Date: Wed, 27 Jul 2005 06:21:28 +0100 (BST)
Message-ID: <20050727052128.96647.qmail@web61017.mail.yahoo.com>
References: <40710.62.1.10.61.1122396787.squirrel@webmail.wired-net.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <40710.62.1.10.61.1122396787.squirrel@webmail.wired-net.gr>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: nanakos@wired-net.gr, linux-c-programming@vger.kernel.org

Hi,

> lseek(fd,4096L,0); /* Is this the first inode??
> Where is the next one?*/
> /*Where is the superblock allocated in the disk */
The location of the superblock and the inodes
(including the first one) depend on the kind of
filesystem you have on the disk. Some filesystems have
the superblock immediately after the boot block
(ext2/3) and others may not have it at all (NTFS).

Also the structure of on-disk superblocks and inodes
vary with each filesystem.

If you know which filesystem your disk has then you
can read in the relevent blocks. Then you can look at
the filesystem code and find out what data structure
defines the superblock and typecast the block of data
accordingly.

I am not sure if there is a better way to do it but
this is all that came to my mind :-) 
Hope it helps,
Sumit Kalra

--- Nanakos Chrysostomos <nanakos@wired-net.gr> wrote:

> Hi all,
> i want to read the superblock & inode for a block
> device.
> I dont want to use readdir to get the inode and dir
> name.I want to do it
> like the skeleton below,can someone help me??
> 
> 
> #include <sys/types.h>
> #include <stdio.h>
> 
> int main()
> {
> 
> struct what_struct d; /* What struct to use for
> inode*/
> struct what_struct_sb sb; /*What struct to use for
> superblock */
> int fd;
> 
> fd=open("/dev/hda1",0);
> lseek(fd,4096L,0); /* Is this the first inode??
> Where is the next one?*/
> /*Where is the superblock allocated in the disk */
> read(fd,&d,sizeof(d));
> /*Retrieve information now ....*/
> 
> return 0;
> }
> 
> 
> Can i have a working example please???
> Thanks in advance.
> 
> 
> 
> 
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> 



	
	
		
___________________________________________________________ 
Yahoo! Messenger - NEW crystal clear PC to PC calling worldwide with voicemail http://uk.messenger.yahoo.com
