From: "Vineet Joglekar" <vintya@excite.com>
Subject: Implementation of read( )
Date: Mon, 26 Jan 2004 15:16:55 -0500 (EST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040126201655.DBEB51E447@xprdmailfe25.nwk.excite.com>
Reply-To: vintya@excite.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org


Hi all,

I dont know if this question is relevant on this mailing list, but please do help me out if you can.

For my project, I need to trace the read() function call till the VFS level. I have read that read() makes the kernel invoke sys_read() and I want to do the same thing with some additional functionalities. Where can i get the implementation of the read() function so that on the parallel lines I will be able to write my own my_read() function which in turn will call the sys_read() too?

Thanks and regards,

Vineet


_______________________________________________
Join Excite! - http://www.excite.com
The most personalized portal on the Web!
