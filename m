From: a.biardi@tiscali.it
Subject: argv[0]
Date: Fri, 13 Jan 2006 00:16:23 +0100
Message-ID: <200601130016.23410.a.biardi@tiscali.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Hi,

Is there any C function that can tell me what argv[0] is, outside 
main()?

I thought to use getpid() and then look at /proc/<pid>/cmdline but 
doesn't seem portable. Any hints?

Thanks,
Andrea.
