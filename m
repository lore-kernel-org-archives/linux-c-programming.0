From: "Vineet Joglekar" <vintya@excite.com>
Subject: How to write/copy kernel data in newly allocated cache page?
Date: Wed, 19 May 2004 21:44:53 -0400 (EDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040520014453.7611FB6D5@xprdmailfe20.nwk.excite.com>
Reply-To: vintya@excite.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


Hi all,

While working at the kernel level, I want to write some data to the file without user knowing about it.
I guess I can allocate a new page using "__grab_cache_page()" and write/copy that data to the newly allocated page. The page will be eventually written to the file.
If this idea sounds practical, how do I write/copy the data at kernel level to that newly allocated page?

Vineet


_______________________________________________
Join Excite! - http://www.excite.com
The most personalized portal on the Web!
