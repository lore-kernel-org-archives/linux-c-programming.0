From: rinku rathore <rinku_ques@yahoo.com>
Subject: RE:exit(42)
Date: Sun, 26 Sep 2004 22:59:40 -0700 (PDT)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040927055940.98483.qmail@web53006.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vger Kernel <linux-c-programming@vger.kernel.org>



this could also be the reason:
if we r working with child and parent procees then as
child get terminated it has to pas some status to the
parent that is going to exit then by using exit(42)
child give information to the parent that it is goig
to exit now having status 42.

thanx


		
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - Send 10MB messages!
http://promotions.yahoo.com/new_mail 
