From: kaushal <kaushal@rocsys.com>
Subject: SIGSEGV
Date: Wed, 02 Mar 2005 17:50:28 +0530
Message-ID: <1109766028.5107.5.camel@localhost.localdomain>
Reply-To: kaushal@rocsys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c <linux-c-programming@vger.kernel.org>

Hello all,
	I have big package which "must" run all the time irrespective of any
errors.As a part of that Iam even handling the SIGSEGV.The problem is
even if I handle the sigsegv,the handler gets called continuously in an
infinite loop as if the signal is being recvd. continuously.How can I
solve this issue and make my handle run only once?Does bash has such a
mechanism internally?Any suggestions would be very helpful.
Thanks in advance.

kaushal.

