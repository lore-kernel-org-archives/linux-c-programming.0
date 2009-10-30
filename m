From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: bare minimum SMTP implementation
Date: Fri, 30 Oct 2009 20:45:54 +0000
Message-ID: <19179.20610.797481.859834@cerise.gclements.plus.com>
References: <19475730.21256910810841.JavaMail.root@wombat>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <19475730.21256910810841.JavaMail.root@wombat>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: darshan.ghumare@gmail.com
Cc: linux-c-programming@vger.kernel.org


darshan.ghumare@gmail.com wrote:

> In my project one thread will have a task to send mail. It can be
> send to say gmail also.
> But if you try to connect smtp.gmail.cm@25 then after greeting gmail
> ask you to setup SSL.
> I have search a lot for SMTP implementation that support STARTTLS,
> many of them consume about 800+kb. As my project is run on embedded
> system this is not feasible to me.
> If anybody knows any implementation that support above STARTTLS
> still consume less memory?
> Many of them ask for OpenSSL but that consume 800kb+ memory hence
> not feasible for me.

	http://www.google.com/search?q=embedded%20SSL

-- 
Glynn Clements <glynn@gclements.plus.com>
