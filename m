From: Vadiraj C S <vadiraj@mail.cyberneme.com>
Subject: Re: Can I allocate few bytes in a file to store info about that
 file; not visible to user?
Date: Thu, 29 Apr 2004 09:28:07 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040429092807.173ac98d.vadiraj@mail.cyberneme.com>
References: <20040428181507.B489EB786@xprdmailfe20.nwk.excite.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040428181507.B489EB786@xprdmailfe20.nwk.excite.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: vintya@excite.com
Cc: linux-c-programming@vger.kernel.org

> 
> I was going through the functions like generic_file_write, generic_file_direct_IO, generic_direct_IO and filemap_fdatasync. I was thinking about calling these functions or calling functions written on similar lines to add new few bytes to the file when the inode is created by "ext2_create()". Can any1 please tell me how to do this?
> 
> I guess it would have been simpler to call these functions in the call sys_open() when a new file is created, but I want to make changes in kernel code only in ext2 module. playing with sys_open will be like modifying kernel code apart from the ext2 fs module which I dont want.

 If you need the kernel to read your information, you can write your own open() for the module, if you have good hold on filesystem
then this wont be much scary. ext2 filesystem stores all the information in an inode, now you want to write some more at the start
of the datablock.  



-- 

With Best Regards
 Vadiraj C S    
