From: "Vineet Joglekar" <vintya@excite.com>
Subject: is there any prob in accessing new field added to inode mem structure, in some other functions?
Date: Wed, 15 Dec 2004 11:29:32 -0500 (EST)
Message-ID: <20041215162932.AB4C03DDD@xprdmailfe11.nwk.excite.com>
Reply-To: vintya@excite.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


Hi all,

I am using linux 2.4.21 and I am trying to play with the etx2 file system. My aim is to allocate a data structure dynamically to every file that is opened, at the time of opening.
What I tried to do was: added the structure pointer in the inode data structure "ext2_inode" say "x_ptr". In the function "ext2_read_inode" which reads the hard disk copy of inode into memory, I allocated memory to this pointer and filled the appropriate value. I chose this function as I thought when a file is opened, this function will be always called once. Upto this is working fine.

Now when I try to use this pointer "x_ptr" in some other function, that is, "do_generic_file_read" - which is called while reading a file, I am not getting any value in that pointer, but a null. (which is supposed to be there as I am filling up appropriate value in function ext2_read_inode)
In the do_generic_file_read, VFS inode is availavle, so I am trying to access my pointer as inode->u.ext2_i.x_ptr and I had accessed this pointer in the same way while allocating memory for it in read_inode. At the same time, in do_generic_file_read, I can access other inode parameters, but not this new one added.

Can someone please tell me where am I going wrong, or what could be the alternate solution to achieve this? This is very important for me.

Thanks and regards,

Vineet

_______________________________________________
Join Excite! - http://www.excite.com
The most personalized portal on the Web!
