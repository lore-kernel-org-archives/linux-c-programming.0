From: "Vineet Joglekar" <vintya@excite.com>
Subject: Can I allocate few bytes in a file to store info about that file; not visible to user?
Date: Mon, 26 Apr 2004 10:32:41 -0400 (EDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040426143241.376E2197372@xprdmailfe3.nwk.excite.com>
Reply-To: vintya@excite.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


Hi all,

In ext2fs, while creating a file, can I allocate a number of bytes for that file in advance, such that those bytes are not seen by the user? that is,

suppose I am creating a new file temp, then allocate 50 bytes immediately after creating the file. I want to use those bytes to store the file related info; accessible only to kernel. Whatever data user wants to add, will be added after the these 50 bytes. If user does lseek(fd,0,SEEK_SET), then the file pointer should point to the 51st byte. The 1st 50 bytes shouldnt be visible to user. I dont care if the file size is shown as userdata+50. Is it possible to achieve? If yes, how?

Thanks and regards,

Vineet

_______________________________________________
Join Excite! - http://www.excite.com
The most personalized portal on the Web!
