From: "Vineet Joglekar" <vintya@excite.com>
Subject: when and where shall I encrypt dentry?
Date: Wed,  2 Feb 2005 08:49:01 -0500 (EST)
Message-ID: <20050202134901.9926C3E12@xprdmailfe6.nwk.excite.com>
Reply-To: vintya@excite.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-c-programming@vger.kernel.org


Hi all,



I am trying to add some cryptographic functionality to ext2 file system for my masters project. I am working with kernel 2.4.21



Along with regular files, I intend to encrypt directory contents too. For reading I guess the function ext2_get_page in fs/ext2/dir.c is used. Hence I can put my decryption routine in that function. Is that correct?



I was trying to look for the routine which writes the dentry on disk, but was unable to find it. I found out that the function d_instantiate is used to fill in inode information for a dentry, but unable to see when it is written on disk. I suppose that I have to encrypt the dentry just before writing on to the disk, as if i encrypt it before, other functions using it wont be able to access until they decrypt. So please help me with this, that when and where shall I encrypt the directory contents.



Thanks and regards,



Vineet

_______________________________________________
Join Excite! - http://www.excite.com
The most personalized portal on the Web!
