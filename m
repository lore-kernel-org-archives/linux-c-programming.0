From: "Vineet Joglekar" <vintya@excite.com>
Subject: Adding a field to ext2_dir_entry_2
Date: Mon,  4 Apr 2005 18:54:42 -0400 (EDT)
Message-ID: <20050404225442.52A7AB730@xprdmailfe18.nwk.excite.com>
Reply-To: vintya@excite.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel=40m.gmane.org-S261463AbVDDW4s@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-c-programming@vger.kernel.org




Hi All,



I working with linux kernel 2.4.28. I want to add 1 more field to ext2_dir_entry_2 - the new version of directory entry for ext2fs.



I did add the __u32 field to the struct ext2_dir_entry_2 defined in  ext2_fs.h I also modified the EXT2_DIR_REC_LEN macro to:



(((name_len) + 12 + EXT2_DIR_ROUND) & ~EXT2_DIR_ROUND)



(+12 instead of +8) to incorporate newly added 4 bytes field.



I made the similar changes to the mke2fs utility also.



When I try to copy a file on that file system, I am getting the following error:



"ext2-fs error (device fd(2,0)): ext2_check_page: bad entry in directory #2: unaligned directory entry - offset=0, inode=2, rec_len=46, name_len=0"



Can someone please tell me where am I going wrong or what other changes do I need to do to add the field I want?



Thanks and regards,



Vineet Joglekar

_______________________________________________
Join Excite! - http://www.excite.com
The most personalized portal on the Web!
