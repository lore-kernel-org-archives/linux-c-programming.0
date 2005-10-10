From: "Suma Choudhary" <sumac@myw.ltindia.com>
Subject: Re: just curious!
Date: Mon, 10 Oct 2005 07:55:08 +0530
Message-ID: <s34a1e7f.028@EMAIL>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: glynn@gclements.plus.com
Cc: linux-c-programming@vger.kernel.org

Thanks a lot.....

I got to know about the utmp file and the terminal device from the strace and ltrace as suggested by David Eduardo.Could even write  a small code to emulate "write".

Didnt know about "mesg" though.

Thanks again
suma

>>> Glynn Clements <glynn@gclements.plus.com> 10/08/05 12:54 PM >>>

Suma Choudhary wrote:

> I was curious to know how the "write" command works.Any IPCs used?

It determines the terminal(s) on which the specified user is logged in
from the utmp file, opens the terminal device for writing, and writes
to it.

Note that the terminal device must be group-writeable (normally
controlled using "mesg y" or "mesg n"). The write command itself is
setgid tty.

-- 
Glynn Clements <glynn@gclements.plus.com>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

