From: darshan.ghumare@gmail.com
Subject: bare minimum SMTP implementation
Date: Fri, 30 Oct 2009 09:53:30 -0400
Message-ID: <19475730.21256910810841.JavaMail.root@wombat>
Reply-To: darshan.ghumare@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

In my project one thread will have a task to send mail. It can be send to say gmail also.
But if you try to connect smtp.gmail.cm@25 then after greeting gmail ask you to setup SSL.
I have search a lot for SMTP implementation that support STARTTLS, many of them consume about 800+kb. As my project is run on embedded system this is not feasible to me.
If anybody knows any implementation that support above STARTTLS still consume less memory?
Many of them ask for OpenSSL but that consume 800kb+ memory hence not feasible for me.

Thank you very much

Regards
Darshan



--
This message was sent on behalf of darshan.ghumare@gmail.com at openSubscriber.com
http://www.opensubscriber.com/messages/linux-c-programming@vger.kernel.org/topic.html
