From: "Vineet Joglekar" <vintya@excite.com>
Subject: Re: Adding a field to ext2_dir_entry_2
Date: Mon,  4 Apr 2005 20:08:57 -0400 (EDT)
Message-ID: <20050405000857.0C26B8AEAC@xprdmailfe2.nwk.excite.com>
Reply-To: vintya@excite.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org
Cc: adilger@clusterfs.com


Hi Andreas,



I have created another file system - copied everything from ext2, renaming it as some different file system and doing some experiments on that.



Let me be more clear about what I am trying to do. In my masters project, I am encrypting inodes along with the data part of the file. Keys of different users are different. In the same directory, if there are 2 files stored by different users, their inodes will be encrypted with different keys. If user1 is doing "ls" on that directory, the inode of the other file - which is encrypted by user2, will be decrypted by using user1's key, resulting into garbage. To avoid this, I am trying to store the uid in the directry entry, so that  I can match it with current->fsuid and skip decrypting the inode if the file doesn't belong to the current user. (assuming user1 doesnt want to share that file and different users can store different files under same directory.)



Thanks and regards,



Vineet



 --- On Mon 04/04, Andreas Dilger < adilger@clusterfs.com > wrote:

From: Andreas Dilger [mailto: adilger@clusterfs.com]

To: vintya@excite.com

     Cc: linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org

Date: Mon, 4 Apr 2005 17:17:59 -0600

Subject: Re: Adding a field to ext2_dir_entry_2



On Apr 04, 2005  18:54 -0400, Vineet Joglekar wrote:<br>> I working with linux kernel 2.4.28. I want to add 1 more field to<br>> ext2_dir_entry_2 - the new version of directory entry for ext2fs.<br>> <br>> I did add the __u32 field to the struct ext2_dir_entry_2 defined in<br>> ext2_fs.h I also modified the EXT2_DIR_REC_LEN macro to:<br>> <br>> (((name_len) + 12 + EXT2_DIR_ROUND) & ~EXT2_DIR_ROUND)<br>> <br>> (+12 instead of +8) to incorporate newly added 4 bytes field.<br>> <br>> I made the similar changes to the mke2fs utility also.<br><br>This means your filesystem will not be mountable by any other version of<br>Linux.  What is more important is why you want to do this - there are<br>other mechanisms that may be more appropriate depending on what you are<br>doing.<br><br>Cheers, Andreas<br>--<br>Andreas Dilger<br>Principal Software Engineer<br>Cluster File Systems, Inc.<br><br>Attach
 ment: Attachment  (0.19KB)<br>

_______________________________________________
Join Excite! - http://www.excite.com
The most personalized portal on the Web!
