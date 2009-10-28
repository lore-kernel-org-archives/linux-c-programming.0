From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: How to send mail from C program on Linux
Date: Wed, 28 Oct 2009 21:35:51 +0000
Message-ID: <19176.47415.693229.280044@cerise.gclements.plus.com>
References: <20669019.01256731758094.JavaMail.root@wombat>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20669019.01256731758094.JavaMail.root@wombat>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: darshan.ghumare@gmail.com
Cc: linux-c-programming@vger.kernel.org


darshan.ghumare@gmail.com wrote:

> In my project I need to send mail on Linux.

Use "sendmail" (historically /usr/lib/sendmail, although
/usr/sbin/sendmail is common on Linux). MTAs other than sendmail
normally provide a script or program named "sendmail" for
compatibility.

> I have used sendmail to send mail but there are failed to send mail to my gmail account.

You need to look into *why* the message wasn't received.

The first thing to check is that the daemon is running. Otherwise, the
message will be placed in the outbound mail queue and stay there
forever.

If it's because either gmail or your ISP insist that you send mail via
their SMTP server, then configure your mail server to do so (the
details depend upon the particular software).

Alternatively, your program could speak SMTP directly to a specified
server, but that will fail if either the mail server or your internet
connection is down at the point that the program tries to send mail. 
Running a local MTA eliminates this problem; the program will always
be able to send the message, even if it cannot be delivered
immediately.

-- 
Glynn Clements <glynn@gclements.plus.com>
