From: JOSEPH ALPHONSE <JOSEPHA@nestec.net>
Subject: RE: Detecting whether a Message Queue with a given qid exists?
Date: Mon, 31 Oct 2005 12:45:39 +0530
Message-ID: <F6DF02592EE6A64D9B5F4928984DAA6A0124A760@mail-kdpm.kdpm.nestec.net>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rajat Jain <rajat.noida.india@gmail.com>, linux-c-programming@vger.kernel.org

Hi all,
	send the command "ipcs -q "
	
	u will get a list of queues	
	grep from the list to get the required id

Thanks 
Joseph

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org]On Behalf Of Rajat Jain
Sent: Monday, October 31, 2005 12:41 PM
To: linux-c-programming@vger.kernel.org
Subject: Detecting whether a Message Queue with a given qid exists?


Hi,

This is the reagrding the message queue mecahnism of sys V IPC.

Is there a way to find out that whether a message queue with a
particular qid exists?

Thanks,

Rajat
-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


---------------------------------------------------------------------------
       "This e-mail and any files transmitted with it are for the sole use
of the intended recipient(s) and may contain confidential and privileged
information. If you are not the intended recipient, please contact the
sender by reply e-mail and destroy all copies of the original message.

       Any unauthorized review, use, disclosure, dissemination, forwarding,
printing or copying of this email or any action taken upon this e-mail is
strictly prohibited and may be unlawful."
---------------------------------------------------------------------------
