From: "Vineet Joglekar" <vintya@excite.com>
Subject: Problem in accessing executable files
Date: Tue,  1 Feb 2005 08:58:57 -0500 (EST)
Message-ID: <20050201135857.154ED1E491@xprdmailfe25.nwk.excite.com>
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



since the routines do_generic_file_read and do_generic_file_write are used in reading and writing, I am decrypting and encrypting the data in the resp. functions. This is working fine for regular data files. If I try to copy / execute executable files, I am getting segmentation fault. In kernel messages, I see same functions (read and write) getting called for the executables also. If I comment encrypt/decrypt functions, its working fine.



Now since it is working for regular text files, I suppose there is not a problem in my encrypt/decrypt routines, then what might be going wrong?



Thanks and regards,



Vineet

_______________________________________________
Join Excite! - http://www.excite.com
The most personalized portal on the Web!
