From: "Vineet Joglekar" <vintya@excite.com>
Subject: Re: To Charlie : How to allocate few bytes to a file automatically after creating it?
Date: Fri, 14 May 2004 11:52:06 -0400 (EDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040514155206.047A81BCFC@xprdmailfe23.nwk.excite.com>
Reply-To: vintya@excite.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


my goal is to store some metadata in a file as soon as its created. I am trying to make some changes in the file system, so it has to be at the file system level. User need not know that i am writing this matadata to every file created. so the picture is like when an inode is created for the new file, 1st entry in the data block pointers should be valid with some info in the allocated data block.

Thanks and regards,

Vineet

>If your goal is to make sure the file is non empty, with >correct contents, as soon as it appears in the file system, the >classical method is to create a new file with a temporary name >with open(), write appropriate contents to it with write(), >close it, and then rename it to the correct name with rename(), >an atomic change to most file systems.  The only constraint is >that the file be created in the same file system.If this >doesn't solve your problem, what did I miss ?

_______________________________________________
Join Excite! - http://www.excite.com
The most personalized portal on the Web!
