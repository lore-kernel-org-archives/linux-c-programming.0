From: "Vineet Joglekar" <vintya@excite.com>
Subject: Re: Can I allocate few bytes in a file to store info about that file; not visible to user?
Date: Wed, 28 Apr 2004 14:15:07 -0400 (EDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040428181507.B489EB786@xprdmailfe20.nwk.excite.com>
Reply-To: vintya@excite.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org



>Well, you can achieve almost anything if you're willing to spend >enough effort modifying the kernel. But what you are proposing >would be a lot of work; probably much more than you're expecting.
>--Glynn Clements <glynn.clements@virgin.net>

I was going through the functions like generic_file_write, generic_file_direct_IO, generic_direct_IO and filemap_fdatasync. I was thinking about calling these functions or calling functions written on similar lines to add new few bytes to the file when the inode is created by "ext2_create()". Can any1 please tell me how to do this?

I guess it would have been simpler to call these functions in the call sys_open() when a new file is created, but I want to make changes in kernel code only in ext2 module. playing with sys_open will be like modifying kernel code apart from the ext2 fs module which I dont want.

Thanks and regards,

Vineet

_______________________________________________
Join Excite! - http://www.excite.com
The most personalized portal on the Web!
