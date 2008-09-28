From: Shriramana Sharma <samjnaa@gmail.com>
Subject: OT: Why does mount -o remount uid= not change the uid	in the mounted
 partition?
Date: Sun, 28 Sep 2008 10:31:13 +0530
Message-ID: <48DF0F99.8020902@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

Hello I tried asking this elsewhere but got no response so turning back 
to my friends here though this is OT.

/dev/sdb1 is a VFAT partition. Now see:

[samjnaa:/mnt] sudo mount /dev/sdb1 /mnt/sdb1
[samjnaa:/mnt] ls sdb1 -l
total 28
drwxr-xr-x 7 root root 4096 2008-08-06 15:07 apps
...
drwxr-xr-x 2 root root 4096 2008-08-07 11:07 uload
[samjnaa:/mnt] sudo mount /dev/sdb1 /mnt/sdb1 -o remount,uid=samjnaa
[samjnaa:/mnt] ls sdb1 -l
total 28
drwxr-xr-x 7 root root 4096 2008-08-06 15:07 apps
...
drwxr-xr-x 2 root root 4096 2008-08-07 11:07 uload

Account to the mount manpage, -o remount is "commonly used to change the 
mount flags for a file system" but why does it then not change the uid?

If I fully umount the partition and do another clean mount with -o 
uid=samjnaa, I get the desired result, but why doesn't remount work?

Shriramana Sharma.
