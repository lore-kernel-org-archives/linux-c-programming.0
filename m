From: "Vineet Joglekar" <vintya@excite.com>
Subject: How to allocate few bytes to a file automatically after creating it?
Date: Wed, 12 May 2004 21:53:53 -0400 (EDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040513015353.37BCC1E453@xprdmailfe25.nwk.excite.com>
Reply-To: vintya@excite.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


My aim is to allocate few bytes to a file; with some valid data in it as soon as it is created. Will the following approach work?

Calling the function ext2_direct_IO() with the appropriate parameters after creating a new inode. The appro. parameters are rw flag, inode, iobuf, blocknr, blocksize.
If I want to add just 100 bytes to the file, I guess blocknr should be 1 and blocksize should be 512 or 1024 .. is that right? Also, how to fill in  "iobuf" which is of the type "struct kiobuf *" to add these 100 bytes?

Please help.. I am trying to work on this problem for a long time now.

Thanks and regards,

Vineet

_______________________________________________
Join Excite! - http://www.excite.com
The most personalized portal on the Web!
