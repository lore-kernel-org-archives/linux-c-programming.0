From: rinku rathore <rinku_ques@yahoo.com>
Subject: corrected:what is fcntl function
Date: Mon, 4 Oct 2004 01:38:39 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20041004083839.61843.qmail@web53008.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vger Kernel <linux-c-programming@vger.kernel.org>

Hello,
Actually,I wanted specifically about the following
fcntl functions,listed below,here fd is file
descriptor

fcntl (fd, F_SETOWN, getpid());

fcntl (fd, F_SETFL,fcntl (fd, F_GETFL, NULL) |
O_ASYNC));

Rinku


		


		
__________________________________
Do you Yahoo!?
Yahoo! Mail is new and improved - Check it out!
http://promotions.yahoo.com/new_mail
