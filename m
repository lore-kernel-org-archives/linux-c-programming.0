From: "Vineet Joglekar" <vintya@excite.com>
Subject: Filesystem as a module?
Date: Fri, 12 Mar 2004 18:02:57 -0500 (EST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040312230257.B06123DE6@xprdmailfe11.nwk.excite.com>
Reply-To: vintya@excite.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


Hi all,

I am trying to add some functionalities to ext2 filesystem, and use it as a module. Till now what I did is:
1: Copied the ext2 files and made the approprate changes
2: Copied files from usr/src/linux/fs/ directory
3: Copied relevant header files in /include/linux directory

The module gets compiled properly, but when I try to insert it using insmod, I am getting following errors like:

my_extv2.o: unresolved symbol generic_file_read_Rsmp_106b3732
my_extv2.o: unresolved symbol __get_free_pages_Rsmp_4784e424
my_extv2.o: unresolved symbol try_inc_mod_count_Rsmp_e6105b23
my_extv2.o: unresolved symbol blk_size_Rsmp_a2e0a082
my_extv2.o: unresolved symbol pidhash_Rsmp_4439d880
my_extv2.o: unresolved symbol floppy_eject
my_extv2.o: unresolved symbol smp_num_siblings

etc... and many more on the similar lines.

Whats wrong with my approach or do I need to add / modify few things?

Thanks and regards,

Vineet

_______________________________________________
Join Excite! - http://www.excite.com
The most personalized portal on the Web!
