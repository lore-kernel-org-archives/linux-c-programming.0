From: Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>
Subject: RE: deletion in singly linked list--pls resend replies
Date: Wed, 24 Nov 2004 09:28:08 +0530
Message-ID: <1101268688.3786.50.camel@myLinux>
References: <5959EA4638D8734599AB75EAAFBB6FEFA471DD@mtv01ex04.mindtree.com>
	 <1101203754.3786.54.camel@myLinux>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1101203754.3786.54.camel@myLinux>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bakki Srinivas <bakki_srinivas@mindtree.com>
Cc: mikael-aronsson <mikael-aronsson@telia.com>, Justinas <jugu3479@uosis.mif.vu.lt>, Linux C Programming <linux-c-programming@vger.kernel.org>

On Tue, 2004-11-23 at 15:05, Bakki Srinivas wrote:
> Until and unless u free the memory obtained by malloc,the address space is
> still in the process address space.

Even if i do free it, where will the address A->next point to. Since it
is not inside the process address space, wont that segfault??


NB: My mail server was down yesterday :-(. If anyone of u had sent any
replies, pls do resend it.

-- 
Jagadeesh Bhaskar P <jbhaskar@hclinsys.com>

